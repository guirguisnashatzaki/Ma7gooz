import 'package:carousel_slider/carousel_slider.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:minamakram/constants/colors.dart';
import 'package:minamakram/constants/strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../constants/Language.dart';
import '../main.dart';
import '../models/building/buildingObject.dart';
import '../models/building/floorObject.dart';
import '../models/room/roomObject.dart';
import 'buildingPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? myBuildings = [
  Building(
  imageUrl: "https://via.placeholder.com/150/92c952",
  name: "El batal",
  noOfFloors: 1,
  noOfHalls: 1,
  floors: [
  Floor(floorNum: 2, rooms: [
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
  Floor(floorNum: 2, rooms: [
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
  bool isAr = true;
  bool langShown = false;
  String name = "اسم الخادم";
  final GlobalKey<ScaffoldState> _key = GlobalKey();

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerRight,
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Color(0xFF778899),
                    // backgroundImage:
                    //     NetworkImage("Your Photo Url"), // for Network image
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "اسم الخادم",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: 'Tajawal'),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color: Color.fromRGBO(237, 228, 228, 1),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  langShown = !langShown;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          langShown = !langShown;
                        });
                      },
                      icon: Icon(
                        langShown ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.chooseLan,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              decoration: TextDecoration.none,
                              fontFamily: 'Tajawal'),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(Icons.language)
                      ],
                    )
                  ],
                ),
              ),
            ),
            langShown
                ? Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          isAr = true;
                        });
                        Locale local = await setLocale("ar");
                        MyApp.setLocale(context, local);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isAr
                              ? const Color.fromRGBO(208, 215, 225, 1)
                              : Colors.white,
                        ),
                        margin: const EdgeInsets.fromLTRB(180, 0, 0, 0),
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.centerRight,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                width: 20,
                                height: 20,
                                child: Flag.fromString("EG")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "العربية",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Tajawal'),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            langShown
                ? Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          isAr = false;
                        });
                        Locale local0 = await setLocale("en");
                        MyApp.setLocale(context, local0);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isAr
                              ? Colors.white
                              : const Color.fromRGBO(208, 215, 225, 1),
                        ),
                        margin: const EdgeInsets.fromLTRB(180, 0, 0, 0),
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.centerRight,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                width: 20,
                                height: 20,
                                child: Flag.fromString("US")),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "English",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Tajawal'),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            // Material(
            //   color: Colors.white,
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.pushNamed(context, buildings);
            //     },
            //     child: Container(
            //       padding: const EdgeInsets.all(10),
            //       alignment: Alignment.centerRight,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           Text(
            //             AppLocalizations.of(context)!.building,
            //             style: const TextStyle(
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.w700,
            //                 fontSize: 16,
            //                 decoration: TextDecoration.none,
            //                 fontFamily: 'Tajawal'),
            //           ),
            //           const SizedBox(
            //             width: 15,
            //           ),
            //           const Icon(Icons.blinds)
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            const Divider(
              thickness: 2,
              color: Color.fromRGBO(237, 228, 228, 1),
            ),
            Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  //TODO:API CALL

                  Navigator.popAndPushNamed(context, login);

                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.logout,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                            fontFamily: 'Tajawal'),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(Icons.close)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, notification);
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: homeWidget(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 20,
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        currentIndex: 1,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: MyColors.primaryColor,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          switch (index){
            case 0:
              Navigator.popAndPushNamed(context, profile);
              break;
            case 1:
              break;
            case 2:
              Navigator.popAndPushNamed(context, ordersPage);
              break;
            case 3:
              Navigator.popAndPushNamed(context, requestingOrderPage);
              break;

          }
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: AppLocalizations.of(context)!.profile,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add_shopping_cart),
            label: AppLocalizations.of(context)!.orders,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_bag_outlined),
            label: AppLocalizations.of(context)!.booking,
          ),
        ],
      ),
    );
  }
}

class homeWidget extends StatefulWidget {
  const homeWidget({Key? key}) : super(key: key);

  @override
  State<homeWidget> createState() => _homeWidgetState();
}

class _homeWidgetState extends State<homeWidget> {

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List? myBuildings = [
    Building(
        imageUrl: "https://via.placeholder.com/150/92c952",
        name: "El batal",
        noOfFloors: 1,
        noOfHalls: 1,
        floors: [
          Floor(floorNum: 2, rooms: [
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
          Floor(floorNum: 2, rooms: [
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
  String name = "اسم الخادم";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: 0.1,
              image: AssetImage(
                "assets/images/knissa.png",
              ),
              fit: BoxFit.contain
          )
      ),
      padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "${AppLocalizations.of(context)!.hello} $name",
              style: const TextStyle(
                color: Color.fromRGBO(6, 68, 105, 1),
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: MediaQuery.of(context).size.width,
            child: Text(
              AppLocalizations.of(context)!.homeMessage,
              style: const TextStyle(
                color: Color.fromRGBO(6, 68, 105, 1),
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/4,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(myBuildings!.length, (index) => BuildingItem(item: myBuildings?[index])),
            ),
          ),

          const SizedBox(height: 30,),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: MediaQuery.of(context).size.width,
            child: Text(
              AppLocalizations.of(context)!.abuTalaat,
              style: const TextStyle(
                color: Color.fromRGBO(6, 68, 105, 1),
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
                height: MediaQuery.of(context).size.height/4,
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
                  borderRadius:
                  const BorderRadius.all(Radius.circular(5.0)),
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
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}



