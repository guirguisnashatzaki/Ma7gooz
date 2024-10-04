import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';
import 'package:minamakram/constants/strings.dart';
import '../constants/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class profilePage extends StatefulWidget {
  bool isAr;
  profilePage({Key? key,required this.isAr}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  bool menuOpened = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          child: InkWell(
            onTap: (){
              setState(() {
                menuOpened = false;
              });
            },
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
            ),
          )),
      Positioned(
          top: 30,
          left: widget.isAr?0:null,
          right: widget.isAr?null:0,
          child: IconButton(
            icon: const Icon(Icons.more_vert,color: Colors.white,),
            onPressed: (){
              setState(() {
                menuOpened = !menuOpened;
              });
            },
          )
      ),
      menuOpened ? Positioned(
          top: 70,
          left: widget.isAr?0:null,
          right: widget.isAr?null:0,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 15),
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 40),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: InkWell(
              onTap: (){
                setState(() {
                  menuOpened = false;
                });

                sendBroadcast(BroadcastMessage(name: "edit profile"));
              },
              child: Text(
                AppLocalizations.of(context)!.edit,
                style: const TextStyle(
                    fontFamily: "Tajawal",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black
                ),
              ),
            ),
          )
      ):const SizedBox(),
      Positioned(
          top: 30,
          right: widget.isAr?0:null,
          left: widget.isAr? null:0,
          child: IconButton(
            onPressed: () {
              sendBroadcast(BroadcastMessage(name: "profile error"));
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
        child: InkWell(
          onTap: (){
            setState(() {
              menuOpened = false;
            });
          },
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