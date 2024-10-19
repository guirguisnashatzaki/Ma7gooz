
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minamakram/constants/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Widgets/requestingOrderHallFirstWidget.dart';

class UserProfile extends StatefulWidget {
  String user;
  UserProfile({Key? key,required this.user}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  bool isMenuShown = false;
  bool nameBool = true;
  bool usernameBool = true;
  bool passBool = true;
  bool mobBool = true;
  bool serBool = true;
  bool mobMessage = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController mobController = TextEditingController();
  TextEditingController serController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isEdit = false;
  bool isServiceMenuShown = false;

  List services = [
    "خدمة ثانوي",
    "خدمة اعدادي",
    "خدمة ابتدائي",
    "خدمة شباب",
  ];

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    passController.dispose();
    mobController.dispose();
    serController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.05),
                                blurRadius: 7,
                                offset: Offset(0,0)
                            ),
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: Colors.white,
                            child: IconButton(
                                onPressed: (){
                                  if(isEdit){
                                    setState(() {
                                      isEdit = false;
                                      nameBool = true;
                                      usernameBool = true;
                                      passBool = true;
                                      mobBool = true;
                                      serBool = true;
                                      mobMessage = false;
                                      nameController.clear();
                                      usernameController.clear();
                                      passController.clear();
                                      mobController.clear();
                                      serController.clear();
                                    });
                                  }else{
                                    Navigator.of(context).pop();
                                  }
                                },
                                icon: const Icon(Icons.arrow_back_sharp,color: MyColors.secondaryColor,)
                            ),
                          ),

                          const Material(
                            color: Colors.white,
                            child: Text("بيانات المستخدم",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Tajawal',
                                  color: MyColors.secondaryColor
                              ),
                            ),
                          ),

                          Material(
                            color: Colors.white,
                            child: IconButton(
                                onPressed: (){
                                  if(!isEdit){
                                    setState(() {
                                      isMenuShown = !isMenuShown;
                                    });
                                  }
                                },
                                icon: Icon(Icons.more_vert,color: isEdit? Colors.white:MyColors.secondaryColor,)
                            ),
                          )
                        ],
                      ),
                    ),
                    isMenuShown?Positioned(
                      bottom: 0,
                      left: 20,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: MyColors.primaryColor,
                                width: 1
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [
                            Material(
                              color: Colors.white,
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    isEdit = true;
                                    isMenuShown = false;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                  ),
                                  child: Text(AppLocalizations.of(context)!.edit,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: MyColors.primaryColor,
                                        fontFamily: 'Tajawal',
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.none
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              color: MyColors.primaryColor,
                              width: 105,
                              height: 1,
                            ),
                            Material(
                              color: Colors.white,
                              borderRadius:  const BorderRadius.vertical(bottom: Radius.circular(10)),
                              child: InkWell(
                                onTap: ()async{
                                  //TODO:DELETE ACCOUNT

                                  await showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) => AlertDialog(
                                        content: Container(
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
                                              Text(
                                                AppLocalizations.of(context)!.delUserQuestion,
                                                style: const TextStyle(
                                                    color:
                                                    MyColors.secondaryColor,
                                                    fontFamily: 'Tajawal',
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w700),
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(
                                                height: 50,
                                              ),
                                              FittedBox(
                                                fit: BoxFit.fill,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    FittedBox(
                                                      fit: BoxFit.fill,
                                                      child: ElevatedButton(
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
                                                                      alignment: Alignment.center,
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
                                                                            height: 20,
                                                                          ),
                                                                          Text(
                                                                            AppLocalizations.of(context)!.delUserMessage,
                                                                            style: const TextStyle(
                                                                                color: MyColors.primaryColor,
                                                                                fontFamily:
                                                                                'Tajawal',
                                                                                fontSize:
                                                                                24,
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .w500),
                                                                            textAlign: TextAlign.center,
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
                                                              () => Navigator.pop(_scaffoldKey.currentContext!),
                                                          );
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
                                                    ),
                                                    const SizedBox(
                                                      width: 50,
                                                    ),
                                                    FittedBox(
                                                      fit: BoxFit.fill,
                                                      child: ElevatedButton(
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
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ));

                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                                  ),
                                  child: Text(AppLocalizations.of(context)!.deleteAccount,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: MyColors.primaryColor,
                                        fontFamily: 'Tajawal',
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.none
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ):const SizedBox.shrink()
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: MyColors.primaryColor, width: 1),
                    shape: BoxShape.circle),
                width: 140,
                height: 140,
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/person_image.jpg"),
                ),
              ),
              const SizedBox(height: 48,),
              UserProfileField(validBool: nameBool, controller: nameController,text: AppLocalizations.of(context)!.name,isMob: false,isSer: false,isEdit: isEdit),
              UserProfileField(validBool: usernameBool, controller: usernameController,text: AppLocalizations.of(context)!.username2,isMob: false,isSer: false,isEdit: isEdit),
              UserProfileField(validBool: passBool, controller: passController,text: AppLocalizations.of(context)!.pass2,isMob: false,isSer: false,isEdit: isEdit),
              Material(
                color: Colors.white,
                child: InkWell(
                    onTap: (){
                      if(isEdit){
                        setState(() {
                          isServiceMenuShown = !isServiceMenuShown;
                        });
                      }
                    },
                    child: UserProfileField(validBool: serBool, controller: serController,text: AppLocalizations.of(context)!.service,isMob: false,isSer: true,isEdit: isEdit)
                ),
              ),
              isServiceMenuShown?Material(
                color: Colors.white,
                child: Container(
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
                              serController.text = services[index];
                              isServiceMenuShown = false;
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
                ),
              ):const SizedBox.shrink(),
              UserProfileField(validBool: mobBool, controller: mobController,text: AppLocalizations.of(context)!.mobNum,isMob: true,isSer: false,isEdit: isEdit),
              mobMessage?Row(
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
              const SizedBox(height: 30,),
              isEdit?ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(35, 15, 35, 15)),
                      backgroundColor: MaterialStateProperty.all(MyColors.primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      )
                  ),
                  onPressed: ()async{


                    String name = nameController.text.toString();
                    String username = usernameController.text.toString();
                    String pass = passController.text.toString();
                    String ser = serController.text.toString();
                    String mob = mobController.text.toString();



                    if(name.isEmpty){
                      nameBool = false;
                    }else{
                      nameBool = true;
                    }

                    if(username.isEmpty){
                      usernameBool = false;
                    }else{
                      usernameBool = true;
                    }

                    if(pass.isEmpty){
                      passBool = false;
                    }else{
                      passBool = true;
                    }

                    if(ser.isEmpty){
                      serBool = false;
                    }else{
                      serBool = true;
                    }

                    if(mob.isEmpty){
                      mobBool = false;
                    }else{
                      if(mob.length != 11){
                        mobBool = false;
                        mobMessage = true;
                      }else{
                        mobMessage = false;
                        mobBool = true;
                      }
                    }

                    setState(() {});

                    if(nameBool && usernameBool && passBool && serBool && mobBool){
                      //TODO: API


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
                                                () => Navigator.pop(_scaffoldKey.currentContext!),
                                          );
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
                  child: Text(AppLocalizations.of(context)!.save,
                    style:const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Tajawal',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),)
              ):const SizedBox.shrink(),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}

class UserProfileField extends StatelessWidget {
  const UserProfileField({
    super.key,
    required this.validBool,
    required this.controller,
    required this.text,
    required this.isMob,
    required this.isSer,
    required this.isEdit
  });

  final bool validBool;
  final String text;
  final TextEditingController controller;
  final bool isMob;
  final bool isSer;
  final bool isEdit;

  final Color editColor = const Color.fromRGBO(182, 184, 186, 1);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: TextFormField(
          keyboardType: isMob?TextInputType.number:TextInputType.text,
          enabled: isEdit && !isSer,
          controller: controller,
          style: const TextStyle(
              color: MyColors.textColor,
              fontFamily: 'Tajawal',
              fontSize: 16,
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 0,
              bottom: 0
            ),
            suffixIcon: validBool?
            (isSer ?
            Icon((Icons.arrow_drop_down),color: isEdit? editColor:MyColors.secondaryColor,)
                :
              const SizedBox.shrink()
            )
                :
            Icon(isSer ? (Icons.arrow_drop_down) :CupertinoIcons.exclamationmark_circle,color: Colors.red,),
            hintText: text,
            hintStyle: TextStyle(
                color: validBool?
                  (isEdit? editColor:MyColors.primaryColor)
                    :
                  Colors.red,
                fontFamily: 'Tajawal',
                fontSize: 16,
                fontWeight: FontWeight.w400),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: validBool? (isEdit? editColor:MyColors.secondaryColor):Colors.red,
                width: 1.0,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: validBool? (isEdit? editColor:MyColors.secondaryColor):Colors.red,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: validBool? (isEdit? editColor:MyColors.secondaryColor):Colors.red,
                width: 1.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
