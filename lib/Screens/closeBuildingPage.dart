import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:minamakram/constants/colors.dart';
import '../Widgets/requestingOrderHallFirstWidget.dart';

class closeBuildingPage extends StatefulWidget {
  const closeBuildingPage({Key? key}) : super(key: key);

  @override
  State<closeBuildingPage> createState() => _closeBuildingPageState();
}

class _closeBuildingPageState extends State<closeBuildingPage> {

  bool buildingBool = false;
  bool floorBool = false;
  bool hallBool = false;
  List<String> buildings = ["مبنى الامير", "مبنى البطل", "مبنى الروماني"];
  List<String> floors = ["الدور الاول", "الدور التاني", "الدور التالت"];
  List<String> halls = ["قاعة 1", "قاعة 2", "قاعة 3"];
  String building = "اختيار المبنى";
  String floor = "اختيار الدور";
  String hall = "اختيار القاعة";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context)!.closeBuildingMessage,
              style: const TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: MyColors.primaryColor
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.pleaseEnterDetails,
                  style: const TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: MyColors.primaryColor
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
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
                        width: MediaQuery.of(context).size.width/2.3,
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
                                    setState(() {
                                      buildingBool = !buildingBool;
                                    });
                                  },
                                  child: buildingBool? const Icon(Icons.arrow_drop_up):const Icon(Icons.arrow_drop_down),
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
                        width: MediaQuery.of(context).size.width/2.3,
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
                                    setState(() {
                                      floorBool = !floorBool;
                                    });
                                  },
                                  child: floorBool? const Icon(Icons.arrow_drop_up):const Icon(Icons.arrow_drop_down),
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
                        width: MediaQuery.of(context).size.width/2.3,
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
                                    setState(() {
                                      hallBool = !hallBool;
                                    });
                                  },
                                  child: hallBool? const Icon(Icons.arrow_drop_up):const Icon(Icons.arrow_drop_down),
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
          ],
        ),
      ),
    );
  }
}

AppBar getCloseBuildingBar(BuildContext context){
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Text(
      AppLocalizations.of(context)!.close,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        color: MyColors.primaryColor,
        fontSize: 24,
        fontFamily: 'Tajawal'
      ),
    ),
    leading:
      IconButton(
        onPressed: () {
          sendBroadcast(BroadcastMessage(name: "home"));
        },
        icon: const Icon(
          Icons.arrow_back,
          color: MyColors.primaryColor,
        ),
      ),
  );
}