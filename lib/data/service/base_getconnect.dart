import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';
import 'package:record_route/data/model/auth/auth.dart';

class BaseService extends GetConnect {
  @override
  void onInit() {
    //   print('🎈 BaseService - OnInit');
    //   final a = GetConnect().httpClient;

    //   a.addRequestModifier((Request request) {
    //     String? a = GetStorage().read(Auth.instance.key);
    //     if (a != null) {
    //       request.headers['Authorization'] = a;
    //     }
    //     return request;
    //   });
    //   a.baseUrl = 'http://181.188.152.180:8888/api/';
  }
}
