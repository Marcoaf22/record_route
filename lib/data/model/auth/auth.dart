import 'dart:async';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:record_route/data/model/auth/setting.dart';

import 'package:record_route/data/model/user.dart';
import 'package:record_route/data/provider/authentication.dart';

class Session {
  Session({required this.token, this.expiresIn, this.createdAt});

  final String token;
  String? createdAt;
  int? expiresIn;

  Session copyWith({
    int? branchDefault,
    String? token,
    bool? requestBranch,
  }) {
    return Session(token: token ?? this.token);
  }

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      token: json["token"] ?? "",
      expiresIn: 86400,
      createdAt: DateTime.now().toIso8601String(),
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
        "expiresIn": expiresIn,
        "createdAt": createdAt,
      };
}

class Auth {
  Auth._internal();

  static final Auth _instance = Auth._internal();

  static Auth get instance => _instance;

  final _storage = GetStorage();

  final key = "SESSION";
  final keyInfo = "INFO";
  final keySeeting = "SEETING";

  Future<Session> setSession(Map<String, dynamic> data) async {
    final Session session = Session.fromJson(data);
    final a = session.toJson();
    final String value = jsonEncode(a);

    final seeting = Seeting(darkMode: false);
    _storage.write(key, value);
    _storage.write(keySeeting, jsonEncode(seeting.toJson()));
    _storage.save();
    return session;
  }

  Future<User?> setUser(Map<String, dynamic> data) async {
    print('🎄 Set user');
    final User user = User.fromMap(data);
    final String info = jsonEncode(user.toMap());
    _storage.write(keyInfo, info);
    _storage.save();
    return user;
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

  Seeting getSeeting() {
    final String value = _storage.read(keySeeting);
    Seeting setting = Seeting.fromJson(jsonDecode(value));
    return setting;
  }

  Future<void> setSeeting(Seeting seeting) async {
    final code = jsonEncode(seeting.toJson());
    print(code);
    await _storage.write(keySeeting, code);
  }

  User getUser() {
    print('🎃 getUser');
    final value = _storage.read(keyInfo);
    final json = jsonDecode(value);
    final user = User.fromMap(json);
    return user;
  }

  Future<String?> getToken() async {
    final String? read = _storage.read(key);
    if (read != null) {
      final Map<String, dynamic> json = jsonDecode(read);
      DateTime currentDate = DateTime.now();
      DateTime createdAt = DateTime.parse(json['createdAt']);
      int expiresIn = json['expiresIn'];
      int diff = currentDate.difference(createdAt).inSeconds;
      print('Diff: $diff');
      if (expiresIn - diff >= 3600) {
        return json['token'];
      } else {
        final auth = Authentication();
        String? token = await auth.refreshToken(1);
        if (token != null) return token;
      }
    }
    return null;
  }

  Future<bool> logOut() async {
    await _storage.remove(key);
    await _storage.remove(keyInfo);
    return true;
  }
}
