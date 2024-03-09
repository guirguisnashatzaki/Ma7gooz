import 'package:flutter/material.dart';
import 'package:minamakram/constants/strings.dart';
import 'package:minamakram/models/building/buildingObject.dart';
import 'package:minamakram/models/building/floorObject.dart';
import 'package:minamakram/models/room/roomObject.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/colors.dart';

class BuildingPage extends StatefulWidget {
  const BuildingPage({Key? key}) : super(key: key);

  @override
  State<BuildingPage> createState() => _BuildingPageState();
}

class _BuildingPageState extends State<BuildingPage> {
  List? myBuildings;
  Widget? buildingListWidget;

  @override
  void initState() {
    myBuildings = [
      Building(
          imageUrl: "https://via.placeholder.com/150/92c952",
          name: "El batal",
          noOfFloors: 1,
          noOfHalls: 1,
          floors: [
            Floor(floorName: "2", rooms: [
              Room(
                name: "ka3a 1",
                building: "El-batal",
                capacity: 50,
                hasAirConditioner: false,
                hasTv: true,
                id: 1
              )
            ])
          ]
      ),
      Building(
          imageUrl: "https://via.placeholder.com/150/92c952",
          name: "El batal",
          noOfFloors: 15,
          noOfHalls: 30,
          floors: [
            Floor(floorName: "2", rooms: [
              Room(
                  name: "ka3a 1",
                  building: "El-batal",
                  capacity: 50,
                  hasAirConditioner: false,
                  hasTv: true,
                  id: 1
              )
            ])
          ]
      ),
    ];
    buildingListWidget = GridView.builder(

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 50,
        crossAxisSpacing: 10,
        // width / height: fixed for *all* items
        childAspectRatio: 0.7,
      ),
      // return a custom ItemCard
      itemBuilder: (context, i) => BuildingItem(item: myBuildings?[i]),
      itemCount: myBuildings!.length,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: MyColors.secondaryColor,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          AppLocalizations.of(context)!.building,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            fontFamily: 'Tajawal',
            color: MyColors.secondaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        child: buildingListWidget,
      ),
    );
  }
}

class BuildingItem extends StatelessWidget {
  Building item;
  BuildingItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15,),
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, buildingDetails,arguments: [item,true]);
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: 180,
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1, color: const Color.fromRGBO(207, 198, 198, 1))),
                  child: Image.asset("assets/images/img.png"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  item.name,
                  style: const TextStyle(
                    color: MyColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Tajawal',
                  ),
                ),
                Text(
                  "عدد الادوار ${item.noOfFloors}",
                  style: const TextStyle(
                    color: MyColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Tajawal',
                  ),
                ),
                Text(
                  "عدد القاعات ${item.noOfHalls}",
                  style: const TextStyle(
                    color: MyColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Tajawal',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20,)
      ],
    );
  }
}
