import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:minamakram/Screens/HomePage.dart';
import 'package:minamakram/Screens/profilePage.dart';
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
  String name = "اسم الخادم";
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isHome = true;
  PreferredSizeWidget orderAppBar = AppBar();
  PreferredSizeWidget homeAppBar = AppBar();
  PreferredSizeWidget bookingAppbar = AppBar();
  PreferredSizeWidget? mainAppBar = AppBar();
  Widget body = Container();
  bool isRequesting = true;
  late Widget firstWidget = Container();
  var warnings = ["ugukuj","jbkhbh"];


  @override
  void didChangeDependencies() {
    setState(() {
      orderAppBar = AppBar(
        title: Text(
          AppLocalizations.of(context)!.orders,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            fontFamily: 'Tajawal',
            color: Color.fromRGBO(6, 68, 105, 1),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/home");
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      );
      homeAppBar = AppBar(
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, notification);
            },
          ),
          IconButton(
              onPressed: (){
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>
                        AlertDialog(
                          content: Container(
                            alignment: Alignment.center,
                            width: 200,
                            height: 300,
                            child: ListView(
                              children: List.generate(warnings.length, (index) =>
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      leading: Text(
                                        warnings[index],
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          )
                        )
                );
              },
              icon: Icon(
                Icons.info,
                color: warnings.isNotEmpty? Colors.orange:Colors.grey,
              )
          )
        ],
        backgroundColor: Colors.white,
      );
      bookingAppbar = AppBar(
        title: Text(
          AppLocalizations.of(context)!.booking,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            fontFamily: 'Tajawal',
            color: Color.fromRGBO(6, 68, 105, 1),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/home");
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      );
      mainAppBar = homeAppBar;
      isRequesting = widget.isRequesting;
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
                  color: Color.fromRGBO(7, 45, 68, 1)),
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
                  color: Color.fromRGBO(7, 45, 68, 1)),
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
                    color: const Color.fromRGBO(208, 215, 225, 1), width: 1)),
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                const Icon(Icons.card_travel),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.orderWay,
                  style: const TextStyle(
                      color: Color.fromRGBO(7, 45, 68, 1),
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
                    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(7, 45, 68, 1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )
                    ),
                    padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(15, 20, 15, 20))
                ),
                onPressed: () {
                  setState(() {
                    startWidget = const RequestingOrderHallFirstWidget();
                    colors[2] = const Color.fromRGBO(6, 68, 105, 1);
                    colors[3] = const Color.fromRGBO(6, 68, 105, 1);
                  });
                },
                child: Text(
                  AppLocalizations.of(context)!.chooseHall,
                  style: const TextStyle(
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color.fromRGBO(255, 255, 255, 1)
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
                                color: Color.fromRGBO(7, 45, 68, 1),
                                width: 1
                            )
                        )
                    ),
                    padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(15, 20, 15, 20))
                ),
                onPressed: () {
                  setState(() {
                    startWidget = const RequestingOrderTimeFirstWidget();
                    colors[2] = const Color.fromRGBO(6, 68, 105, 1);
                    colors[3] = const Color.fromRGBO(6, 68, 105, 1);
                  });
                },
                child: Text(
                    AppLocalizations.of(context)!.chooseTime,
                    style: const TextStyle(
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color.fromRGBO(7, 45, 68, 1)
                    )),
              ),
            ],
          )
        ],
      );
      startWidget = firstWidget;
    });
    super.didChangeDependencies();
  }

  Order myOrder = Order();
  List<Color> colors=[
    const Color.fromRGBO(6, 68, 105, 1),
    const Color.fromRGBO(6, 68, 105, 1),
    Colors.white,
    const Color.fromRGBO(208, 215, 225, 1),
    Colors.white,
    const Color.fromRGBO(208, 215, 225, 1),
    Colors.white
  ];

  BroadcastReceiver receiver = BroadcastReceiver(
    names: <String>[
      "First page",
      "Second page",
      "Third page",
      "Fourth page",
      "second time page",
      "third time page"
    ],
  );

  void goToThirdPart(){
    setState(() {
      startWidget = const RequestingOrderHallFirstWidget();
      colors[4] = const Color.fromRGBO(6, 68, 105, 1);
      colors[5] = const Color.fromRGBO(6, 68, 105, 1);
    });
  }

  late Widget startWidget;

  @override
  void dispose() {
    receiver.stop();
    super.dispose();
  }

  @override
  void initState() {
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
    setState(() {
      body = homeWidget();
      isHome = true;
    });
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
            colors[4] = const Color.fromRGBO(6, 68, 105, 1);
            colors[5] = const Color.fromRGBO(6, 68, 105, 1);
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
            colors[6] = const Color.fromRGBO(6, 68, 105, 1);
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
            colors[4] = const Color.fromRGBO(6, 68, 105, 1);
            colors[5] = const Color.fromRGBO(6, 68, 105, 1);
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
            colors[6] = const Color.fromRGBO(6, 68, 105, 1);
          });
          break;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isRequesting?WillPopScope(
      onWillPop: (){
        if(startWidget is RequestingOrderHallSecondWidget){
          setState(() {
            startWidget = const RequestingOrderHallFirstWidget();
            colors[4] = Colors.white;
            colors[5] = const Color.fromRGBO(208, 215, 225, 1);
          });
        }else if(startWidget is RequestingOrderHallThirdWidget){
          setState(() {
            startWidget = RequestingOrderHallSecondWidget(order: myOrder,);
            colors[6] = Colors.white;
          });
        }else if(startWidget is RequestingOrderHallFirstWidget){
          setState(() {
            startWidget = startWidget = Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppLocalizations.of(context)!.homeMessage,
                    style: const TextStyle(
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color.fromRGBO(7, 45, 68, 1)),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppLocalizations.of(context)!.pleaseEnterDetails,
                    style: const TextStyle(
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color.fromRGBO(7, 45, 68, 1)),
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
                          color: const Color.fromRGBO(208, 215, 225, 1), width: 1)),
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      const Icon(Icons.card_travel),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        AppLocalizations.of(context)!.orderWay,
                        style: const TextStyle(
                            color: Color.fromRGBO(7, 45, 68, 1),
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
                          backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(7, 45, 68, 1)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              )
                          ),
                          padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(15, 20, 15, 20))
                      ),
                      onPressed: () {
                        setState(() {
                          startWidget = const RequestingOrderHallFirstWidget();
                          colors[2] = const Color.fromRGBO(6, 68, 105, 1);
                          colors[3] = const Color.fromRGBO(6, 68, 105, 1);
                        });
                      },
                      child: Text(
                        AppLocalizations.of(context)!.chooseHall,
                        style: const TextStyle(
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color.fromRGBO(255, 255, 255, 1)
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
                                      color: Color.fromRGBO(7, 45, 68, 1),
                                      width: 1
                                  )
                              )
                          ),
                          padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(15, 20, 15, 20))
                      ),
                      onPressed: () {
                        setState(() {
                          startWidget = const RequestingOrderTimeFirstWidget();
                          colors[2] = const Color.fromRGBO(6, 68, 105, 1);
                          colors[3] = const Color.fromRGBO(6, 68, 105, 1);
                        });
                      },
                      child: Text(
                          AppLocalizations.of(context)!.chooseTime,
                          style: const TextStyle(
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color.fromRGBO(7, 45, 68, 1)
                          )),
                    ),
                  ],
                )
              ],
            );
            colors[3] = const Color.fromRGBO(208, 215, 225, 1);
            colors[2] = Colors.white;
          });
        }else if(startWidget is RequestingOrderTimeSecondWidget){
          setState(() {
            startWidget = const RequestingOrderTimeFirstWidget();
            colors[4] = Colors.white;
            colors[5] = const Color.fromRGBO(208, 215, 225, 1);
          });
        }else if(startWidget is RequestingOrderTimeFirstWidget){
          setState(() {
            startWidget = startWidget = Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppLocalizations.of(context)!.homeMessage,
                    style: const TextStyle(
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color.fromRGBO(7, 45, 68, 1)),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppLocalizations.of(context)!.pleaseEnterDetails,
                    style: const TextStyle(
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color.fromRGBO(7, 45, 68, 1)),
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
                          color: const Color.fromRGBO(208, 215, 225, 1), width: 1)),
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      const Icon(Icons.card_travel),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        AppLocalizations.of(context)!.orderWay,
                        style: const TextStyle(
                            color: Color.fromRGBO(7, 45, 68, 1),
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
                          backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(7, 45, 68, 1)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              )
                          ),
                          padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(15, 20, 15, 20))
                      ),
                      onPressed: () {
                        setState(() {
                          startWidget = const RequestingOrderHallFirstWidget();
                          colors[2] = const Color.fromRGBO(6, 68, 105, 1);
                          colors[3] = const Color.fromRGBO(6, 68, 105, 1);
                        });
                      },
                      child: Text(
                        AppLocalizations.of(context)!.chooseHall,
                        style: const TextStyle(
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color.fromRGBO(255, 255, 255, 1)
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
                                      color: Color.fromRGBO(7, 45, 68, 1),
                                      width: 1
                                  )
                              )
                          ),
                          padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(15, 20, 15, 20))
                      ),
                      onPressed: () {
                        setState(() {
                          startWidget = const RequestingOrderTimeFirstWidget();
                          colors[2] = const Color.fromRGBO(6, 68, 105, 1);
                          colors[3] = const Color.fromRGBO(6, 68, 105, 1);
                        });
                      },
                      child: Text(
                          AppLocalizations.of(context)!.chooseTime,
                          style: const TextStyle(
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color.fromRGBO(7, 45, 68, 1)
                          )),
                    ),
                  ],
                )
              ],
            );
            colors[3] = const Color.fromRGBO(208, 215, 225, 1);
            colors[2] = Colors.white;
          });
        }else if(startWidget is RequestingOrderTimeThirdWidget){
          setState(() {
            startWidget = RequestingOrderTimeSecondWidget(order: myOrder,);
            colors[6] = Colors.white;
          });
        }else{
          Navigator.popAndPushNamed(context, home);
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
              color: Color.fromRGBO(6, 68, 105, 1),
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
                  colors[5] = const Color.fromRGBO(208, 215, 225, 1);
                });
              }else if(startWidget is RequestingOrderHallThirdWidget){
                setState(() {
                  startWidget = RequestingOrderHallSecondWidget(order: myOrder,);
                  colors[6] = Colors.white;
                });
              }else if(startWidget is RequestingOrderHallFirstWidget){
                setState(() {
                  startWidget = startWidget = Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          AppLocalizations.of(context)!.homeMessage,
                          style: const TextStyle(
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color.fromRGBO(7, 45, 68, 1)),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          AppLocalizations.of(context)!.pleaseEnterDetails,
                          style: const TextStyle(
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color.fromRGBO(7, 45, 68, 1)),
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
                                color: const Color.fromRGBO(208, 215, 225, 1), width: 1)),
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            const Icon(Icons.card_travel),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppLocalizations.of(context)!.orderWay,
                              style: const TextStyle(
                                  color: Color.fromRGBO(7, 45, 68, 1),
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
                                backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(7, 45, 68, 1)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    )
                                ),
                                padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(15, 20, 15, 20))
                            ),
                            onPressed: () {
                              setState(() {
                                startWidget = const RequestingOrderHallFirstWidget();
                                colors[2] = const Color.fromRGBO(6, 68, 105, 1);
                                colors[3] = const Color.fromRGBO(6, 68, 105, 1);
                              });
                            },
                            child: Text(
                              AppLocalizations.of(context)!.chooseHall,
                              style: const TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color.fromRGBO(255, 255, 255, 1)
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
                                            color: Color.fromRGBO(7, 45, 68, 1),
                                            width: 1
                                        )
                                    )
                                ),
                                padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(15, 20, 15, 20))
                            ),
                            onPressed: () {
                              setState(() {
                                startWidget = const RequestingOrderTimeFirstWidget();
                                colors[2] = const Color.fromRGBO(6, 68, 105, 1);
                                colors[3] = const Color.fromRGBO(6, 68, 105, 1);
                              });
                            },
                            child: Text(
                                AppLocalizations.of(context)!.chooseTime,
                                style: const TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color.fromRGBO(7, 45, 68, 1)
                                )),
                          ),
                        ],
                      )
                    ],
                  );
                  colors[3] = const Color.fromRGBO(208, 215, 225, 1);
                  colors[2] = Colors.white;
                });
              }else if(startWidget is RequestingOrderTimeSecondWidget){
                setState(() {
                  startWidget = const RequestingOrderTimeFirstWidget();
                  colors[4] = Colors.white;
                  colors[5] = const Color.fromRGBO(208, 215, 225, 1);
                });
              }else if(startWidget is RequestingOrderTimeFirstWidget){
                setState(() {
                  startWidget = startWidget = Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          AppLocalizations.of(context)!.homeMessage,
                          style: const TextStyle(
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color.fromRGBO(7, 45, 68, 1)),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          AppLocalizations.of(context)!.pleaseEnterDetails,
                          style: const TextStyle(
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color.fromRGBO(7, 45, 68, 1)),
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
                                color: const Color.fromRGBO(208, 215, 225, 1), width: 1)),
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            const Icon(Icons.card_travel),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppLocalizations.of(context)!.orderWay,
                              style: const TextStyle(
                                  color: Color.fromRGBO(7, 45, 68, 1),
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
                                backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(7, 45, 68, 1)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    )
                                ),
                                padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(15, 20, 15, 20))
                            ),
                            onPressed: () {
                              setState(() {
                                startWidget = const RequestingOrderHallFirstWidget();
                                colors[2] = const Color.fromRGBO(6, 68, 105, 1);
                                colors[3] = const Color.fromRGBO(6, 68, 105, 1);
                              });
                            },
                            child: Text(
                              AppLocalizations.of(context)!.chooseHall,
                              style: const TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color.fromRGBO(255, 255, 255, 1)
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
                                            color: Color.fromRGBO(7, 45, 68, 1),
                                            width: 1
                                        )
                                    )
                                ),
                                padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(15, 20, 15, 20))
                            ),
                            onPressed: () {
                              setState(() {
                                startWidget = const RequestingOrderTimeFirstWidget();
                                colors[2] = const Color.fromRGBO(6, 68, 105, 1);
                                colors[3] = const Color.fromRGBO(6, 68, 105, 1);
                              });
                            },
                            child: Text(
                                AppLocalizations.of(context)!.chooseTime,
                                style: const TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color.fromRGBO(7, 45, 68, 1)
                                )),
                          ),
                        ],
                      )
                    ],
                  );
                  colors[3] = const Color.fromRGBO(208, 215, 225, 1);
                  colors[2] = Colors.white;
                });
              }else if(startWidget is RequestingOrderTimeThirdWidget){
                setState(() {
                  startWidget = RequestingOrderTimeSecondWidget(order: myOrder,);
                  colors[6] = Colors.white;
                });
              }else{
                Navigator.popAndPushNamed(context, home);
              }
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  opacity: 0.1,
                  image: AssetImage(
                    "assets/images/knissa.png",
                  ),
                  fit: BoxFit.contain
              )
          ),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(21),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colors[0],
                            border: Border.all(
                                color: const Color.fromRGBO(208, 215, 225, 1), width: 1)),
                      ),
                      Container(
                        width: 66,
                        height: 2,
                        decoration: BoxDecoration(
                          color: colors[1],
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colors[2],
                            border: Border.all(
                                color: const Color.fromRGBO(208, 215, 225, 1), width: 1)),
                      ),
                      Container(
                        width: 66,
                        height: 2,
                        decoration: BoxDecoration(
                          color: colors[3],
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colors[4],
                            border: Border.all(
                                color: const Color.fromRGBO(208, 215, 225, 1), width: 1)),
                      ),
                      Container(
                        width: 66,
                        height: 2,
                        decoration: BoxDecoration(
                          color: colors[5],
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colors[6],
                            border: Border.all(
                                color: const Color.fromRGBO(208, 215, 225, 1), width: 1)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  startWidget
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 20,
          selectedLabelStyle: const TextStyle(color: Colors.black),
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          currentIndex: 3,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: MyColors.primaryColor,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            switch (index){
              case 0:
                setState(() {
                  isHome = false;
                  mainAppBar = null;
                  isRequesting = false;
                  startWidget = firstWidget;
                  body = const profilePage();
                });
                break;
              case 1:
                setState(() {
                  isHome = true;
                  mainAppBar = homeAppBar;
                  isRequesting = false;
                  startWidget = firstWidget;
                  body = homeWidget();
                });
                break;
              case 2:
                setState(() {
                  mainAppBar = orderAppBar;
                  body = const OrderPage();
                  isRequesting = false;
                  startWidget = firstWidget;
                  isHome = false;
                });
                break;
              case 3:
                setState(() {
                  mainAppBar = bookingAppbar;
                  isRequesting = true;
                  isHome = false;
                });
                break;

            }
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: AppLocalizations.of(context)!.profile,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.add_shopping_cart),
              label: AppLocalizations.of(context)!.orders,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_bag_outlined),
              label: AppLocalizations.of(context)!.booking,
            ),
          ],
        ),
      ),
    ):Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      drawer: isHome? Drawer(
        backgroundColor: Colors.white,
        child: Column(
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
                        color: Colors.black,
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
                    IconButton(
                      onPressed: () {
                        // setState(() {
                        //   langShown = !langShown;
                        // });
                      },
                      icon: Icon(
                        langShown ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.chooseLan,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              decoration: TextDecoration.none,
                              fontFamily: 'Tajawal'),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(Icons.language)
                      ],
                    )
                  ],
                ),
              ),
            ),
            langShown
                ? Material(
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
                    color: isAr
                        ? const Color.fromRGBO(208, 215, 225, 1)
                        : Colors.white,
                  ),
                  margin: const EdgeInsets.fromLTRB(180, 0, 0, 0),
                  padding: const EdgeInsets.all(15),
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
            )
                : const SizedBox(),
            langShown
                ? Material(
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
                        : const Color.fromRGBO(208, 215, 225, 1),
                  ),
                  margin: const EdgeInsets.fromLTRB(180, 0, 0, 0),
                  padding: const EdgeInsets.all(15),
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
            )
                : const SizedBox(),
            // Material(
            //   color: Colors.white,
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.pushNamed(context, buildings);
            //     },
            //     child: Container(
            //       padding: const EdgeInsets.all(10),
            //       alignment: Alignment.centerRight,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           Text(
            //             AppLocalizations.of(context)!.building,
            //             style: const TextStyle(
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.w700,
            //                 fontSize: 16,
            //                 decoration: TextDecoration.none,
            //                 fontFamily: 'Tajawal'),
            //           ),
            //           const SizedBox(
            //             width: 15,
            //           ),
            //           const Icon(Icons.blinds)
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            const Divider(
              thickness: 2,
              color: Color.fromRGBO(237, 228, 228, 1),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.logout,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                            fontFamily: 'Tajawal'),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(Icons.close)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ):null,
      appBar: mainAppBar,

      body: body,

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 20,
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        currentIndex: 1,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: MyColors.primaryColor,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          switch (index){
            case 0:
              setState(() {
                isHome = false;
                mainAppBar = null;
                body = const profilePage();
              });
              //Navigator.popAndPushNamed(context, profile);
              break;
            case 1:
              setState(() {
                isHome = true;
                mainAppBar = homeAppBar;
                body = homeWidget();
              });
              break;
            case 2:
              setState(() {
                mainAppBar = orderAppBar;
                body = const OrderPage();
                isHome = false;
              });
              //Navigator.popAndPushNamed(context, ordersPage);
              break;
            case 3:
              setState(() {
                mainAppBar = bookingAppbar;
                isHome = false;
                isRequesting = true;
              });
              //Navigator.popAndPushNamed(context, requestingOrderPage);
              break;

          }
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: AppLocalizations.of(context)!.profile,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add_shopping_cart),
            label: AppLocalizations.of(context)!.orders,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_bag_outlined),
            label: AppLocalizations.of(context)!.booking,
          ),
        ],
      ),

    );
  }
}
