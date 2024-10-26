import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';
/*
class LocalStorage {
  factory LocalStorage() => _getInstance();

  static LocalStorage get instance => _getInstance();
  static LocalStorage? _instance;

  LocalStorage._internal();

  static LocalStorage _getInstance() {
    _instance ??= LocalStorage._internal();
    return _instance!;
  }

  Future initSecureStorage() async {
    _secureStorage = new FlutterSecureStorage();
    await _removeOldSharedPrefs(); // To be removed with the library after any force update release
    await _loadCacheToMemory();
  }

  Future<void> _removeOldSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> _loadCacheToMemory() async {
    await LocalizationSettings.instance.load();
    await UserSettings.instance.load();
    await ConfigsSettings.instance.load();
    await LocationSettings.instance.load();
    await StoreSettings.instance.loadStoreState();
  }

  Future<T?> load<T>({required String key}) async {
    try {
      String? result = await _secureStorage.read(key: key);
      if (result != null) {
        Map<String, dynamic>? jsonResult = json.decode(result);

        return JsonConvert.fromJsonAsT<T>(jsonResult ?? Map());
      }
    } catch (error) {
      return null;
    }

    return null;
  }

  Future<String?> loadString({required String key}) async {
    try {
      String? result = await _secureStorage.read(key: key);
      if (result == null) return null;
      return json.decode(result).toString();
    } catch (error) {
      return null;
    }
  }

  Future<String> loadStringSafety({required String key}) async {
    try {
      String? result = await _secureStorage.read(key: key);
      if (result != null && result.isNotEmpty) {
        return json.decode(result).toString();
      } else {
        return '';
      }
    } catch (error) {
      return '';
    }
  }

  Future<void> save({required String key, required Object? value}) async {
    try {
      return await _secureStorage.write(
        key: key,
        value: jsonEncode(value),
      );
    } catch (error) {
      return;
    }
  }

  Future<void> delete({required String key}) async {
    try {
      await _secureStorage.delete(key: key);
    } catch (error) {
      return;
    }
  }
}*/