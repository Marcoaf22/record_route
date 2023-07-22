import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:record_route/data/model/auth/session.dart';
import 'package:record_route/data/model/auth/setting.dart';
import 'package:record_route/data/provider/authentication.dart';
import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/data/service/get_location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  Auth._internal();

  static final Auth _instance = Auth._internal();
  static Auth get instance => _instance;
  // SharedPreferences _storage = SharedPreferences;

  final key = "SESSION";
  final db = "inventory.db";

  final keyInfo = "INFO";
  final keySeeting = "SEETING";

  Future<void> setSeeting(Seeting seeting) async {
    final code = jsonEncode(seeting.toJson());

    final _storage = await SharedPreferences.getInstance();
    await _storage.setString(keySeeting, code);
  }

  Future<void> step(int step) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('step_index', step);
  }

  Future<int> getStep() async {
    final prefs = await SharedPreferences.getInstance();
    int? step = prefs.getInt('step_index');
    return step != null ? step : 0;
  }

  Future<Seeting> getSeeting() async {
    final _storage = await SharedPreferences.getInstance();

    final String? value = _storage.getString(keySeeting);
    if (value != null) {
      Seeting setting = Seeting.fromJson(jsonDecode(value));
      return setting;
    }
    return Seeting.fromJson({});
  }

  Future<Session> setSession(Session session) async {
    final _storage = await SharedPreferences.getInstance();
    final String value = jsonEncode(session.toJson());
    await _storage.setString(key, value);
    return session;
  }

  Future<Session?> getSession() async {
    final _storage = await SharedPreferences.getInstance();

    final String? value = _storage.getString(key);
    if (value != null) {
      final Map<String, dynamic> json = jsonDecode(value);
      final session = Session.fromJson(json);
      return session;
    }
    return null;
  }

  Future<UserProfile?> setUser(Map<String, dynamic> data) async {
    print('json user to saved');
    print(data);
    final _storage = await SharedPreferences.getInstance();

    final UserProfile user = UserProfile.fromJson(data);
    final String info = jsonEncode(user.toJson());
    await _storage.setString(keyInfo, info);
    return user;
  }

  Future<UserProfile> getUser() async {
    final _storage = await SharedPreferences.getInstance();

    final value = _storage.getString(keyInfo);
    if (value != null) {
      final json = jsonDecode(value);
      final user = UserProfile.fromJson(json);
      return user;
    }
    return UserProfile.fromJson({});
  }

  Future<String?> getToken() async {
    final _storage = await SharedPreferences.getInstance();

    final String? read = _storage.getString(key);
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
    final _storage = await SharedPreferences.getInstance();

    service.routeCancelRecord();
    service.serviceStatusCancel();

    await _storage.remove(key);
    return true;
  }
}
