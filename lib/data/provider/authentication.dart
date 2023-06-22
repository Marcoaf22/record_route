import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:record_route/core/common/services.dart';
import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/data/model/user.dart';
import 'package:record_route/util/message.dart';
import 'package:record_route/util/toastr.dart';

enum Status { uninitialized, authenticated, authenticating, anauthenticated }

class Authentication {
  final Dio _dio = Get.find<Dio>();
  ToastrService toastr = ToastrService();

  final Service service = Get.find<Service>();

  Future<bool> login({String email = '', String password = ''}) async {
    // return true;

    try {
      final Response response = await _dio.post('/api/app/login',
          data: {"username": email, "password": password});

      UserProfile user = UserProfile.fromJson(response.data['data']);

      Session s = Session(
          token: response.data['data']['token'],
          tokenType: response.data['data']['tokenType']);

      await Auth.instance.setSession(s.toJson());

      await Auth.instance.setUser(user.toJson());

      // _dio.options = BaseOptions(
      //     // baseUrl: enviroment['backendUrl'],
      //     headers: {'Authorization': 'Bearer ${response.data["token"]}'});

      return true;
    } catch (e) {
      if (e is DioError) {
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
