import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:record_route/core/common/services.dart';
import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/util/message.dart';
import 'package:record_route/util/toastr.dart';

enum Status { uninitialized, authenticated, authenticating, anauthenticated }

class RequestService {
  final Dio _dio = Get.find<Dio>();
  ToastrService toastr = ToastrService();

  final Service service = Get.find<Service>();

  Future<bool> post({required String url, Object? body}) async {
    try {
      print(_dio.options.headers);
      final Response response = await _dio.post(url, data: body);

      return true;
    } catch (e) {
      if (e is DioError) {
        onError(e.response);
      }
      return false;
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
