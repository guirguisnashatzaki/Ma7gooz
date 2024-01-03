import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:minamakram/constants/Language.dart';
import 'package:minamakram/constants/colors.dart';
import 'package:minamakram/constants/strings.dart';
import 'package:minamakram/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isAr = true;
  bool valid = true;
  bool validName = true;
  bool validPass = true;
  bool languagesShown = false;
  bool obsecureText = true;

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
  void dispose() {
    userController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Text(
                  AppLocalizations.of(context)!.welcome,
                  style: const TextStyle(
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    decoration: TextDecoration.none,
                  ),
                ),
                Image.asset(
                  "assets/images/logo.png",
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Material(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.fromLTRB(19, 0, 19, 0),
                        child: Text(
                          AppLocalizations.of(context)!.username,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Tajawal',
                            color: Color.fromRGBO(0, 0, 0, 1),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(19, 0, 19, 0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: validName
                                  ? const Color.fromRGBO(217, 217, 217, 1)
                                  : Colors.red,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {}
                            return null;
                          },
                          controller: userController,
                          decoration:
                          const InputDecoration(border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Material(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Container(
                        width:MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.fromLTRB(19, 0, 19, 0),
                        child: Text(
                          AppLocalizations.of(context)!.pass,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Tajawal',
                            color: Color.fromRGBO(0, 0, 0, 1),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(19, 0, 19, 0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: validPass
                                  ? const Color.fromRGBO(217, 217, 217, 1)
                                  : Colors.red,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          //TODO: pass
                          
                          obscureText: obsecureText,
                          
                          textInputAction: TextInputAction.go,
                          onFieldSubmitted: (value) {
                            if (userController.text.isEmpty) {
                              setState(() {
                                validName = false;
                              });
                            } else {
                              setState(() {
                                validName = true;
                              });
                            }

                            if (passController.text.isEmpty) {
                              setState(() {
                                validPass = false;
                              });
                            } else {
                              setState(() {
                                validPass = true;
                              });
                            }

                            if (validName && validPass) {
                              //TODO:API Call

                              Navigator.pushNamed(context, home,arguments: false);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {}
                            return null;
                          },
                          controller: passController,
                          decoration:
                          InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      obsecureText = !obsecureText;
                                    });
                                  },
                                  icon: obsecureText ? const Icon(Icons.visibility_off):const Icon(Icons.visibility)
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //TODO:
                (validPass && validName)
                    ? Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                              AlertDialog(
                                content: Text(
                                    AppLocalizations.of(context)!.forgetPassMessage,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center),
                              ));
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(19, 0, 19, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.forgetPass,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter',
                          color: Color.fromRGBO(0, 0, 0, 1),
                          decoration: TextDecoration.none,
                        ),
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                )
                    : Container(
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context)!.invalidMessageLogin,
                    style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Tajawal"
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(MyColors.primaryColor),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    ),
                  ),
                  onPressed: () {
                    if (userController.text.isEmpty) {
                      setState(() {
                        validName = false;
                      });
                    } else {
                      setState(() {
                        validName = true;
                      });
                    }

                    if (passController.text.isEmpty) {
                      setState(() {
                        validPass = false;
                      });
                    } else {
                      setState(() {
                        validPass = true;
                      });
                    }

                    if (validName && validPass) {
                      //TODO:API Call

                      Navigator.pushNamed(context, home,arguments: false);
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context)!.enter,
                    style: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Tajawal',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      languagesShown = !languagesShown;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.primaryColor,
                    ),
                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/1.65, 10, 20, 0),
                    padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                    alignment: Alignment.centerRight,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: IconButton(
                              onPressed: () {
                                // setState(() {
                                //   languagesShown = !languagesShown;
                                // });
                              },
                              icon: Icon(
                                languagesShown
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.chooseLan,
                            style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                                fontFamily: 'Tajawal'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                languagesShown
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
                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/1.5, 10, 30, 0),
                      padding: const EdgeInsets.all(5),
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
                languagesShown
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
                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/1.5, 10, 30, 0),
                      padding: const EdgeInsets.all(5),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}