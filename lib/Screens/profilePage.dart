import 'package:flutter/material.dart';
import 'package:minamakram/constants/strings.dart';
import '../constants/Language.dart';
import '../constants/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isAr = true;
  bool langShown = false;
  String name = "";
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
      body: profilePage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 20,
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        currentIndex: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: MyColors.primaryColor,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.popAndPushNamed(context, home);
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

class profilePage extends StatelessWidget {
  const profilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MyColors.primaryColor,
              MyColors.myWhite,
            ],
          ),
        ),
      )),
      Positioned(
          top: 30,
          left: 0,
          child: PopupMenuButton(
              color: Colors.white,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text(AppLocalizations.of(context)!.edit),
                    onTap: () {
                      Navigator.pushNamed(context, editProfile);
                    },
                  ),
                  // PopupMenuItem(
                  //   child: Text(AppLocalizations.of(context)!.delAccount),
                  //   onTap: () {
                  //     showDialog<String>(
                  //         context: context,
                  //         builder: (BuildContext context) => AlertDialog(
                  //               content: Container(
                  //                 width: 300,
                  //                 height: 200,
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(10),
                  //                   color: Colors.white,
                  //                 ),
                  //                 child: Column(
                  //                   children: [
                  //                     const SizedBox(
                  //                       height: 15,
                  //                     ),
                  //                     Text(
                  //                       AppLocalizations.of(context)!.delAccQuestion,
                  //                       style: const TextStyle(
                  //                           color:
                  //                               Color.fromRGBO(6, 68, 105, 1),
                  //                           fontFamily: 'Tajawal',
                  //                           fontSize: 24,
                  //                           fontWeight: FontWeight.w700),
                  //                     ),
                  //                     const SizedBox(
                  //                       height: 50,
                  //                     ),
                  //                     Row(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.center,
                  //                       children: [
                  //                         ElevatedButton(
                  //                           style: ButtonStyle(
                  //                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //                                   RoundedRectangleBorder(
                  //                                       borderRadius:
                  //                                           BorderRadius.circular(
                  //                                               10))),
                  //                               backgroundColor: MaterialStateProperty.all(
                  //                                   MyColors.primaryColor),
                  //                               side: MaterialStateProperty.all(
                  //                                   const BorderSide(
                  //                                       color: Color.fromRGBO(
                  //                                           6, 68, 105, 1),
                  //                                       width: 1)),
                  //                               padding: MaterialStateProperty.all(
                  //                                   const EdgeInsets.fromLTRB(30, 10, 30, 10))),
                  //                           onPressed: () {
                  //                             //TODO: API Call
                  //
                  //                             Navigator.pop(context);
                  //
                  //                             showDialog<String>(
                  //                                 context: context,
                  //                                 builder: (BuildContext
                  //                                         context) =>
                  //                                     AlertDialog(
                  //                                       content: Container(
                  //                                         width: 300,
                  //                                         height: 200,
                  //                                         decoration:
                  //                                             BoxDecoration(
                  //                                           borderRadius:
                  //                                               BorderRadius
                  //                                                   .circular(
                  //                                                       10),
                  //                                           color:
                  //                                               Colors.white,
                  //                                         ),
                  //                                         child: Column(
                  //                                           children: [
                  //                                             const SizedBox(
                  //                                               height: 15,
                  //                                             ),
                  //                                             Text(
                  //                                               AppLocalizations.of(context)!.delAccQuestion,
                  //                                               style: const TextStyle(
                  //                                                   color: Color
                  //                                                       .fromRGBO(
                  //                                                           6,
                  //                                                           68,
                  //                                                           105,
                  //                                                           1),
                  //                                                   fontFamily:
                  //                                                       'Tajawal',
                  //                                                   fontSize:
                  //                                                       24,
                  //                                                   fontWeight:
                  //                                                       FontWeight
                  //                                                           .w700),
                  //                                             ),
                  //                                             const SizedBox(
                  //                                               height: 50,
                  //                                             ),
                  //                                             SizedBox(
                  //                                               width: 86,
                  //                                               height: 86,
                  //                                               child: Image
                  //                                                   .asset(
                  //                                                 "assets/images/delete_profile_confirmation.png",
                  //                                               ),
                  //                                             )
                  //                                           ],
                  //                                         ),
                  //                                       ),
                  //                                     ));
                  //
                  //                             //Navigator.popAndPushNamed(context, "/login");
                  //                           },
                  //                           child: Text(
                  //                             AppLocalizations.of(context)!.confirm,
                  //                             style: const TextStyle(
                  //                                 fontWeight: FontWeight.w400,
                  //                                 fontSize: 16,
                  //                                 fontFamily: 'Tajawal',
                  //                                 color: Colors.white),
                  //                           ),
                  //                         ),
                  //                         const SizedBox(
                  //                           width: 50,
                  //                         ),
                  //                         ElevatedButton(
                  //                           style: ButtonStyle(
                  //                               shape: MaterialStateProperty.all<
                  //                                       RoundedRectangleBorder>(
                  //                                   RoundedRectangleBorder(
                  //                                       borderRadius:
                  //                                           BorderRadius.circular(
                  //                                               10))),
                  //                               backgroundColor:
                  //                                   MaterialStateProperty.all(
                  //                                       Colors.white),
                  //                               side:
                  //                                   MaterialStateProperty.all(
                  //                                       const BorderSide(
                  //                                 color: Color.fromRGBO(
                  //                                     6, 68, 105, 1),
                  //                                 width: 1,
                  //                               )),
                  //                               padding: MaterialStateProperty.all(
                  //                                   const EdgeInsets.fromLTRB(
                  //                                       30, 10, 30, 10))),
                  //                           onPressed: () {
                  //                             Navigator.pop(context);
                  //                           },
                  //                           child: Text(
                  //                             AppLocalizations.of(context)!.del,
                  //                             style: const TextStyle(
                  //                                 fontWeight: FontWeight.w400,
                  //                                 fontSize: 16,
                  //                                 fontFamily: 'Tajawal',
                  //                                 color: Color.fromRGBO(
                  //                                     6, 68, 105, 1)),
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     )
                  //                   ],
                  //                 ),
                  //               ),
                  //             ));
                  //   },
                  // )
                ];
              })
      ),
      Positioned(
          top: 30,
          right: 0,
          child: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/home");
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          )),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        top: 216,
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.1,
                      image: AssetImage(
                        "assets/images/knissa.png",
                      ),
                      fit: BoxFit.contain
                  ),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              )),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "اسم الخادم",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    fontFamily: 'Tajawal',
                    color: Colors.black),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "الخدمة",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    fontFamily: 'Tajawal',
                    color: Colors.black),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "رقم الموبايل",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    fontFamily: 'Tajawal',
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      Positioned(
          top: 104,
          left: 105,
          right: 105,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 8),
                shape: BoxShape.circle),
            width: 176,
            height: 176,
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/person_image.jpg"),
            ),
          )),
    ]);
  }
}
