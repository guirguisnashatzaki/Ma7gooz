import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';
import 'package:minamakram/Widgets/iconWidget.dart';
import 'package:minamakram/models/order/orderObject.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../constants/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RequestingOrderHallFirstWidget extends StatefulWidget {
  const RequestingOrderHallFirstWidget({Key? key}) : super(key: key);

  @override
  State<RequestingOrderHallFirstWidget> createState() =>
      _RequestingOrderHallFirstWidgetState();
}

class _RequestingOrderHallFirstWidgetState
    extends State<RequestingOrderHallFirstWidget> {
  bool activityBool = false;
  bool dateBool = false;
  bool buildingBool = false;
  bool floorBool = false;
  bool hallBool = false;
  Order order = Order();

  List<String> activities = ["كورال", "اجتماع صلاة", "مسرح"];

  List<String> buildings = ["مبنى الامير", "مبنى البطل", "مبنى الروماني"];

  List<String> floors = ["الدور الاول", "الدور التاني", "الدور التالت"];

  List<String> halls = ["قاعة 1", "قاعة 2", "قاعة 3"];

  String activity = "";
  String date = "اختيار التاريخ";
  String building = "اختيار المبنى";
  String floor = "اختيار الدور";
  String hall = "اختيار القاعة";

  @override
  void didChangeDependencies() {
    activity = AppLocalizations.of(context)!.chooseActivity;
    date = AppLocalizations.of(context)!.chooseDate;
    building = AppLocalizations.of(context)!.chooseBuilding;
    floor = AppLocalizations.of(context)!.chooseFloor;
    hall = AppLocalizations.of(context)!.chooseHall;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            setState(() {
              activityBool = !activityBool;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: MyColors.simpleBlue, width: 1)),
            // alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconWidget(path: "assets/images/img_2.png"),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      activity,
                      style: const TextStyle(
                          color: MyColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Tajawal'),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    // setState(() {
                    //   activityBool = !activityBool;
                    // });
                  },
                  child: const Icon(Icons.arrow_drop_down),
                ),
              ],
            ),
          ),
        ), //activity
        const SizedBox(
          height: 5,
        ),
        activityBool
            ? Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                          blurRadius: 6)
                    ]),
                child: Column(
                  children: List.generate(
                      activities.length,
                      (index) => InkWell(
                            onTap: () {
                              setState(() {
                                //TODO:ORDER Filling
                                order.activity = activities[index];
                                activity = activities[index];
                                activityBool = false;
                              });
                            },
                            child: ListItem(
                              text: activities[index],
                              ifFirst: index == 0 ? true : false,
                              ifLast:
                                  index == activities.length - 1 ? true : false,
                            ),
                          )),
                ),
              )
            : const SizedBox(),
        const SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: (){
            setState(() {
              dateBool = !dateBool;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: MyColors.simpleBlue, width: 1)),
            // alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconWidget(path: "assets/images/img_3.png"),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                          color: MyColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Tajawal'),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    // setState(() {
                    //   dateBool = !dateBool;
                    // });
                  },
                  child: const Icon(Icons.arrow_drop_down),
                ),
              ],
            ),
          ),
        ), //date
        const SizedBox(
          height: 10,
        ),
        dateBool
            ? Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 5,
                          offset: Offset(0.5, 0.5),
                          color: Color.fromRGBO(0, 0, 0, 0.25))
                    ]),
                child: Column(
                  children: [
                    Container(
                        // alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                        child: Text(
                          date,
                          style: const TextStyle(
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: MyColors.primaryColor),
                        )),
                    SfDateRangePicker(
                      showNavigationArrow: true,
                      showTodayButton: true,
                      selectionColor: MyColors.simpleBlue,
                      todayHighlightColor: MyColors.primaryColor,
                      onSelectionChanged: (args){
                        order.date = args.value.toString().split(" ")[0];
                        setState(() {
                            date = args.value.toString().split(" ")[0];
                            dateBool = false;
                        });
                      },
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            AppLocalizations.of(context)!.pleaseEnterDetails,
            style: const TextStyle(
                color: MyColors.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: 'Tajawal'),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: (){
            setState(() {
              buildingBool = !buildingBool;
            });
          },
          child: FittedBox(
            fit: BoxFit.fill,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: MyColors.simpleBlue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: MyColors.simpleBlue, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              building,
                              style: const TextStyle(
                                  color: MyColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Tajawal'),
                            ),
                            InkWell(
                              onTap: () {
                                // setState(() {
                                //   buildingBool = !buildingBool;
                                // });
                              },
                              child: const Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ), //building
        const SizedBox(
          height: 10,
        ),
        buildingBool
            ? Row(
              children: [
                Container(
                    //margin: const EdgeInsets.fromLTRB(230, 0, 0, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1, 1),
                              blurRadius: 6)
                        ]),
                    child: Column(
                      children: List.generate(
                          buildings.length,
                          (index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    //TODO:ORDER Filling
                                    order.buildingAccepted = buildings[index];
                                    buildingBool = false;
                                    building = buildings[index];
                                  });
                                },
                                child: MyListItem(
                                  text: buildings[index],
                                  ifFirst: index == 0 ? true : false,
                                  ifLast:
                                      index == buildings.length - 1 ? true : false,
                                ),
                              )),
                    ),
                  ),
              ],
            )
            : const SizedBox(),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: (){
            setState(() {
              floorBool = !floorBool;
            });
          },
          child: FittedBox(
            fit: BoxFit.fill,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: MyColors.simpleBlue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: MyColors.simpleBlue, width: 1),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              floor,
                              style: const TextStyle(
                                  color: MyColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                fontFamily: 'Tajawal',),
                            ),
                            InkWell(
                              onTap: () {
                                // setState(() {
                                //   floorBool = !floorBool;
                                // });
                              },
                              child: const Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ), //floor
        const SizedBox(
          height: 10,
        ),
        floorBool
            ? Row(
              children: [
                Container(
                    //margin: const EdgeInsets.fromLTRB(230, 0, 0, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1, 1),
                              blurRadius: 6)
                        ]),
                    child: Column(
                      children: List.generate(
                          buildings.length,
                          (index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    //TODO:ORDER Filling
                                    order.floorAccepted = floors[index];
                                    floor = floors[index];
                                    floorBool = false;
                                  });
                                },
                                child: MyListItem(
                                  text: floors[index],
                                  ifFirst: index == 0 ? true : false,
                                  ifLast: index == floors.length - 1 ? true : false,
                                ),
                              )),
                    ),
                  ),
              ],
            )
            : const SizedBox(),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: (){
            setState(() {
              hallBool = !hallBool;
            });
          },
          child: FittedBox(
            fit: BoxFit.fill,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(

                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: MyColors.simpleBlue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: MyColors.simpleBlue, width: 1)),
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              hall,
                              style: const TextStyle(
                                  color: MyColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Tajawal',),
                            ),
                            InkWell(
                              onTap: () {
                                // setState(() {
                                //   hallBool = !hallBool;
                                // });
                              },
                              child: const Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ), //hall
        const SizedBox(
          height: 10,
        ),
        hallBool
            ? Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1, 1),
                              blurRadius: 6)
                        ]),
                    child: Column(
                      children: List.generate(
                          halls.length,
                          (index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    //TODO:ORDER Filling
                                    order.hallAccepted = halls[index];
                                    hall = halls[index];
                                    hallBool = false;
                                  });
                                },
                                child: MyListItem(
                                  text: halls[index],
                                  ifFirst: index == 0 ? true : false,
                                  ifLast: index == halls.length - 1 ? true : false,
                                ),
                              )),
                    ),
                  ),
              ],
            )
            : const SizedBox(),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              backgroundColor: MaterialStateProperty.all(MyColors.primaryColor),
              side: MaterialStateProperty.all(const BorderSide(
                  color: MyColors.secondaryColor, width: 1)),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.fromLTRB(30, 10, 30, 10))),
          onPressed: () {
            //TODO: API Call
            bool floorFilled = true;
            bool hallFilled = true;
            bool buildingFilled = true;
            bool activityFilled = true;
            bool dateFilled = true;

            if (order.hallAccepted == null || order.hallAccepted!.isEmpty) hallFilled = false;
            if (order.activity == null || order.activity!.isEmpty) {
              activityFilled = false;
            }
            if (order.buildingAccepted == null || order.buildingAccepted!.isEmpty) {
              buildingFilled = false;
            }
            if (order.floorAccepted == null || order.floorAccepted!.isEmpty) {
              floorFilled = false;
            }
            if (order.date == null || order.date!.isEmpty) dateFilled = false;

            if (floorFilled &&
                hallFilled &&
                buildingFilled &&
                activityFilled &&
                dateFilled) {
              sendBroadcast(
                  BroadcastMessage(name: "Third page", data: {
                    "date": order.date,
                    "building": order.buildingAccepted,
                    "floor":order.floorAccepted,
                    "hall":order.hallAccepted,
                    "activity":order.activity,
                  }));
            } else {
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        content: Container(
                            alignment: Alignment.center,
                            width: 300,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.orderValidationMessage,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Tajawal',
                                  color: MyColors.primaryColor),
                            )),
                      ));
            }
          },
          child: Text(
            AppLocalizations.of(context)!.search,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Tajawal',
                color: Colors.white),
          ),
        )
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  String text;
  ListItem({
    super.key,
    required this.text,
    required this.ifFirst,
    required this.ifLast,
  });

  bool ifFirst;
  bool ifLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
            bottom: ifLast ? const Radius.circular(10) : Radius.zero,
            top: ifFirst ? const Radius.circular(10) : Radius.zero),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: Text(text),
    );
  }
}

class MyListItem extends StatelessWidget {
  String text;
  MyListItem({
    super.key,
    required this.text,
    required this.ifFirst,
    required this.ifLast,
  });

  bool ifFirst;
  bool ifLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
            bottom: ifLast ? const Radius.circular(10) : Radius.zero,
            top: ifFirst ? const Radius.circular(10) : Radius.zero),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: Text(text),
    );
  }
}