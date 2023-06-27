import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:record_route/data/model/auth/session.dart';
import 'package:record_route/data/model/auth/setting.dart';
import 'package:record_route/data/provider/authentication.dart';
import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/data/service/get_location.dart';

class Auth {
  Auth._internal();

  static final Auth _instance = Auth._internal();
  static Auth get instance => _instance;
  final _storage = GetStorage();

  final key = "SESSION";
  final db = "inventory.db";

  final keyInfo = "INFO";
  final keySeeting = "SEETING";

  Future<void> setSeeting(Seeting seeting) async {
    final code = jsonEncode(seeting.toJson());
    await _storage.write(keySeeting, code);
    await _storage.save();
  }

  Seeting getSeeting() {
    final String? value = _storage.read(keySeeting);
    if (value != null) {
      Seeting setting = Seeting.fromJson(jsonDecode(value));
      return setting;
    }
    return Seeting.fromJson({});
  }

  Future<Session> setSession(Session session) async {
    final String value = jsonEncode(session.toJson());

    await _storage.write(key, value);
    await _storage.save();
    return session;
  }

  Session? getSession() {
    final String? value = _storage.read(key);
    if (value != null) {
      final Map<String, dynamic> json = jsonDecode(value);
      final session = Session.fromJson(json);
      return session;
    }
    return null;
  }

  Future<UserProfile?> setUser(Map<String, dynamic> data) async {
    final UserProfile user = UserProfile.fromJson(data);
    final String info = jsonEncode(user.toJson());
    await _storage.write(keyInfo, info);
    await _storage.save();
    return user;
  }

  UserProfile getUser() {
    final value = _storage.read(keyInfo);
    if (value != null) {
      final json = jsonDecode(value);
      final user = UserProfile.fromJson(json);
      return user;
    }
    return UserProfile.fromJson({});
  }

  Future<String?> getToken() async {
    final String? read = _storage.read(key);
    if (read != null) {
      Session session = Session.fromJson(jsonDecode(read));
      DateTime currentDate = DateTime.now();
      DateTime createdAt =
          DateTime.parse(session.createdAt ?? DateTime.now().toIso8601String());
      int expiresIn = session.expiresIn;
      int diff = currentDate.difference(createdAt).inSeconds;
      if (expiresIn - diff >= 3600) {
        return session.token;
      } else {
        final auth = Authentication();
        String? token = await auth.refreshToken(1);
        if (token != null) return token;
      }
    }
    return null;
  }

  Future<bool> logOut() async {
    GetLocation service = Get.find<GetLocation>();
    service.locationCancel();
    service.serviceStatusCancel();

    await _storage.remove(key);
    // await _storage.remove(keyInfo);
    return true;
  }
}
