import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';
import 'package:minamakram/Widgets/requestingOrderHallFirstWidget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../constants/colors.dart';
import '../models/order/orderObject.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'iconWidget.dart';

class RequestingOrderTimeFirstWidget extends StatefulWidget {
  const RequestingOrderTimeFirstWidget({Key? key}) : super(key: key);

  @override
  State<RequestingOrderTimeFirstWidget> createState() => _RequestingOrderTimeFirstWidgetState();
}

class _RequestingOrderTimeFirstWidgetState extends State<RequestingOrderTimeFirstWidget> {

  bool activityBool = false;
  bool dateBool = false;
  Order order = Order();

  bool timingShown = false;

  List timings = ["08:00 - 09:00 AM", "08:00 - 09:00 AM", "08:00 - 09:00 AM"];

  List timingsBool = [];

  List activities = ["كورال", "اجتماع صلاة", "مسرح"];

  String activity = "اختيار النشاط";
  String date = "اختيار التاريخ";

  @override
  void initState() {
    setState(() {
      timingsBool = List.generate(timings.length, (index) => false);
      order.times = [];
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    activity = AppLocalizations.of(context)!.chooseActivity;
    date = AppLocalizations.of(context)!.chooseDate;
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
            width: MediaQuery.of(context).size.width,
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
                          fontFamily: 'Roboto'),
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
                    ifLast: index == activities.length - 1 ? true : false,
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
            width: MediaQuery.of(context).size.width,
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
                          fontFamily: 'Roboto'),
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
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    AppLocalizations.of(context)!.chooseDate,
                    style: const TextStyle(
                        fontFamily: 'Roboto',
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
              timingShown = !timingShown;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: MyColors.simpleBlue, width: 1)),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.access_time_filled,color: MyColors.primaryColor,),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.chooseTime,
                      style: const TextStyle(
                          color: MyColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto'),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    // setState(() {
                    //   timingShown = !timingShown;
                    // });
                  },
                  child: const Icon(Icons.arrow_drop_down),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10,),
        timingShown? Container(
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
                timings.length, (index) => ListTile(
              title: myListItem(
                isChosen: timingsBool[index],
                text: timings[index],
                ifFirst: index == 0 ? true : false,
                ifLast: index == timings.length - 1 ? true : false,
              ),
              leading:  Checkbox(
                activeColor: MyColors.primaryColor,
                value: timingsBool[index],
                onChanged: (value){
                  setState(() {
                    if(timingsBool[index]){
                      order.times?.remove(timings[index]);
                    }else{
                      order.times?.add(timings[index]);
                    }
                    timingsBool[index] = !timingsBool[index];
                  });
                },
              ),
            )),
          ),
        )
            : const SizedBox(),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              backgroundColor: MaterialStateProperty.all(MyColors.primaryColor),
              side: MaterialStateProperty.all(const BorderSide(
                  color: MyColors.secondaryColor, width: 1)),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.fromLTRB(30, 10, 30, 10))),
          onPressed: () {
            //TODO: API Call

            bool activityFilled = true;
            bool dateFilled = true;

            bool timeFilled = true;
            if(order.times!.isEmpty)timeFilled = false;

            if (order.activity == null || order.activity!.isEmpty) {
              activityFilled = false;
            }

            if (order.date == null || order.date!.isEmpty) dateFilled = false;

            if (activityFilled &&
                dateFilled &&
                timeFilled) {
              sendBroadcast(
                  BroadcastMessage(name: "second time page", data: {
                    "date": order.date,
                    "times":order.times?.asMap(),
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


class myListItem extends StatefulWidget {

  String text;
  bool isChosen;
  myListItem({
    super.key,
    required this.isChosen,
    required this.text,
    required this.ifFirst,
    required this.ifLast,
  });

  bool ifFirst;
  bool ifLast;


  @override
  State<myListItem> createState() => _myListItemState();
}

class _myListItemState extends State<myListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
            bottom: widget.ifLast ? const Radius.circular(10) : Radius.zero,
            top: widget.ifFirst ? const Radius.circular(10) : Radius.zero),
        color: Colors.white,

      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width/6,),
          Text(widget.text),
        ],
      ),
    );
  }
}