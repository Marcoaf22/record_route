import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

import 'package:record_route/core/common/services.dart';
import 'package:record_route/core/utils/enviroments.dart';
import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/auth/setting.dart';
import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/util/message.dart';
import 'package:record_route/util/toastr.dart';
import '../model/auth/session.dart';

enum Status { uninitialized, authenticated, authenticating, anauthenticated }

class Authentication {
  final Dio _dio = Get.find<Dio>();
  ToastrService toastr = ToastrService();
  final Service service = Get.find<Service>();

  Future<bool> login({String email = '', String password = ''}) async {
    try {
      _dio.options.baseUrl = enviroment['backendUrl'];
      final Response response = await _dio.post('/api/app/login',
          data: {"username": email, "password": password});

      UserProfile user = UserProfile.fromJson(response.data['data']);
      Session session = Session(
          token: response.data['data']['accessToken'],
          createdAt: DateTime.now().toString(),
          tokenType: response.data['data']['token_type']);

      await Auth.instance.setSession(session);
      await Auth.instance.setUser(user.toJson());

      _dio.options =
          BaseOptions(baseUrl: enviroment['backendUrl'] + "/api/app", headers: {
        'Authorization':
            '${response.data['data']['token_type']} ${response.data['data']["accessToken"]}'
      });

      return true;
    } catch (e) {
      print(e);
      if (e is DioError) {
        print(e.response.toString());
        onError(e.response);
      }
      return false;
    }
  }

  Future<String?> refreshToken(id) async {
    try {
      print('❤ refreshToken');
      final Response response = await _dio.post('/auth/$id/reconnect');
      return response.data['token'];
    } catch (e) {
      print(e);
      return null;
    }
  }

  void onError(response) {
    print(response.data);
    // if (response.statusCode == 401) {
    //   toastr.info('Error', ToastMessage.sessionOut);
    //   Get.offAllNamed('login');
    // }
    if (response.statusCode == 403) {
      toastr.info('Error', ToastMessage.unauthorizedUser);
      // return null;
    }
    if (response.statusCode == 404) {
      toastr.info('Error', 'Error no encontrado');
      // return null;
    }
    // if (!response.data['data'].isUndefined) {
    // toastr.info('Error', response.data['data']);
    // }
    if (response.data != null) {
      toastr.error(response.data['message']);
    }
    // return null;
  }
}
