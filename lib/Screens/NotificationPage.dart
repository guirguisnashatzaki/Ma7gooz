import 'package:flutter/material.dart';
import 'package:minamakram/constants/strings.dart';
import 'package:minamakram/models/notification.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../constants/colors.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late List myNotifications;
  bool isAr = true;

  @override
  void didChangeDependencies() {
    notification = Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: 0.1,
              image: AssetImage(
                "assets/images/knissa.png",
              ),
              fit: BoxFit.contain
          )
      ),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: List.generate(myNotifications.length,
                    (index) => NotificationItem(item: myNotifications[index])),
          ),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                backgroundColor: MaterialStateProperty.all(MyColors.primaryColor),
                side: MaterialStateProperty.all(const BorderSide(
                    color: MyColors.secondaryColor, width: 1)),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.fromLTRB(30, 10, 30, 10))),
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text(
              AppLocalizations.of(context)!.ordersPage,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Tajawal',
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
    super.didChangeDependencies();
  }

  Widget noNotification = Center(
    child: Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Image.asset("assets/images/no_notifications.png",width: 400,height: 400,)
      ],
    ),
  );
  late Widget notification;

  @override
  void initState() {
    myNotifications = [
      MyNotification(
          accepted: false,
          date: "1/1/2023",
          numberOfOrder: "123",
          rejectionReason: "dafsd")
    ];

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: MyColors.secondaryColor,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          AppLocalizations.of(context)!.notifications,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            fontFamily: 'Tajawal',
            color: MyColors.secondaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: myNotifications.isEmpty ? noNotification:notification,
    );
  }
}

class NotificationItem extends StatelessWidget {
  MyNotification item;
  NotificationItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: MyColors.simpleBlue,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.check_circle_outline),
              const SizedBox(
                width: 15,
              ),
              Text(
                item.accepted ? "طلب مقبول" : "طلب مرفوض",
                style: const TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: MyColors.primaryColor),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              item.accepted
                  ? "تم قبول طلب الحجز رقم   ${item.numberOfOrder}"
                  : "تم رفض طلب الحجز رقم   ${item.numberOfOrder}",
              style: const TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: MyColors.primaryColor),
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          item.accepted
              ? const SizedBox()
              : Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    item.rejectionReason,
                    style: const TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: MyColors.primaryColor),
                    textAlign: TextAlign.end,
                  ),
                ),
          const SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              item.date,
              style: const TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: MyColors.primaryColor),
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    );
  }
}
