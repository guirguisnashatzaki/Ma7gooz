import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:minamakram/constants/colors.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  List users = ["","","","","",""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Container(

              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.05),
                    offset: Offset(0,1)
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back,color: MyColors.secondaryColor,)
                  ),

                  Text(
                    AppLocalizations.of(context)!.users,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        fontFamily: 'Tajawal',
                        color: MyColors.secondaryColor
                    ),
                  ),

                  IconButton(
                      onPressed: (){

                      },
                      icon: const Icon(Icons.add_circle_outline,color: MyColors.secondaryColor,)
                  ),
                ],
              ),
            ),


            const SizedBox(height: 20,),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromRGBO(215, 203, 203, 1),
                    width: 1,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      blurRadius: 8
                    )
                  ]
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "بحث",
                    hintStyle: const TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(182, 184, 186, 1)
                    ),
                    suffixIcon: IconButton(
                      onPressed: (){

                      },
                      icon: const Icon(Icons.search,color: Color.fromRGBO(182, 184, 186, 1),),
                    )
                  ),
                )
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height/1.3,
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: List.generate(users.length, (index){
                  return InkWell(
                    onTap: (){

                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            blurRadius: 8
                          )
                        ]
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.centerRight,
                            child: const Column(
                              children: [
                                CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Color(0xFF778899),
                                  // backgroundImage:
                                  //     NetworkImage("Your Photo Url"), // for Network image
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20,),
                          Column(
                            children: [
                              Text(
                                "test",
                                style: TextStyle(
                                  color: MyColors.primaryColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: 'Tajawal'
                                ),
                              ),
                              SizedBox(height: 15,),
                              Text(
                                "test",
                                style: TextStyle(
                                    color: MyColors.primaryColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    fontFamily: 'Tajawal'
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            )


          ],
        )
      ),


    );
  }
}
