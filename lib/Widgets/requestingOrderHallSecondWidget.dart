import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../constants/colors.dart';
import '../models/order/orderObject.dart';

class RequestingOrderHallSecondWidget extends StatefulWidget {
  Order order;

  RequestingOrderHallSecondWidget({Key? key,required this.order}) : super(key: key);

  @override
  State<RequestingOrderHallSecondWidget> createState() => _RequestingOrderHallSecondWidgetState();
}

class _RequestingOrderHallSecondWidgetState extends State<RequestingOrderHallSecondWidget> {

  bool timingShown = false;

  List<String> timings = ["08:00 - 09:00 AM", "08:00 - 09:00 AM", "08:00 - 09:00 AM"];

  List timingsBool = [];

  @override
  void initState() {
    setState(() {
      timingsBool = List.generate(timings.length, (index) => false);
      widget.order.times = [];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: MyColors.simpleBlue, width: 1)),
          child: RichText(
                    text: TextSpan(
                      text: AppLocalizations.of(context)!.activityRes,
                      style: const TextStyle(
                          color: MyColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto'),
                      children: [
                        TextSpan(
                          text: widget.order.activity,
                          style: const TextStyle(
                              color: MyColors.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto'),
                        )
                      ]
                    ),
                  ),
        ),
        const SizedBox(height: 10,),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: MyColors.simpleBlue, width: 1)),

          child: RichText(
            text: TextSpan(
                text: AppLocalizations.of(context)!.dateRes,
                style: const TextStyle(
                    color: MyColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto'),
                children: [
                  TextSpan(
                    text: widget.order.date,
                    style: const TextStyle(
                        color: MyColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto'),
                  )
                ]
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: MyColors.simpleBlue, width: 1)),
          width: MediaQuery.of(context).size.width,
          child: RichText(
            text: TextSpan(
                text: widget.order.buildingAccepted,
                style: const TextStyle(
                    color: MyColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto'),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: MyColors.simpleBlue, width: 1)),
          width: MediaQuery.of(context).size.width,
          child: RichText(
            text: TextSpan(
                text: widget.order.floorAccepted,
                style: const TextStyle(
                    color: MyColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto'),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: MyColors.simpleBlue, width: 1)),
          width: MediaQuery.of(context).size.width,
          child: RichText(
            text: TextSpan(
                text: widget.order.hallAccepted,
                style: const TextStyle(
                    color: MyColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto'),
            ),
          ),
        ),
        const SizedBox(height: 10,),
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
                    const Icon(Icons.access_time_filled),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.availableTimes,
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
                    setState(() {
                      timingShown = !timingShown;
                    });
                  },
                  child: timingShown? const Icon(Icons.arrow_drop_up):const Icon(Icons.arrow_drop_down),
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
                  title: ListItem(
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
                              widget.order.times?.add(timings[index]);
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


            bool time = true;
            if(widget.order.times!.isEmpty)time = false;

            if(time){
              sendBroadcast(
                  BroadcastMessage(name: "Fourth page", data: {
                    "date": widget.order.date,
                    "building": widget.order.buildingAccepted,
                    "floor":widget.order.floorAccepted,
                    "hall":widget.order.hallAccepted,
                    "activity":widget.order.activity,
                    "time":widget.order.times?.asMap()
                  })
              );
            }else {
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
            AppLocalizations.of(context)!.book,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Tajawal',
                color: Colors.white),
          ),
        ),

        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}

class ListItem extends StatefulWidget {

  String text;
  bool isChosen;
  ListItem({
    super.key,
    required this.isChosen,
    required this.text,
    required this.ifFirst,
    required this.ifLast,
  });

  bool ifFirst;
  bool ifLast;


  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
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
          Text(widget.text,textDirection: TextDirection.ltr,),
        ],
      ),
    );
  }
}