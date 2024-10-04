import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Widgets/requestingOrderHallFirstWidget.dart';
import '../constants/Language.dart';
import '../constants/colors.dart';

class EditProfilePage extends StatefulWidget {
  bool isAr;
  EditProfilePage({Key? key,required this.isAr}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? selectedImage;
  bool isAr = true;
  bool langShown = false;
  String name = "";
  bool mobileMessage = false;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List services = [
    "خدمة ثانوي",
    "خدمة اعدادي",
    "خدمة ابتدائي",
    "خدمة شباب",
  ];


  TextEditingController nameController = TextEditingController();
  TextEditingController serviceController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  bool mobBool = true;
  bool nameBool = true;
  bool serBool = true;
  bool servicesBool = false;

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

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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
            right: widget.isAr?0:null,
            left: widget.isAr?null:0,
            child: IconButton(
              onPressed: () {
                sendBroadcast(BroadcastMessage(name: "go to profile"));
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
                              color: nameBool?MyColors.textColor:Colors.red,
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: nameBool? MyColors.primaryColor:Colors.red,
                              width: 2.0,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: nameBool? MyColors.primaryColor:Colors.red,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: nameBool? MyColors.primaryColor:Colors.red,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          servicesBool = !servicesBool;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: TextFormField(
                          enabled: false,
                          controller: serviceController,
                          decoration: InputDecoration(
                            suffixIcon: serBool?
                            Icon(
                              servicesBool?Icons.arrow_drop_up:Icons.arrow_drop_down,
                              color: MyColors.primaryColor,):
                            Icon(
                              servicesBool?Icons.arrow_drop_up:Icons.arrow_drop_down,
                              color: Colors.red,),
                            hintText: AppLocalizations.of(context)!.service,
                            hintStyle: TextStyle(
                                color: serBool?MyColors.textColor:Colors.red,
                                fontFamily: 'Tajawal',
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: serBool? MyColors.primaryColor:Colors.red,
                                width: 2.0,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: serBool? MyColors.primaryColor:Colors.red,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: serBool? MyColors.primaryColor:Colors.red,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    servicesBool?Container(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: MyColors.primaryColor,
                            width: 2.0,
                          ),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 6)
                          ]),
                      child: Column(
                        children: List.generate(
                            services.length,
                                (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  serviceController.text = services[index];
                                  servicesBool = false;
                                });
                              },
                              child: ListItem(
                                text: services[index],
                                ifFirst: index == 0 ? true : false,
                                ifLast:
                                index == services.length - 1 ? true : false,
                              ),
                            )),
                      ),
                    ):const SizedBox.shrink(),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: TextFormField(
                        controller: mobileController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          suffixIcon: mobBool? const SizedBox():const Icon(Icons.warning_outlined,color: Colors.red,),
                          hintText: AppLocalizations.of(context)!.mobNum,
                          hintStyle: TextStyle(
                              color: mobBool?MyColors.textColor:Colors.red,
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: mobBool? MyColors.primaryColor:Colors.red,
                              width: 2.0,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: mobBool? MyColors.primaryColor:Colors.red,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: mobBool? MyColors.primaryColor:Colors.red,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    mobileMessage?Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            right: 16,
                            left: 16,
                            top: 10
                          ),
                          child: Text(
                              AppLocalizations.of(context)!.mobileValidationError,
                              style: const TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Tajawal'
                              ),
                          ),
                        )
                      ],
                    ):const SizedBox.shrink(),
                    const SizedBox(height: 35),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyColors.primaryColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                            )
                        ),
                        padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(35,15,35,15))
                      ),
                      onPressed: () async {
                          if(mobileController.text.isEmpty){
                            setState(() {
                              mobBool = false;
                              mobileMessage = false;
                            });
                          }else{
                            setState(() {
                              mobBool = true;
                            });

                            if(mobileController.text.length != 11){
                              setState(() {
                                mobBool = false;
                                mobileMessage = true;
                              });
                            }else{
                              setState(() {
                                mobBool = true;
                                mobileMessage = false;
                              });
                            }
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

                            await showDialog<String>(
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
                                                      const BorderSide(
                                                          color: MyColors.secondaryColor,
                                                          width: 1)),
                                                  padding: MaterialStateProperty.all(
                                                      const EdgeInsets.fromLTRB(30, 10, 30, 10))),
                                              onPressed: () async {
                                                //TODO: API Call

                                                Navigator.pop(context);

                                                await showDialog<String>(
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

                                                Future.delayed(
                                                  const Duration(seconds: 0),
                                                      () => Navigator.pop(_key.currentContext!),
                                                );

                                                //Navigator.popAndPushNamed(context, "/login");
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)!.yes,
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
                                                      const BorderSide(
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
                                                AppLocalizations.of(context)!.no,
                                                style: const TextStyle(
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
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 70),
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
    );
  }
}
