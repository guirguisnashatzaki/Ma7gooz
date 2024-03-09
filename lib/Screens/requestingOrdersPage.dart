import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';
import 'package:minamakram/Widgets/requestingOrderHallFirstWidget.dart';
import 'package:minamakram/Widgets/requestingOrderTimeSecondWidget.dart';
import 'package:minamakram/models/order/orderObject.dart';
import '../Widgets/requestingOrderHallSecondWidget.dart';
import '../Widgets/requestingOrderHallThirdWidget.dart';
import '../Widgets/requestingOrderTimeFirstWidget.dart';
import '../Widgets/requestingOrderTimeThirdWidget.dart';
import '../constants/Language.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RequestingOrdersPage extends StatefulWidget {
  const RequestingOrdersPage({Key? key}) : super(key: key);

  @override
  State<RequestingOrdersPage> createState() => _RequestingOrdersPageState();
}

class _RequestingOrdersPageState extends State<RequestingOrdersPage> {
  bool isAr = true;
  bool langShown = false;
  String name = "";
  Order myOrder = Order();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
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
      "third time page"
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
  void didChangeDependencies() {
    setState(() {
      startWidget = Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
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
          Container(
            alignment: Alignment.centerRight,
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
                const Icon(Icons.card_travel),
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
                    backgroundColor: MaterialStateProperty.all(MyColors.primaryColor),
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
                      color: Colors.white
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
          )
        ],
      );
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
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
      }
    });
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
                        color: MyColors.primaryColor),
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
                      const Icon(Icons.card_travel),
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
                          backgroundColor: MaterialStateProperty.all(MyColors.primaryColor),
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
                            color: Colors.white
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
                )
              ],
            );
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
                        color: MyColors.primaryColor),
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
                      const Icon(Icons.card_travel),
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
                          backgroundColor: MaterialStateProperty.all(MyColors.primaryColor),
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
                            color: Colors.white
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
                )
              ],
            );
            colors[3] = MyColors.simpleBlue;
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
              color: MyColors.secondaryColor,
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
        ),
        body: SingleChildScrollView(
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
                              color: MyColors.simpleBlue, width: 1)),
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
                              color: MyColors.simpleBlue, width: 1)),
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
                              color: MyColors.simpleBlue, width: 1)),
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
                              color: MyColors.simpleBlue, width: 1)),
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
            switch (index) {
              case 0:
                Navigator.popAndPushNamed(context, profile);
                break;
              case 1:
                Navigator.popAndPushNamed(context, home);
                break;
              case 2:
                Navigator.popAndPushNamed(context, ordersPage);
                break;
              case 3:
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
    );
  }
}