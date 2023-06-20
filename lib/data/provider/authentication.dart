import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:record_route/core/common/services.dart';
import 'package:record_route/data/model/auth/auth.dart';
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
      // final Response response = await _dio.post('/auth',
      //     options: Options(headers: {"username": email, "password": password}));

      Session s = Session.fromJson({
        "token": 'treu',
      });
      await Auth.instance.setSession(s.toJson());

      // _dio.options = BaseOptions(
      //     baseUrl: enviroment['backendUrl'],
      //     headers: {'Authorization': 'Bearer ${response.data["token"]}'});

      return await getUser(1);
      return true;
    } catch (e) {
      if (e is DioError) {
        onError(e.response);
      }
      return false;
    }
  }

  Future<bool> getUser(id) async {
    try {
      // final Response response = await _dio.post('/auth/$id/reconnect');
      // User? user =
      // await Auth.instance.setUser((response.data) as Map<String, dynamic>);
      User user = User.fromMap({
        "name": "lucas alonso",
        "lastName": "Sanchez lopez",
        "company": "Saguapac SRl.",
        "companyId": 23,
        "phone": "78451265",
        "address": "Calle san marino",
        "email": "lucas@mail.com",
        "age": 32,
        "urlImage":
            "https://media.istockphoto.com/id/160409804/es/foto/retrato-de-un-hombre-adulto.jpg?s=612x612&w=0&k=20&c=vGcRimiOWEUdSVsZx2I49IAb8Yx906tfqCjlJYWiBZo="
      });
      return Auth.instance.setUser(user.toMap()) != null;
    } catch (e) {
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
      toastr.info('Error', 'Error no encontra');
      // return null;
    }
    toastr.error(response.data['message']);
    // return null;
  }
}
