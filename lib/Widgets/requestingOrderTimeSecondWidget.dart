import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';
import 'package:minamakram/models/order/orderObject.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../constants/colors.dart';
import 'iconWidget.dart';

class RequestingOrderTimeSecondWidget extends StatefulWidget {
  Order order;
  RequestingOrderTimeSecondWidget({Key? key,required this.order}) : super(key: key);

  @override
  State<RequestingOrderTimeSecondWidget> createState() => _RequestingOrderTimeSecondWidgetState();
}

class _RequestingOrderTimeSecondWidgetState extends State<RequestingOrderTimeSecondWidget> {

  bool hallShown = false;

  List<String> halls = ["مبنى الامير -دور الاول-قاعة 1", "مبنى الامير -دور الاول-قاعة 1"];

  List hallsBool = [];

  @override
  void initState() {
    setState(() {
      hallsBool = List.generate(halls.length, (index) => false);
      widget.order.buildings = [];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: MyColors.simpleBlue, width: 1)),
          width: MediaQuery.of(context).size.width,
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
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: MyColors.simpleBlue, width: 1)),
          width: MediaQuery.of(context).size.width,
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
        Column(
          children: List.generate(widget.order.times!.length, (index){
            return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RichText(
                  text: TextSpan(
                      text: AppLocalizations.of(context)!.timeRes,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Tajawal',
                          color: MyColors.primaryColor
                      ),
                      children: [
                        TextSpan(
                            text: widget.order.times?[index],
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Tajawal',
                                color: MyColors.primaryColor
                            )
                        )
                      ]
                  ),

                )
            );
          })
          ,
        ),
        const SizedBox(height: 10,),
        InkWell(
          onTap: (){
            setState(() {
              hallShown = !hallShown;
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
                    IconWidget(path: "assets/images/img_4.png"),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.availableHalls,
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
                    //   hallShown = !hallShown;
                    // });
                  },
                  child: const Icon(Icons.arrow_drop_down),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10,),
        hallShown? Container(
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
                halls.length, (index) => ListTile(
              title: myListItemSecond(
                isChosen: hallsBool[index],
                text: halls[index],
                ifFirst: index == 0 ? true : false,
                ifLast: index == halls.length - 1 ? true : false,
              ),
              leading:  Checkbox(
                activeColor: MyColors.primaryColor,
                value: hallsBool[index],
                onChanged: (value){
                  setState(() {
                    if(hallsBool[index]){
                      widget.order.buildings?.remove(halls[index]);
                    }else{
                      widget.order.buildings?.add(halls[index]);
                    }
                    hallsBool[index] = !hallsBool[index];
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


            bool buildingFilled = true;
            if(widget.order.buildings!.isEmpty)buildingFilled = false;

            if (buildingFilled) {
              sendBroadcast(
                  BroadcastMessage(name: "third time page", data: {
                    "date": widget.order.date,
                    "times":widget.order.times?.asMap(),
                    "activity":widget.order.activity,
                    "buildings":widget.order.buildings?.asMap()
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
            AppLocalizations.of(context)!.book,
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


class myListItemSecond extends StatefulWidget {

  String text;
  bool isChosen;
  myListItemSecond({
    super.key,
    required this.isChosen,
    required this.text,
    required this.ifFirst,
    required this.ifLast,
  });

  bool ifFirst;
  bool ifLast;


  @override
  State<myListItemSecond> createState() => _myListItemSecondState();
}

class _myListItemSecondState extends State<myListItemSecond> {
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
          IconButton(
              onPressed: (){
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
                            child: const Column(
                              children: [
                                  Text("Hall Size :4",
                                    style: TextStyle(
                                      fontFamily: 'Tajwal',
                                      fontWeight: FontWeight.w700,
                                      color: MyColors.primaryColor,
                                      fontSize: 25
                                    ),),
                                Text("Screen :4",
                                    style: TextStyle(
                                        fontFamily: 'Tajwal',
                                        fontWeight: FontWeight.w700,
                                        color: MyColors.primaryColor,
                                        fontSize: 25
                                    )),
                                Text("Air Conditioner :4",
                                    style: TextStyle(
                                        fontFamily: 'Tajwal',
                                        fontWeight: FontWeight.w700,
                                        color: MyColors.primaryColor,
                                        fontSize: 25
                                    )),
                              ],
                            ),
                          ),
                        ),
                );
              },
              icon: const Icon(Icons.info)
          ),
          SizedBox(width: MediaQuery.of(context).size.width/30,),
          Text(widget.text),
        ],
      ),
    );
  }
}