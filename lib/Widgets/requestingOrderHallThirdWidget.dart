import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../constants/strings.dart';
import '../models/order/orderObject.dart';

class RequestingOrderHallThirdWidget extends StatefulWidget {

  Order order;

  RequestingOrderHallThirdWidget({Key? key,required this.order}) : super(key: key);

  @override
  State<RequestingOrderHallThirdWidget> createState() => _RequestingOrderHallThirdWidgetState();
}

class _RequestingOrderHallThirdWidgetState extends State<RequestingOrderHallThirdWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(AppLocalizations.of(context)!.orderDetails,style: const TextStyle(
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: Color.fromRGBO(7, 45, 68, 1)
          ),),
        ),
        const SizedBox(height: 24,),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(208, 215, 225, 1),
            borderRadius: BorderRadius.circular(10),

          ),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "اسم الخادم",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Tajawal',
                    color: Color.fromRGBO(7, 45, 68, 1)
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "الخدمة",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Tajawal',
                      color: Color.fromRGBO(7, 45, 68, 1)
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RichText(
                  text: TextSpan(
                    text: AppLocalizations.of(context)!.activityRes,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Tajawal',
                        color: Color.fromRGBO(7, 45, 68, 1)
                    ),
                    children: [
                      TextSpan(
                        text: widget.order.activity,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Tajawal',
                            color: Color.fromRGBO(7, 45, 68, 1)
                        )
                      )
                    ]
                  ),
                )
              ),
              const SizedBox(height: 15,),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RichText(
                    text: TextSpan(
                        text: AppLocalizations.of(context)!.dateRes,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Tajawal',
                            color: Color.fromRGBO(7, 45, 68, 1)
                        ),
                        children: [
                          TextSpan(
                              text: widget.order.date,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Tajawal',
                                  color: Color.fromRGBO(7, 45, 68, 1)
                              )
                          )
                        ]
                    ),
                  )
              ),
              const SizedBox(height: 15,),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RichText(
                    text: TextSpan(
                        text: "${widget.order.buildingAccepted!} - ${widget.order.floorAccepted!} - ${widget.order.hallAccepted!}",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Tajawal',
                            color: Color.fromRGBO(7, 45, 68, 1)
                        )
                    ),

                  )
              ),
              const SizedBox(height: 15,),
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
                                color: Color.fromRGBO(7, 45, 68, 1)
                            ),
                            children: [
                              TextSpan(
                                  text: widget.order.times?[index],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Tajawal',
                                      color: Color.fromRGBO(7, 45, 68, 1)
                                  )
                              )
                            ]
                        ),
                      )
                  );
                }),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(6, 68, 105, 1)),
                    side: MaterialStateProperty.all(const BorderSide(
                        color: Color.fromRGBO(6, 68, 105, 1), width: 1)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(30, 10, 30, 10))),
                onPressed: (){
                  //TODO:API Call

                  showDialog<String>(
                      context: context,
                      barrierDismissible: false,
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
                                    "${AppLocalizations.of(context)!.messageSent1} ${AppLocalizations.of(context)!.messageSent2}",
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
                                    textAlign: TextAlign.center,
                                  ),
                                  // const SizedBox(height: 5,),
                                  // Text(
                                  //   AppLocalizations.of(context)!.messageSent2,
                                  //   style: const TextStyle(
                                  //       color: Color
                                  //           .fromRGBO(
                                  //           6,
                                  //           68,
                                  //           105,
                                  //           1),
                                  //       fontFamily:
                                  //       'Tajawal',
                                  //       fontSize:
                                  //       20,
                                  //       fontWeight:
                                  //       FontWeight
                                  //           .w700),
                                  // ),
                                  // const SizedBox(
                                  //   height: 20,
                                  // ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                      Navigator.popAndPushNamed(context,home);
                                    },
                                    child: SizedBox(
                                      width: 86,
                                      height: 86,
                                      child: Image
                                          .asset(
                                        "assets/images/delete_profile_confirmation.png",
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ));
                },
                child: Text(AppLocalizations.of(context)!.confirm,style: const TextStyle(color: Colors.white,fontFamily: "Tajawal",fontWeight: FontWeight.w400,fontSize: 16),)
            ),
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    side: MaterialStateProperty.all(const BorderSide(
                        color: Color.fromRGBO(6, 68, 105, 1), width: 1)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(30, 10, 30, 10))),
                onPressed: (){
                  Navigator.pushNamed(context, home);
                },
                child: Text(AppLocalizations.of(context)!.del,style: const TextStyle(color: Color.fromRGBO(6, 68, 105, 1),fontFamily: "Tajawal",fontWeight: FontWeight.w400,fontSize: 16),)
            )
          ],
        )
      ],
    );
  }
}