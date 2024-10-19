import 'dart:io';

import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minamakram/Screens/HomePage.dart';
import 'package:minamakram/Screens/closeBuildingPage.dart';
import 'package:minamakram/Screens/editProfilePage.dart';
import 'package:minamakram/Screens/profilePage.dart';
import 'package:minamakram/Widgets/iconWidget.dart';
import '../Widgets/requestingOrderHallFirstWidget.dart';
import '../Widgets/requestingOrderHallSecondWidget.dart';
import '../Widgets/requestingOrderHallThirdWidget.dart';
import '../Widgets/requestingOrderTimeFirstWidget.dart';
import '../Widgets/requestingOrderTimeSecondWidget.dart';
import '../Widgets/requestingOrderTimeThirdWidget.dart';
import '../constants/Language.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../main.dart';
import '../models/order/orderObject.dart';
import 'ordersPage.dart';

class mainHomePage extends StatefulWidget {
  bool isRequesting;
  mainHomePage({Key? key,required this.isRequesting}) : super(key: key);

  @override
  State<mainHomePage> createState() => _mainHomePageState();
}

class _mainHomePageState extends State<mainHomePage> {

  bool isAr = true;
  bool langShown = false;
  bool isClose = false;
  String name = "اسم الخادم";
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isHome = true;
  PreferredSizeWidget orderAppBar = AppBar();
  PreferredSizeWidget homeAppBar = AppBar();
  PreferredSizeWidget bookingAppbar = AppBar();
  PreferredSizeWidget? mainAppBar = AppBar();
  Widget body = Container();
  bool isProfile = false;
  bool isOrders = false;
  bool isRequesting = true;
  bool isEdit = false;
  late Widget firstWidget = Container();
  var warnings = ["ugukuj","jbkhbh"];

  //TODO: temporarily
  bool isAdmin = true;

  @override
  void didChangeDependencies() {

    getLocale().then((value) {
      if (value.languageCode == "ar") {
        setState(() {
          isAr = true;
        });
      } else {
        setState(() {
          isAr = false;
        });
      }
    });

    if(isEdit){
      setState(() {
        body = EditProfilePage(isAr: isAr);
        isEdit = true;
        isProfile = false;
      });
    }

    if(isRequesting){
      setState(() {
        mainAppBar = bookingAppbar;
        isHome = false;
        isRequesting = true;
        isProfile = false;
        isOrders = false;
        isEdit = false;
        isClose = false;
      });
    }

    if(isHome){
      setState(() {
        isHome = true;
        mainAppBar = homeAppBar;
        body = const homeWidget();
        isProfile = false;
        isOrders = false;
        isRequesting = false;
        isEdit = false;
        isClose = false;
      });
    }

    if(isProfile){
      setState(() {
        isHome = false;
        mainAppBar = null;
        body = profilePage(isAr: isAr,);
        isProfile = true;
        isOrders = false;
        isRequesting = false;
        isEdit = false;
        isClose = false;
      });
    }

    if(isOrders){
      setState(() {
        mainAppBar = orderAppBar;
        body = const OrderPage();
        isHome = false;
        isProfile = false;
        isOrders = true;
        isRequesting = false;
        isEdit = false;
        isClose = false;
      });
    }

    if(!receiver.isListening) {
      receiver.start();
      receiver.messages.listen((event) {
        switch (event.name){
          case "Third page":
            setState(() {
              Order order=Order();
              order.date = event.data?["date"];
              myOrder.date = event.data?["date"];
              order.activity = event.data?["activity"];
              myOrder.activity = event.data?["activity"];
              order.hallAccepted = event.data?["hall"];
              myOrder.hallAccepted = event.data?["hall"];
              order.floorAccepted = event.data?["floor"];
              myOrder.floorAccepted = event.data?["floor"];
              order.buildingAccepted = event.data?["building"];
              myOrder.buildingAccepted = event.data?["building"];
              startWidget = RequestingOrderHallSecondWidget(order: order,);
              colors[4] = MyColors.secondaryColor;
              colors[5] = MyColors.secondaryColor;
            });
            break;
          case "Fourth page":
            setState(() {
              Order order=Order();
              order.date = event.data?["date"];
              order.activity = event.data?["activity"];
              order.hallAccepted = event.data?["hall"];
              order.floorAccepted = event.data?["floor"];
              order.buildingAccepted = event.data?["building"];
              var map = event.data?["time"] as Map;
              order.times = [];
              for (var element in map.values) {
                if(element != null){
                  order.times?.add(element.toString());
                }
              }
              startWidget = RequestingOrderHallThirdWidget(order: order,);
              colors[6] = MyColors.secondaryColor;
            });
            break;
          case "second time page":
            setState(() {
              Order order=Order();
              order.date = event.data?["date"];
              order.activity = event.data?["activity"];
              var map = event.data?["times"] as Map;
              order.times = [];
              for (var element in map.values) {
                if(element != null){
                  order.times?.add(element.toString());
                }
              }
              startWidget = RequestingOrderTimeSecondWidget(order: order,);
              colors[4] = MyColors.secondaryColor;
              colors[5] = MyColors.secondaryColor;
            });
            break;
          case "third time page":
            setState(() {
              Order order=Order();
              order.date = event.data?["date"];
              myOrder.date = event.data?["date"];
              order.activity = event.data?["activity"];
              myOrder.activity = event.data?["activity"];
              var map = event.data?["times"] as Map;
              order.times = [];
              myOrder.times = [];
              for (var element in map.values) {
                if(element != null){
                  order.times?.add(element.toString());
                  myOrder.times?.add(element.toString());
                }
              }
              var mapBuilding = event.data?["buildings"] as Map;
              order.buildings = [];
              for (var element in mapBuilding.values) {
                if(element != null){
                  order.buildings?.add(element.toString());
                }
              }
              startWidget = RequestingOrderTimeThirdWidget(order: order,);
              colors[6] = MyColors.secondaryColor;
            });
            break;
          case "profile error":
            setState(() {
              isHome = true;
              mainAppBar = homeAppBar;
              body = const homeWidget();
              isProfile = false;
              isOrders = false;
              isRequesting = false;
              isEdit = false;
              isClose = false;
            });
            break;
          case "edit profile":
            setState(() {
              body = EditProfilePage(isAr: isAr);
              isEdit = true;
              isProfile = false;
              isHome = false;
              mainAppBar = null;
              isOrders = false;
              isRequesting = false;
              isClose = false;
            });
            break;
          case "go to profile":
            setState(() {
              isHome = false;
              mainAppBar = null;
              body = profilePage(isAr: isAr,);
              isProfile = true;
              isOrders = false;
              isRequesting = false;
              isEdit = false;
              isClose = false;
            });
            break;
          case "close building":
            setState(() {
              isClose = true;
              mainAppBar = getCloseBuildingBar(context);
              body = const closeBuildingPage();
              isEdit = false;
              isProfile = false;
              isHome = false;
              isOrders = false;
              isRequesting = false;
            });
            break;
          case "home":
            setState(() {
              isHome = true;
              mainAppBar = homeAppBar;
              body = const homeWidget();
              isProfile = false;
              isOrders = false;
              isRequesting = false;
              isEdit = false;
              isClose = false;
            });
            break;
        }
      });
    }

    setState(() {
      // sharedPrefsHelper helper = sharedPrefsHelper();
      // isAdmin = helper.isAdmin;
      orderAppBar = AppBar(
        title: Text(
          AppLocalizations.of(context)!.orders,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            fontFamily: 'Tajawal',
            color: MyColors.secondaryColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            setState(() {
              isHome = true;
              mainAppBar = homeAppBar;
              body = const homeWidget();
              isProfile = false;
              isOrders = false;
              isRequesting = false;
              isEdit = false;
              isClose = false;
            });
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      );
      homeAppBar = AppBar(
        automaticallyImplyLeading: false,
        actions:[

          InkWell(
            onTap: (){
              _key.currentState!.openEndDrawer();
            },
            child: const CircleAvatar(
              radius: 20.0,
              backgroundColor: Color(0xFF778899),
              // backgroundImage:
              //     NetworkImage("Your Photo Url"), // for Network image
            ),
          ),
          const SizedBox(width: 20,),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () async{
                bool res = await Navigator.pushNamed(context, notification) as bool;
                setState(() {
                  mainAppBar = res? homeAppBar: orderAppBar;
                  body = res? const homeWidget(): const OrderPage();
                  isHome = res;
                  isProfile = false;
                  isOrders = !res;
                  isRequesting = false;
                  isEdit = false;
                  isClose = false;
                });
              },
            ),
            // IconButton(
            //     onPressed: (){
            //       showDialog<String>(
            //           context: context,
            //           builder: (BuildContext context) =>
            //               AlertDialog(
            //                   content: Container(
            //                     alignment: Alignment.center,
            //                     width: 200,
            //                     height: 300,
            //                     child: ListView(
            //                       children: List.generate(warnings.length, (index) =>
            //                           Padding(
            //                             padding: const EdgeInsets.all(8.0),
            //                             child: ListTile(
            //                               leading: Text(
            //                                 warnings[index],
            //                                 textAlign: TextAlign.center,
            //                               ),
            //                             ),
            //                           )
            //                       ),
            //                     ),
            //                   )
            //               )
            //       );
            //     },
            //     icon: Icon(
            //       Icons.error,
            //       color: warnings.isNotEmpty? Colors.red:Colors.grey,
            //     )
            // )
          ],
        ),
        leading: null,
        backgroundColor: Colors.white,
      );
      bookingAppbar = AppBar(
        title: Text(
          AppLocalizations.of(context)!.booking,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            fontFamily: 'Tajawal',
            color: MyColors.secondaryColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, home,arguments: false);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      );
    });

    setState(() {
      firstWidget = Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                AppLocalizations.of(context)!.homeMessage,
                style: const TextStyle(
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: MyColors.primaryColor),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                AppLocalizations.of(context)!.pleaseEnterDetails,
                style: const TextStyle(
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: MyColors.primaryColor),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: MyColors.simpleBlue, width: 1)),
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  IconWidget(path: "assets/images/img_1.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.orderWay,
                    style: const TextStyle(
                        color: MyColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto'),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: const BorderSide(
                                color: MyColors.primaryColor,
                                width: 1
                            )
                        ),
                      ),
                      padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(15, 20, 15, 20))
                  ),
                  onPressed: () {
                    setState(() {
                      startWidget = const RequestingOrderHallFirstWidget();
                      colors[2] = MyColors.secondaryColor;
                      colors[3] = MyColors.secondaryColor;
                    });
                  },
                  child: Text(
                    AppLocalizations.of(context)!.chooseHall,
                    style: const TextStyle(
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: MyColors.primaryColor,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: const BorderSide(
                                  color: MyColors.primaryColor,
                                  width: 1
                              )
                          )
                      ),
                      padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(15, 20, 15, 20))
                  ),
                  onPressed: () {
                    setState(() {
                      startWidget = const RequestingOrderTimeFirstWidget();
                      colors[2] = MyColors.secondaryColor;
                      colors[3] = MyColors.secondaryColor;
                    });
                  },
                  child: Text(
                      AppLocalizations.of(context)!.chooseTime,
                      style: const TextStyle(
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: MyColors.primaryColor
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            )
          ],
        );
      if(colors[2] == Colors.white) {
        startWidget = firstWidget;
      }
    });

    super.didChangeDependencies();
  }

  @override
  void initState() {
    isRequesting = widget.isRequesting;
    super.initState();
  }

  Order myOrder = Order();
  List<Color> colors=[
    MyColors.secondaryColor,
    MyColors.secondaryColor,
    Colors.white,
    MyColors.simpleBlue,
    Colors.white,
    MyColors.simpleBlue,
    Colors.white
  ];

  BroadcastReceiver receiver = BroadcastReceiver(
    names: <String>[
      "First page",
      "Second page",
      "Third page",
      "Fourth page",
      "second time page",
      "third time page",
      "profile error",
      "edit profile",
      "go to profile",
      "close building",
      "home"
    ],
  );

  void goToThirdPart(){
    setState(() {
      startWidget = const RequestingOrderHallFirstWidget();
      colors[4] = MyColors.secondaryColor;
      colors[5] = MyColors.secondaryColor;
    });
  }

  late Widget startWidget;

  @override
  void dispose() {
    receiver.stop();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return isRequesting?WillPopScope(
      onWillPop: (){
        if(startWidget is RequestingOrderHallSecondWidget){
          setState(() {
            startWidget = const RequestingOrderHallFirstWidget();
            colors[4] = Colors.white;
            colors[5] = MyColors.simpleBlue;
          });
        }else if(startWidget is RequestingOrderHallThirdWidget){
          setState(() {
            startWidget = RequestingOrderHallSecondWidget(order: myOrder,);
            colors[6] = Colors.white;
          });
        }else if(startWidget is RequestingOrderHallFirstWidget){
          setState(() {
            startWidget = firstWidget;
            colors[3] = MyColors.simpleBlue;
            colors[2] = Colors.white;
          });
        }else if(startWidget is RequestingOrderTimeSecondWidget){
          setState(() {
            startWidget = const RequestingOrderTimeFirstWidget();
            colors[4] = Colors.white;
            colors[5] = MyColors.simpleBlue;
          });
        }else if(startWidget is RequestingOrderTimeFirstWidget){
          setState(() {
            startWidget = firstWidget;
            colors[3] = MyColors.simpleBlue;
            colors[2] = Colors.white;
          });
        }else if(startWidget is RequestingOrderTimeThirdWidget){
          setState(() {
            startWidget = RequestingOrderTimeSecondWidget(order: myOrder,);
            colors[6] = Colors.white;
          });
        }else{
          setState(() {
            isHome = true;
            mainAppBar = homeAppBar;
            body = const homeWidget();
            isProfile = false;
            isOrders = false;
            isRequesting = false;
            isEdit = false;
            isClose = false;
          });
        }
        return Future(() => false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _key,
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.booking,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 24,
              fontFamily: 'Tajawal',
              color: MyColors.secondaryColor,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              //Navigator.popAndPushNamed(context, "/home");
              if(startWidget is RequestingOrderHallSecondWidget){
                setState(() {
                  startWidget = const RequestingOrderHallFirstWidget();
                  colors[4] = Colors.white;
                  colors[5] = MyColors.simpleBlue;
                });
              }else if(startWidget is RequestingOrderHallThirdWidget){
                setState(() {
                  startWidget = RequestingOrderHallSecondWidget(order: myOrder,);
                  colors[6] = Colors.white;
                });
              }else if(startWidget is RequestingOrderHallFirstWidget){
                setState(() {
                  startWidget = firstWidget;
                  colors[3] = MyColors.simpleBlue;
                  colors[2] = Colors.white;
                });
              }else if(startWidget is RequestingOrderTimeSecondWidget){
                setState(() {
                  startWidget = const RequestingOrderTimeFirstWidget();
                  colors[4] = Colors.white;
                  colors[5] = MyColors.simpleBlue;
                });
              }else if(startWidget is RequestingOrderTimeFirstWidget){
                setState(() {
                  startWidget = firstWidget;
                  colors[3] = MyColors.simpleBlue;
                  colors[2] = Colors.white;
                });
              }else if(startWidget is RequestingOrderTimeThirdWidget){
                setState(() {
                  startWidget = RequestingOrderTimeSecondWidget(order: myOrder,);
                  colors[6] = Colors.white;
                });
              }else{
                setState(() {
                  isHome = true;
                  mainAppBar = homeAppBar;
                  body = const homeWidget();
                  isRequesting = false;
                  isClose = false;
                });
              }
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height/11.5),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.1,
                        image: AssetImage(
                          "assets/images/knissa.png",
                        ),
                        fit: BoxFit.contain
                    )
                ),
                child: Container(
                    margin: const EdgeInsets.all(21),
                    child: SingleChildScrollView(
                      child: Column(
                          children: [
                            pageIndicator(),
                            const SizedBox(
                              height: 32,
                            ),
                            startWidget
                          ],
                        ),
                    ),
                  ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            isHome = false;
                            mainAppBar = null;
                            body = profilePage(isAr: isAr,);
                            isProfile = true;
                            isOrders = false;
                            isRequesting = false;
                            isEdit = false;
                            isClose = false;
                          });
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 2,),
                                  isProfile?SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconWidget(path: 'assets/images/img_13.png')
                                  ):SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconWidget(path: 'assets/images/img_14.png')),
                                  Text(AppLocalizations.of(context)!.profile,style: TextStyle(fontSize: 12,color: isProfile?MyColors.primaryColor:const Color.fromRGBO(141, 138, 138, 1)),),
                                ],
                              ),
                              isProfile? const Divider(color: MyColors.primaryColor,thickness: 1,) : const SizedBox.shrink()
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            isHome = true;
                            mainAppBar = homeAppBar;
                            body = const homeWidget();
                            isProfile = false;
                            isOrders = false;
                            isRequesting = false;
                            isEdit = false;
                            isClose = false;
                          });
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 2,),
                                  isHome?SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconWidget(path: 'assets/images/img_7.png')
                                  ):SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconWidget(path: 'assets/images/img_8.png')),
                                  Text(AppLocalizations.of(context)!.home,style: TextStyle(fontSize: 12,color: isHome?MyColors.primaryColor:const Color.fromRGBO(141, 138, 138, 1)),),
                                ],
                              ),
                              isHome? const Divider(color: MyColors.primaryColor,thickness: 1,) : const SizedBox.shrink()
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            mainAppBar = orderAppBar;
                            body = const OrderPage();
                            isHome = false;
                            isProfile = false;
                            isOrders = true;
                            isRequesting = false;
                            isEdit = false;
                            isClose = false;
                          });
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 2,),
                                  isOrders?SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconWidget(path: 'assets/images/img_10.png')
                                  ):SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconWidget(path: 'assets/images/img_9.png')),
                                  Text(AppLocalizations.of(context)!.orders,style: TextStyle(fontSize: 12,color: isOrders?MyColors.primaryColor:const Color.fromRGBO(141, 138, 138, 1)),),
                                ],
                              ),
                              isOrders? const Divider(color: MyColors.primaryColor,thickness: 1,) : const SizedBox.shrink()
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            mainAppBar = bookingAppbar;
                            isHome = false;
                            isRequesting = true;
                            isProfile = false;
                            isOrders = false;
                            isEdit = false;
                            isClose = false;
                          });
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 2,),
                                  isRequesting?SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconWidget(path: 'assets/images/img_12.png')
                                  ):SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconWidget(path: 'assets/images/img_11.png')),
                                  Text(AppLocalizations.of(context)!.booking,style: TextStyle(fontSize: 12,color: isRequesting? MyColors.primaryColor:const Color.fromRGBO(141, 138, 138, 1)),),
                                ],
                              ),
                              isRequesting? const Divider(color: MyColors.primaryColor,thickness: 1,) : const SizedBox.shrink()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    ):WillPopScope(
      onWillPop: (){
        if(isHome){
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
        }else{
          setState(() {
            isHome = true;
            mainAppBar = homeAppBar;
            body = const homeWidget();
            isProfile = false;
            isOrders = false;
            isRequesting = false;
            isEdit = false;
            isClose = false;
          });
        }
        return Future(() => false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _key,
        endDrawer: isHome? SizedBox(
          width: MediaQuery.of(context).size.width/1.8,
          child: Drawer(
            backgroundColor: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: const Column(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Color(0xFF778899),
                            // backgroundImage:
                            //     NetworkImage("Your Photo Url"), // for Network image
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "اسم الخادم",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: MyColors.primaryColor,
                                fontFamily: 'Tajawal'),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: Color.fromRGBO(237, 228, 228, 1),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          langShown = !langShown;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.language,color: MyColors.primaryColor),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.chooseLan,
                                  style: const TextStyle(
                                      color: MyColors.primaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Tajawal'),
                                ),
                              ],
                            ),
                            Icon(
                              langShown ? Icons.arrow_drop_up:Icons.arrow_drop_down,
                              color: MyColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    langShown
                        ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () async {
                                setState(() {
                                  isAr = true;
                                });
                                Locale local = await setLocale("ar");
                                MyApp.setLocale(context, local);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isAr
                                      ? MyColors.simpleBlue
                                      : Colors.white,
                                    border: Border.all(
                                        color: isAr
                                            ? Colors.white
                                            : MyColors.simpleBlue,
                                        width: 1)

                                ),
                                margin: const EdgeInsets.symmetric(horizontal: 15),
                                padding: const EdgeInsets.all(7),
                                alignment: Alignment.centerRight,
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Flag.fromString("EG")),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "العربية",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'Tajawal'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        : const SizedBox(),
                    const SizedBox(height: 5,),
                    langShown
                        ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () async {
                                setState(() {
                                  isAr = false;
                                });
                                Locale local0 = await setLocale("en");
                                MyApp.setLocale(context, local0);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isAr
                                      ? Colors.white
                                      : MyColors.simpleBlue,
                                    border: Border.all(
                                        color: isAr
                                            ? MyColors.simpleBlue
                                            : Colors.white,
                                        width: 1)
                                ),
                                margin: const EdgeInsets.symmetric(horizontal: 15),
                                padding: const EdgeInsets.all(7),
                                alignment: Alignment.centerRight,
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Flag.fromString("US")),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "English",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'Tajawal'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                        : const SizedBox(),
                    const SizedBox(height: 20,),
                    isAdmin?
                        Material(
                          color: Colors.white,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width,
                            child: InkWell(
                              onTap: (){
                                //TODO:GO TO USERS
                                Navigator.of(context).pushNamed(usersPage);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.users,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Tajawal',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                          ),
                        )
                        :const SizedBox.shrink()
                  ],
                ),

                Column(
                  children: [
                    const Divider(
                      thickness: 2,
                      color: MyColors.simpleBlue,
                    ),
                    Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          //TODO:API CALL

                          Navigator.popAndPushNamed(context, login);

                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: IconWidget(path: 'assets/images/img_6.png')
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                AppLocalizations.of(context)!.logout,
                                style: const TextStyle(
                                    color: MyColors.primaryColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Tajawal'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ):null,
        appBar: mainAppBar,
        body: Stack(
          children: [
            Positioned(child: body),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            isHome = false;
                            mainAppBar = null;
                            body = profilePage(isAr: isAr,);
                            isProfile = true;
                            isOrders = false;
                            isRequesting = false;
                            isEdit = false;
                            isClose = false;
                          });
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 2,),
                                  isProfile?SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconWidget(path: 'assets/images/img_13.png')
                                  ):SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconWidget(path: 'assets/images/img_14.png')),
                                  Text(AppLocalizations.of(context)!.profile,style: TextStyle(fontSize: 12,color: isProfile?MyColors.primaryColor:const Color.fromRGBO(141, 138, 138, 1)),),
                                ],
                              ),
                              isProfile? const Divider(color: MyColors.primaryColor,thickness: 1,) : const SizedBox.shrink()
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            isHome = true;
                            mainAppBar = homeAppBar;
                            body = const homeWidget();
                            isProfile = false;
                            isOrders = false;
                            isRequesting = false;
                            isEdit = false;
                            isClose = false;
                          });
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 2,),
                                  isHome?SizedBox(
                                    width: 30,
                                      height: 30,
                                      child: IconWidget(path: 'assets/images/img_7.png')
                                  ):SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconWidget(path: 'assets/images/img_8.png')),
                                  Text(AppLocalizations.of(context)!.home,style: TextStyle(fontSize: 12,color: isHome?MyColors.primaryColor:const Color.fromRGBO(141, 138, 138, 1)),),
                                ],
                              ),
                              isHome? const Divider(color: MyColors.primaryColor,thickness: 1,) : const SizedBox.shrink()
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            mainAppBar = orderAppBar;
                            body = const OrderPage();
                            isHome = false;
                            isProfile = false;
                            isOrders = true;
                            isRequesting = false;
                            isEdit = false;
                            isClose = false;
                          });
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 2,),
                                  isOrders?SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconWidget(path: 'assets/images/img_10.png')
                                  ):SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconWidget(path: 'assets/images/img_9.png')),
                                  Text(AppLocalizations.of(context)!.orders,style: TextStyle(fontSize: 12,color: isOrders?MyColors.primaryColor:const Color.fromRGBO(141, 138, 138, 1)),),
                                ],
                              ),
                              isOrders? const Divider(color: MyColors.primaryColor,thickness: 1,) : const SizedBox.shrink()
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            if(!isClose){
                              mainAppBar = bookingAppbar;
                              isHome = false;
                              isRequesting = true;
                              isProfile = false;
                              isOrders = false;
                              isEdit = false;
                              isClose = false;
                            }
                          });
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width/4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 2,),

                                  isClose?
                                  SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconWidget(path: 'assets/images/img_15.png')
                                  )
                                  :
                                  isRequesting?SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconWidget(path: 'assets/images/img_12.png')
                                  ):SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: IconWidget(path: 'assets/images/img_11.png')),
                                  Text(isClose? AppLocalizations.of(context)!.close:AppLocalizations.of(context)!.booking,style: TextStyle(fontSize: 12,color: isClose? MyColors.primaryColor : isRequesting? MyColors.primaryColor:const Color.fromRGBO(141, 138, 138, 1)),),
                                ],
                              ),
                              (isClose||isRequesting)? const Divider(color: MyColors.primaryColor,thickness: 1,) : const SizedBox.shrink()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  Row pageIndicator(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 35.w,
          height: 35.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors[0],
              border: Border.all(
                  color: MyColors.simpleBlue, width: 1)),
        ),
        Container(
          width: 50.w,
          height: 2.h,
          decoration: BoxDecoration(
            color: colors[1],
          ),
        ),
        Container(
          width: 35.w,
          height: 35.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors[2],
              border: Border.all(
                  color: MyColors.simpleBlue, width: 1)),
        ),
        Container(
          width: 50.w,
          height: 2.h,
          decoration: BoxDecoration(
            color: colors[3],
          ),
        ),
        Container(
          width: 35.w,
          height: 35.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors[4],
              border: Border.all(
                  color: MyColors.simpleBlue, width: 1)),
        ),
        Container(
          width: 50.w,
          height: 2.h,
          decoration: BoxDecoration(
            color: colors[5],
          ),
        ),
        Container(
          width: 35.w,
          height: 35.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors[6],
              border: Border.all(
                  color: MyColors.simpleBlue, width: 1)),
        )
      ],
    );
  }
}