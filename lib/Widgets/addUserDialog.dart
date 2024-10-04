import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minamakram/Widgets/requestingOrderHallFirstWidget.dart';
import 'package:minamakram/constants/colors.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({Key? key}) : super(key: key);

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {

  File? selectedImage;
  bool activityBool = false;
  String activity = "";
  List<String> activities = ["خدمة ابتدائي", "خدمة اعدادي", "خدمة ثانوي"];

  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void didChangeDependencies() {
    setState(() {
      activity = AppLocalizations.of(context)!.service;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/1.3,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                color: Colors.white,
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
                    child:selectedImage == null?
                    Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(237, 237, 237, 1),
                          shape: BoxShape.circle
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.loadImage,
                        style: const TextStyle(
                          color: MyColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Tajawal',
                        ),
                      ),
                    )
                        : ClipOval(
                      child: Image.file(selectedImage!),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              addingUserTextFormField(text: "${AppLocalizations.of(context)!.name}*",controller: nameController,isNumber: false),
              const SizedBox(height: 20,),
              addingUserTextFormField(text: AppLocalizations.of(context)!.username,controller: userNameController,isNumber: false),
              const SizedBox(height: 20,),
              addingUserTextFormField(text: AppLocalizations.of(context)!.pass,controller: passController,isNumber: false),
              const SizedBox(height: 20,),
              Material(
                child: InkWell(
                  onTap: (){
                    setState(() {
                      activityBool = !activityBool;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: MyColors.primaryColor, width: 1),
                        color: Colors.white
                    ),
                    // alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              activity,
                              style: const TextStyle(
                                  color: MyColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Tajawal'),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_drop_down,color: MyColors.primaryColor,),
                      ],
                    ),
                  ),
                ),
              ),
              activityBool?const SizedBox(
                height: 30,
              ):const SizedBox.shrink(),
              activityBool
                  ?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Material(
                              child: Container(
                                          margin: const EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1)
                                            ]
                                          ),
                                          child: Column(
                                    children: List.generate(
                                        activities.length,
                                            (index) => InkWell(
                                          onTap: () {
                                            setState(() {
                                              //TODO:ORDER Filling
                                              activity = activities[index];
                                              activityBool = false;
                                            });
                                          },
                                          child: MyListItem(
                                            text: activities[index],
                                            ifFirst: index == 0 ? true : false,
                                            ifLast:
                                            index == activities.length - 1 ? true : false,
                                          ),
                                        )),
                ),
                                        ),
                            ),
                          ],
                        )

                  : const SizedBox(),
              const SizedBox(height: 30,),
              addingUserTextFormField(text: "${AppLocalizations.of(context)!.mobNum}*",controller: phoneController,isNumber: true),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        backgroundColor: MaterialStateProperty.all(MyColors.primaryColor),
                        side: MaterialStateProperty.all(const BorderSide(
                            color: MyColors.primaryColor, width: 1)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.fromLTRB(30, 10, 30, 10))),
                      onPressed: (){

                        //TODO:ADDING USER


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
                                          AppLocalizations.of(context)!.userAdded,
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


                      },
                      child: Text(AppLocalizations.of(context)!.addUser)
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        side: MaterialStateProperty.all(const BorderSide(
                            color: MyColors.primaryColor, width: 1)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.fromLTRB(30, 10, 30, 10))),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text(AppLocalizations.of(context)!.del,style: TextStyle(color: MyColors.primaryColor),)
                  )
                ],
              ),

              const SizedBox(height: 20,)

            ],
          ),
        ),
      ),
    );
  }
}

class addingUserTextFormField extends StatelessWidget {

  String text;
  TextEditingController controller;
  bool isNumber;

  addingUserTextFormField({
    required this.text,
    required this.controller,
    required this.isNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: MyColors.secondaryColor,
            width: 1
          )
        ),

        child: TextFormField(
          keyboardType: isNumber?TextInputType.phone:TextInputType.text,
          controller: controller,
          style: const TextStyle(
            fontFamily: 'Tajawal',
            color: MyColors.secondaryColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(right: 10,left: 10),
            border: InputBorder.none,
            hintText: text,
            hintStyle: const TextStyle(
              fontFamily: 'Tajawal',
              color: MyColors.secondaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
