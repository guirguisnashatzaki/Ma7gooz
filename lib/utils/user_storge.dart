import 'package:flutter/material.dart';

import '../models/user_entity.dart';
import 'local_storge.dart';


class UserSettings {
  // Storage key
  static const _storageKey = 'userEntity';

  // Singleton

  factory UserSettings() => _getInstance();

  static UserSettings get instance => _getInstance();

  static UserSettings? _instance;

  UserSettings._internal();

  static UserSettings _getInstance() {
    _instance ??= UserSettings._internal();
    return _instance!;
  }

  // Params

  User? _userEntity;

 /* Future<void> save(User userEntity) {
    this._userEntity = userEntity;
    BuildContext? context = navigatorKey.currentContext;
    if (context != null) {
      Provider.of<ActiveOrderProvider>(context, listen: false)
          .setOrder(userEntity.activeOrder);
    }
    return LocalStorage.instance.save(key: _storageKey, value: userEntity);
  }*/

  User? get() {
    return _userEntity;
  }

  bool isLoggedIn() {
    return _userEntity != null;
  }
/*
  Future<void> load() async {
    User? userEntity =
 //   await LocalStorage.instance.load<User>(key: _storageKey);
 //   _userEntity = userEntity;
  }

  Future<void> remove() async {
    _userEntity = null;
    return LocalStorage.instance.delete(key: _storageKey);
  }*/

}