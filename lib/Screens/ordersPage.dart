import 'package:flutter/material.dart';
import 'package:minamakram/models/order/orderObject.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../constants/Language.dart';
import '../constants/colors.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  Color rejectedBackgroundColor = Colors.white;
  Color acceptedBackgroundColor = MyColors.primaryColor;
  Color rejectedTextColor = MyColors.primaryColor;
  Color acceptedTextColor = Colors.white;
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
                    rejectedTextColor = Colors.white;
                    rejectedBackgroundColor = MyColors.primaryColor;
                    acceptedTextColor = MyColors.primaryColor;
                    acceptedBackgroundColor = Colors.white;
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
                    acceptedTextColor = Colors.white;
                    acceptedBackgroundColor = MyColors.primaryColor;
                    rejectedTextColor = MyColors.primaryColor;
                    rejectedBackgroundColor = Colors.white;
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
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height / 1.45,
            margin: const EdgeInsets.all(16),
            child: ListView(
              children: List.generate(shownOrders.length, (index) {
                return OrdersListItem(
                  order: shownOrders[index], delReqBool: false,
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

class OrdersListItem extends StatefulWidget {
  Order order;
  bool delReqBool;
  OrdersListItem({Key? key,required this.delReqBool,required this.order}) : super(key: key);

  @override
  State<OrdersListItem> createState() => _OrdersListItemState();
}

class _OrdersListItemState extends State<OrdersListItem> {

  bool delReqBool = false;

  @override
  void didChangeDependencies() {
    delReqBool = widget.delReqBool;
    super.didChangeDependencies();
  }

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
          delReqBool? Positioned(
              top: 60,
              left: 10,
              child: InkWell(
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
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: MyColors.primaryColor,
                          width: 1
                      )
                  ),
                  child: Text(AppLocalizations.of(context)!.delRequest),
                ),
              )
          ):const SizedBox(),
          Positioned(
            top: 10,
            left: 10,
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(6, 68, 105, 1), shape: BoxShape.circle),
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: (){
                        setState(() {
                          delReqBool = !delReqBool;
                        });
                      },
                      icon: const Icon(Icons.more_vert,color: Colors.white,),
                    ),
                  )
                ),
              ],
            ),
          ),
          Positioned(
              child: Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "\u2027 ${widget.order.id}",
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
                    Text("\u2027 ${widget.order.servantName}",
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
                    Text("\u2027 ${widget.order.activity}",style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                        color: Color.fromRGBO(0, 0, 0, 1)),
                      textAlign: TextAlign.right,),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("\u2027 ${widget.order.serviceName}",style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                        color: Color.fromRGBO(0, 0, 0, 1)),textAlign: TextAlign.right,),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("\u2027 ${widget.order.date}",style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                        color: Color.fromRGBO(0, 0, 0, 1)),textAlign: TextAlign.right,),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("\u2027 ${widget.order.timeAccepted}",style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                        color: Color.fromRGBO(0, 0, 0, 1)),textAlign: TextAlign.right,),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("\u2027 ${widget.order.buildingAccepted}/${widget.order.floorAccepted}/${widget.order.hallAccepted}",style: const TextStyle(
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