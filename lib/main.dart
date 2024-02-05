import 'package:flutter/material.dart';
import 'package:minamakram/Screens/NotificationPage.dart';
import 'package:minamakram/Screens/buildingDetailsPage.dart';
import 'package:minamakram/Screens/buildingPage.dart';
import 'package:minamakram/Screens/editProfilePage.dart';
import 'package:minamakram/Screens/profilePage.dart';
import 'package:minamakram/Screens/requestingOrdersPage.dart';
import 'package:minamakram/constants/Language.dart';
import 'Screens/LoginPage.dart';
import 'Screens/mainHomePage.dart';
import 'Screens/ordersPage.dart';
import 'constants/strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'models/building/buildingObject.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key,required this.appRouter});

  final AppRouter appRouter;

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }


  @override
  void didChangeDependencies() {
    getLocale().then((locale){
      setLocale(locale);
    });
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: widget.appRouter.generateRoute,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
    );
  }
}

class AppRouter {

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
            builder: (_) => const LoginPage());
      case home:
        final argument = settings.arguments as bool;
        return MaterialPageRoute(
            builder: (_) => mainHomePage(isRequesting: argument,));
      case notification:
        return MaterialPageRoute(
            builder: (_) => const NotificationPage());
      case buildings:
        return MaterialPageRoute(
            builder: (_) => const BuildingPage());
      case buildingDetails:
        var args = settings.arguments as Building;
        return MaterialPageRoute(
            builder: (_) => BuildingDetailsPage(item: args,));
      case profile:
        return MaterialPageRoute(
            builder: (_) => const profilePage());
      case editProfile:
        return MaterialPageRoute(
            builder: (_) => const EditProfilePage());
      case ordersPage:
        return MaterialPageRoute(
            builder: (_) => const OrderPage());
      case requestingOrderPage:
        return MaterialPageRoute(
            builder: (_) => const RequestingOrdersPage());
    }
    return null;
  }
}