import 'package:flutter/material.dart';
import 'package:minamakram/models/order/orderObject.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../constants/Language.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';

class OredersPage extends StatefulWidget {
  const OredersPage({Key? key}) : super(key: key);

  @override
  State<OredersPage> createState() => _OredersPageState();
}

class _OredersPageState extends State<OredersPage> {
  bool isAr = true;
  bool langShown = false;
  String name = "";
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  Color rejectedBackgroundColor = const Color.fromRGBO(6, 68, 105, 1);
  Color acceptedBackgroundColor = const Color.fromRGBO(6, 68, 105, 1);
  Color waitingBackgroundColor = Colors.white;
  Color rejectedTextColor = Colors.white;
  Color acceptedTextColor = Colors.white;
  Color waitingTextColor = const Color.fromRGBO(6, 68, 105, 1);

  List<Order> rejectedOrders = [];
  List<Order> acceptedOrders = [];
  List<Order> waitingOrders = [
    Order(
        id: 1,
        buildingAccepted: "g",
        activity: "kj",
        date: "lk",
        floorAccepted: "2",
        hallAccepted: "2",
        servantName: "k",
        serviceName: "l",
        timeAccepted: "k"),
    Order(
        id: 1,
        buildingAccepted: "g",
        activity: "kj",
        date: "lk",
        floorAccepted: "2",
        hallAccepted: "2",
        servantName: "k",
        serviceName: "l",
        timeAccepted: "k"),
    Order(
        id: 1,
        buildingAccepted: "g",
        activity: "kj",
        date: "lk",
        floorAccepted: "2",
        hallAccepted: "2",
        servantName: "k",
        serviceName: "l",
        timeAccepted: "k"),
  ];
  List<Order> shownOrders = [];

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
      shownOrders = waitingOrders;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      appBar: AppBar(
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
      ),
      body: const OrderPage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 20,
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        currentIndex: 2,
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
              break;
            case 3:
              Navigator.popAndPushNamed(context, requestingOrderPage);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Booking",
          ),
        ],
      ),
    );
  }
}

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  Color rejectedBackgroundColor = const Color.fromRGBO(6, 68, 105, 1);
  Color acceptedBackgroundColor = Colors.white;
  Color rejectedTextColor = Colors.white;
  Color acceptedTextColor = const Color.fromRGBO(6, 68, 105, 1);
  bool isAr = true;
  List<Order> rejectedOrders = [];
  List<Order> acceptedOrders = [
    Order(
        id: 1,
        buildingAccepted: "g",
        activity: "kj",
        date: "lk",
        floorAccepted: "2",
        hallAccepted: "2",
        servantName: "k",
        serviceName: "l",
        timeAccepted: "k"),
    Order(
        id: 1,
        buildingAccepted: "g",
        activity: "kj",
        date: "lk",
        floorAccepted: "2",
        hallAccepted: "2",
        servantName: "k",
        serviceName: "l",
        timeAccepted: "k"),
    Order(
        id: 1,
        buildingAccepted: "g",
        activity: "kj",
        date: "lk",
        floorAccepted: "2",
        hallAccepted: "2",
        servantName: "k",
        serviceName: "l",
        timeAccepted: "k"),
  ];
  List<Order> shownOrders = [];

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
      shownOrders = acceptedOrders;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: 0.1,
              image: AssetImage(
                "assets/images/knissa.png",
              ),
              fit: BoxFit.contain
          )
      ),
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    side: MaterialStateProperty.all(const BorderSide(
                        color: Color.fromRGBO(6, 68, 105, 1), width: 1)),
                    backgroundColor:
                    MaterialStateProperty.all(rejectedBackgroundColor)),
                onPressed: () {
                  setState(() {
                    rejectedTextColor = const Color.fromRGBO(6, 68, 105, 1);
                    rejectedBackgroundColor = Colors.white;
                    acceptedTextColor = Colors.white;
                    acceptedBackgroundColor = const Color.fromRGBO(6, 68, 105, 1);
                    shownOrders = rejectedOrders;
                  });
                },
                child: Text(
                  AppLocalizations.of(context)!.rejected,
                  style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: rejectedTextColor),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    side: MaterialStateProperty.all(const BorderSide(
                        color: Color.fromRGBO(6, 68, 105, 1), width: 1)),
                    backgroundColor:
                    MaterialStateProperty.all(acceptedBackgroundColor)),
                onPressed: () {
                  setState(() {
                    acceptedTextColor = const Color.fromRGBO(6, 68, 105, 1);
                    acceptedBackgroundColor = Colors.white;
                    rejectedTextColor = Colors.white;
                    rejectedBackgroundColor = const Color.fromRGBO(6, 68, 105, 1);
                    shownOrders = acceptedOrders;
                  });
                },
                child: Text(
                  AppLocalizations.of(context)!.accepted,
                  style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: acceptedTextColor),
                ),
              ),
              // const SizedBox(
              //   width: 20,
              // ),
              // ElevatedButton(
              //   style: ButtonStyle(
              //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //         RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20.0),
              //         ),
              //       ),
              //       side: MaterialStateProperty.all(const BorderSide(
              //           color: Color.fromRGBO(6, 68, 105, 1), width: 1)),
              //       backgroundColor:
              //       MaterialStateProperty.all(waitingBackgroundColor)),
              //   onPressed: () {
              //     setState(() {
              //       waitingTextColor = const Color.fromRGBO(6, 68, 105, 1);
              //       waitingBackgroundColor = Colors.white;
              //       acceptedTextColor = Colors.white;
              //       acceptedBackgroundColor = const Color.fromRGBO(6, 68, 105, 1);
              //       rejectedTextColor = Colors.white;
              //       rejectedBackgroundColor = const Color.fromRGBO(6, 68, 105, 1);
              //       shownOrders = waitingOrders;
              //     });
              //   },
              //   child: Text(
              //     AppLocalizations.of(context)!.requested,
              //     style: TextStyle(
              //         fontFamily: 'Tajawal',
              //         fontSize: 16,
              //         fontWeight: FontWeight.w400,
              //         color: waitingTextColor),
              //   ),
              // ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height / 1.65,
            margin: const EdgeInsets.all(16),
            child: ListView(
              children: List.generate(shownOrders.length, (index) {
                return OrdersListItem(
                  order: shownOrders[index],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

class OrdersListItem extends StatelessWidget {
  Order order;
  OrdersListItem({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.9,
      margin: const EdgeInsets.fromLTRB(0,0,0, 20),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(208, 215, 225, 1),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(6, 68, 105, 1), shape: BoxShape.circle),
              child: PopupMenuButton(
                  color: Colors.white,
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: Text(AppLocalizations.of(context)!.delRequest),
                        onTap: () {
                          //TODO:API Call

                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: Container(
                                  width: 300,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.delOrderQuestion,
                                        style: const TextStyle(
                                            color:
                                            Color.fromRGBO(6, 68, 105, 1),
                                            fontFamily: 'Tajawal',
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      FittedBox(
                                        fit: BoxFit.fill,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            FittedBox(
                                              fit: BoxFit.fill,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                10))),
                                                    backgroundColor: MaterialStateProperty.all(
                                                        MyColors.primaryColor),
                                                    side: MaterialStateProperty.all(
                                                        const BorderSide(
                                                            color: Color.fromRGBO(
                                                                6, 68, 105, 1),
                                                            width: 1)),
                                                    padding: MaterialStateProperty.all(
                                                        const EdgeInsets.fromLTRB(30, 10, 30, 10))),
                                                onPressed: () {
                                                  //TODO: API Call

                                                  Navigator.pop(context);

                                                  showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext
                                                      context) =>
                                                          AlertDialog(
                                                            content: Container(
                                                              width: 300,
                                                              height: 200,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    10),
                                                                color:
                                                                Colors.white,
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                    AppLocalizations.of(context)!.delOrderMessage,
                                                                    style: const TextStyle(
                                                                        color: Color
                                                                            .fromRGBO(
                                                                            6,
                                                                            68,
                                                                            105,
                                                                            1),
                                                                        fontFamily:
                                                                        'Tajawal',
                                                                        fontSize:
                                                                        24,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 50,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 86,
                                                                    height: 86,
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/delete_profile_confirmation.png",
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ));
                                                },
                                                child: Text(
                                                  AppLocalizations.of(context)!.confirm,
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 16,
                                                      fontFamily: 'Tajawal',
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            FittedBox(
                                              fit: BoxFit.fill,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                10))),
                                                    backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white),
                                                    side:
                                                    MaterialStateProperty.all(
                                                        const BorderSide(
                                                          color: Color.fromRGBO(
                                                              6, 68, 105, 1),
                                                          width: 1,
                                                        )),
                                                    padding: MaterialStateProperty.all(
                                                        const EdgeInsets.fromLTRB(
                                                            30, 10, 30, 10))),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  AppLocalizations.of(context)!.del,
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 16,
                                                      fontFamily: 'Tajawal',
                                                      color: Color.fromRGBO(
                                                          6, 68, 105, 1)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));


                        },
                      )
                    ];
                  }),
            ),
          ),
          Positioned(
              child: Container(
                alignment: Alignment.centerRight,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "\u2027 ${order.id}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: 'Tajawal',
                      color: Color.fromRGBO(0, 0, 0, 1)),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text("\u2027 ${order.servantName}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                        color: Color.fromRGBO(0, 0, 0, 1)),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text("\u2027 ${order.activity}",style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: 'Tajawal',
                    color: Color.fromRGBO(0, 0, 0, 1)),
                  textAlign: TextAlign.right,),
                const SizedBox(
                  height: 5,
                ),
                Text("\u2027 ${order.serviceName}",style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: 'Tajawal',
                    color: Color.fromRGBO(0, 0, 0, 1)),textAlign: TextAlign.right,),
                const SizedBox(
                  height: 5,
                ),
                Text("\u2027 ${order.date}",style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: 'Tajawal',
                    color: Color.fromRGBO(0, 0, 0, 1)),textAlign: TextAlign.right,),
                const SizedBox(
                  height: 5,
                ),
                Text("\u2027 ${order.timeAccepted}",style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: 'Tajawal',
                    color: Color.fromRGBO(0, 0, 0, 1)),textAlign: TextAlign.right,),
                const SizedBox(
                  height: 5,
                ),
                Text("\u2027 ${order.buildingAccepted}/${order.floorAccepted}/${order.hallAccepted}",style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: 'Tajawal',
                    color: Color.fromRGBO(0, 0, 0, 1)),textAlign: TextAlign.right,),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
