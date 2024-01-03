import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:minamakram/Screens/mainHomePage.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../models/building/buildingObject.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildingDetailsPage extends StatefulWidget {
  Building item;
  BuildingDetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  State<BuildingDetailsPage> createState() => _BuildingDetailsPageState();
}

class _BuildingDetailsPageState extends State<BuildingDetailsPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  bool showDetails = false;
  List<bool>? showFloorDetails = List.generate(100, (index) => false);

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

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
            color: Color.fromRGBO(6, 68, 105, 1),
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          AppLocalizations.of(context)!.buildingDet,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            fontFamily: 'Tajawal',
            color: Color.fromRGBO(6, 68, 105, 1),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.1,
                image: AssetImage(
                  "assets/images/knissa.png",
                ),
                fit: BoxFit.contain
            )
        ),
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
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              child: Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.fromLTRB(28, 0, 28, 0),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromRGBO(208, 215, 225, 1),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.item.name,
                          style: const TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(7, 45, 68, 1)),
                        ),
                        IconButton(
                            icon: showDetails? const Icon(Icons.arrow_drop_up, size: 30):const Icon(Icons.arrow_drop_down, size: 30),
                            onPressed: () {
                                setState(() {
                                  showDetails = !showDetails;
                                });
                            }),
                      ],
                    ),
                    showDetails? Column(
                      children: List.generate(widget.item.floors.length, (index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.item.floors[index].floorNum.toString(),
                                  style: const TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(7, 45, 68, 1)),
                                ),
                                IconButton(
                                    icon:
                                    showFloorDetails![index]? const Icon(Icons.arrow_drop_up, size: 30):const Icon(Icons.arrow_drop_down, size: 30),
                                    onPressed: () {
                                      setState(() {
                                        showFloorDetails![index] = !showFloorDetails![index];
                                      });

                                    }),
                              ],
                            ),
                            showFloorDetails![index]? Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Column(
                                children: List.generate(
                                    widget.item.floors[index].rooms.length,
                                    (numOfFloor) {
                                  return Row(
                                    children: [
                                      const Text(
                                        "\u2022 ",
                                        style: TextStyle(
                                            fontFamily: 'Tajawal',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(7, 45, 68, 1)),
                                      ),
                                      Text(
                                        "${widget.item.floors[index].rooms[numOfFloor]
                                                .name} (${widget.item.floors[index]
                                                .rooms[numOfFloor].capacity})",
                                        style: const TextStyle(
                                            fontFamily: 'Tajawal',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(7, 45, 68, 1)),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ):const SizedBox()
                          ],
                        );
                      }),
                    ):const SizedBox(),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 60,),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateProperty.all(MyColors.primaryColor),
                  side: MaterialStateProperty.all(const BorderSide(
                      color: Color.fromRGBO(6, 68, 105, 1), width: 1)),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.fromLTRB(60, 14, 60, 14))),
              onPressed: (){
                Navigator.popAndPushNamed(context, home,arguments: true);
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
    );
  }
}
