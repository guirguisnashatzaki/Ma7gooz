import 'package:shared_preferences/shared_preferences.dart';

class sharedPrefsHelper{
  final String isAdminKey = "ADMIN_KEY";
  SharedPreferences? _prefs;
  bool isAdmin = true;

  Future<SharedPreferences?> getPrefs() async {
    if(_prefs == null){
      _prefs = await SharedPreferences.getInstance();
      return _prefs;
    }else{
      return _prefs;
    }
  }

  void setIsAdmin(bool isAdmin){
    this.isAdmin = isAdmin;
    _prefs?.setBool(isAdminKey, isAdmin);
  }

  Future<bool?> getIsAdmin()async{
    return _prefs?.getBool(isAdminKey);
  }

}