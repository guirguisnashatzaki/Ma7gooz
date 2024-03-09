import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../constants/Language.dart';
import '../constants/colors.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? selectedImage;
  bool isAr = true;
  bool langShown = false;
  String name = "";
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  TextEditingController nameController = TextEditingController();
  TextEditingController serviceController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  bool mobBool = true;
  bool nameBool = true;
  bool serBool = true;

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
      body: Stack(children: [
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
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
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
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          suffixIcon: nameBool? const SizedBox():const Icon(Icons.warning_outlined,color: Colors.red,),
                          hintText: AppLocalizations.of(context)!.name,
                          hintStyle: TextStyle(
                              color: nameBool?Colors.black:Colors.red,
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: nameBool? MyColors.secondaryColor:Colors.red,
                              width: 2.0,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: nameBool? MyColors.secondaryColor:Colors.red,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: nameBool? MyColors.secondaryColor:Colors.red,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: TextFormField(
                        controller: serviceController,
                        decoration: InputDecoration(
                          suffixIcon: serBool? const SizedBox():const Icon(Icons.warning_outlined,color: Colors.red,),
                          hintText: AppLocalizations.of(context)!.service,
                          hintStyle: TextStyle(
                              color: serBool?Colors.black:Colors.red,
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: serBool? MyColors.secondaryColor:Colors.red,
                              width: 2.0,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: serBool? MyColors.secondaryColor:Colors.red,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: serBool? MyColors.secondaryColor:Colors.red,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: TextFormField(
                        controller: mobileController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          suffixIcon: mobBool? const SizedBox():const Icon(Icons.warning_outlined,color: Colors.red,),
                          hintText: AppLocalizations.of(context)!.mobNum,
                          hintStyle: TextStyle(
                              color: mobBool?Colors.black:Colors.red,
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: mobBool? MyColors.secondaryColor:Colors.red,
                              width: 2.0,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: mobBool? MyColors.secondaryColor:Colors.red,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: mobBool? MyColors.secondaryColor:Colors.red,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(239, 237, 237, 1)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                            )
                        ),
                        padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(30,15,30,15))
                      ),
                      onPressed: () {
                          if(mobileController.text.isEmpty){
                            setState(() {
                              mobBool = false;
                            });
                          }else{
                            setState(() {
                              mobBool = true;
                            });
                          }

                          if(serviceController.text.isEmpty){
                            setState(() {
                              serBool = false;
                            });
                          }else{
                            setState(() {
                              serBool = true;
                            });
                          }

                          if(nameController.text.isEmpty){
                            setState(() {
                              nameBool = false;
                            });
                          }else{
                            setState(() {
                              nameBool = true;
                            });
                          }

                          if(mobBool && nameBool && serBool){
                              //TODO:API call

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
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Center(
                                          child: Text(
                                            AppLocalizations.of(context)!.editAccQuestion,
                                            style: const TextStyle(
                                                color:
                                                MyColors.secondaryColor,
                                                fontFamily: 'Tajawal',
                                                fontSize: 24,
                                                fontWeight: FontWeight.w700),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                                  backgroundColor: MaterialStateProperty.all(
                                                      MyColors.primaryColor),
                                                  side: MaterialStateProperty.all(
                                                      BorderSide(
                                                          color: MyColors.secondaryColor,
                                                          width: 1)),
                                                  padding: MaterialStateProperty.all(
                                                      const EdgeInsets.fromLTRB(30, 10, 30, 10))),
                                              onPressed: () {
                                                //TODO: API Call

                                                Navigator.pop(context);

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
                                                            child: Column(
                                                              children: [
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(context)!.editSavedMessage,
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
                                                                ),
                                                                const SizedBox(
                                                                  height: 50,
                                                                ),
                                                                SizedBox(
                                                                  width: 86,
                                                                  height: 86,
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/delete_profile_confirmation.png",
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ));

                                                //Navigator.popAndPushNamed(context, "/login");
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)!.confirm,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                    fontFamily: 'Tajawal',
                                                    color: Colors.white),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                                  backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white),
                                                  side:
                                                  MaterialStateProperty.all(
                                                      BorderSide(
                                                        color: MyColors.secondaryColor,
                                                        width: 1,
                                                      )),
                                                  padding: MaterialStateProperty.all(
                                                      const EdgeInsets.fromLTRB(
                                                          30, 10, 30, 10))),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)!.del,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                    fontFamily: 'Tajawal',
                                                    color: MyColors.secondaryColor),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          }


                      },
                      child: Text(
                        AppLocalizations.of(context)!.save,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: 'Tajawal',
                            color: MyColors.secondaryColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 104,
            left: 105,
            right: 105,
            child: InkWell(
              onTap: () async{
                final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
                if(returnedImage == null)return;
                setState(() {
                  selectedImage = File(returnedImage.path);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 8),
                    shape: BoxShape.circle),
                width: 176,
                height: 176,
                child:selectedImage == null? const CircleAvatar(
                  backgroundImage:AssetImage("assets/images/person_image.jpg"),
                ): ClipOval(
                  child: Image.file(selectedImage!),
                ),
              ),
            )),
      ]),
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
              Navigator.popAndPushNamed(context, "/home");
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
