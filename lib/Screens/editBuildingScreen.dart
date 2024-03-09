import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:minamakram/models/building/floorObject.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../models/building/buildingObject.dart';

class EditBuilding extends StatefulWidget {
  Building item;
  bool isAdmin;
  EditBuilding({Key? key, required this.isAdmin, required this.item})
      : super(key: key);

  @override
  State<EditBuilding> createState() => _EditBuildingState();
}

class _EditBuildingState extends State<EditBuilding> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  bool showDetails = false;
  List<bool>? showFloorDetails = List.generate(100, (index) => false);
  TextEditingController buildingName = TextEditingController();
  List<TextEditingController> floorControllers = [];
  List<List<TextEditingController>> hallControllers = [];
  List<List<List<TextEditingController>>> newHallControllers = [];

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  void initState() {
    buildingName.text = widget.item.name;
    for (var element in widget.item.floors) {
      newHallControllers.add([]);
      TextEditingController newFloor = TextEditingController();
      newFloor.text = element.floorName.toString();
      floorControllers.add(newFloor);
      hallControllers.add([]);
      var indexOfFloor = widget.item.floors.indexOf(element);
      for (var element in element.rooms) {
        TextEditingController newHall = TextEditingController();
        newHall.text = "${element.name!}(${element.capacity} Chair)";
        hallControllers[indexOfFloor].add(newHall);
      }
    }
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
          AppLocalizations.of(context)!.buildingDet,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            fontFamily: 'Tajawal',
            color: MyColors.secondaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.1,
                      image: AssetImage(
                        "assets/images/knissa.png",
                      ),
                      fit: BoxFit.contain)),
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 333,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    items: imgList
                        .map((item) => Container(
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      Image.network(item,
                                          fit: BoxFit.cover, width: 1000.0),
                                      Positioned(
                                        bottom: 0.0,
                                        left: 0.0,
                                        right: 0.0,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(200, 0, 0, 0),
                                                Color.fromARGB(0, 0, 0, 0)
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 20.0),
                                          child: Text(
                                            'No. ${imgList.indexOf(item)} image',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ))
                        .toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.fromLTRB(28, 0, 28, 0),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: MyColors.simpleBlue,
                        width: 1,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 10,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          child: TextFormField(
                                            controller: buildingName,
                                            style: TextStyle(
                                                fontFamily: 'Tajawal',
                                                fontSize: 24,
                                                fontWeight: FontWeight.w700,
                                                color: MyColors.primaryColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.item.floors.add(
                                              Floor(floorName: "", rooms: []));
                                          floorControllers.add(
                                              TextEditingController(
                                                  text: "Floor Name"));
                                          hallControllers.add([]);
                                          newHallControllers.add([]);
                                        });
                                      },
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: MyColors.primaryColor,
                                                width: 1),
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.add,
                                          size: 15,
                                          color: MyColors.primaryColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 20,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: MyColors.secondaryColor),
                                  child: Text(
                                    AppLocalizations.of(context)!.addFloor,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: List.generate(widget.item.floors.length,
                                (index) {
                              return Stack(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: MyColors.simpleBlue,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.3,
                                              height: 50,
                                              padding: const EdgeInsets.only(
                                                  bottom: 10,
                                                  right: 10,
                                                  left: 10),
                                              child: TextFormField(
                                                controller:
                                                    floorControllers[index],
                                                style: TextStyle(
                                                    fontFamily: 'Tajawal',
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w500,
                                                    color: MyColors.primaryColor),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: 20,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: const Color
                                                              .fromRGBO(
                                                              6, 68, 105, 1),
                                                        )),
                                                    child: Icon(
                                                      Icons.clear,
                                                      size: 15,
                                                      color: MyColors.secondaryColor,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      hallControllers[index].add(
                                                          TextEditingController());
                                                      newHallControllers[index]
                                                          .add([
                                                        TextEditingController(),
                                                        TextEditingController()
                                                      ]);
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 20,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: const Color
                                                              .fromRGBO(
                                                              6, 68, 105, 1),
                                                        )),
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 15,
                                                      color: MyColors.secondaryColor,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            30, 0, 30, 15),
                                        child: Column(
                                          children: List.generate(
                                              widget.item.floors[index].rooms
                                                  .length, (numOfFloor) {
                                            return Column(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          MyColors.simpleBlue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 10),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            3,
                                                        child: TextFormField(
                                                          enabled: false,
                                                          controller:
                                                              hallControllers[
                                                                      index]
                                                                  [numOfFloor],
                                                          style:
                                                              const TextStyle(
                                                                  fontFamily:
                                                                      'Tajawal',
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          7,
                                                                          45,
                                                                          68,
                                                                          1)),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: Container(
                                                          width: 20,
                                                          height: 20,
                                                          decoration:
                                                              BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border
                                                                      .all(
                                                                    color: const Color
                                                                        .fromRGBO(
                                                                        6,
                                                                        68,
                                                                        105,
                                                                        1),
                                                                  )),
                                                          child: Icon(
                                                            Icons.clear,
                                                            size: 15,
                                                            color: MyColors.secondaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                )
                                              ],
                                            );
                                          }),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      //TODO:NEW rooms
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            30, 0, 30, 15),
                                        child: Column(
                                          children: List.generate(
                                              newHallControllers[index].length,
                                              (newRoom) {
                                            return SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  12,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4.1,
                                                    height:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromRGBO(
                                                            208, 215, 225, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: TextFormField(
                                                      controller:
                                                          newHallControllers[
                                                                  index]
                                                              [newRoom][0],
                                                      style: TextStyle(
                                                          fontFamily: 'Tajawal',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: MyColors.primaryColor),
                                                      decoration:
                                                          const InputDecoration(
                                                              label: Text(
                                                                  "رقم القاعة*")),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromRGBO(
                                                            208, 215, 225, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3.5,
                                                    height:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    child: TextFormField(
                                                      controller:
                                                          newHallControllers[
                                                                  index]
                                                              [newRoom][0],
                                                      style: const TextStyle(
                                                          fontFamily: 'Tajawal',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: MyColors.primaryColor),
                                                      decoration:
                                                          const InputDecoration(
                                                              label: Text(
                                                                  "عدد الكراسي*")),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      )
                                    ],
                                  ),
                                  Positioned(
                                    top: 40,
                                    left: 20,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: MyColors.secondaryColor
                                      ),
                                      child: Text(
                                        AppLocalizations.of(context)!.addHall,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStateProperty.all(MyColors.primaryColor),
                        side: MaterialStateProperty.all(const BorderSide(
                            color: MyColors.secondaryColor, width: 1)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.fromLTRB(60, 14, 60, 14))),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, home, arguments: true);
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
