import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_route/core/theme/app_theme.dart';
import 'package:record_route/core/utils/enviroments.dart';
import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/util/message.dart';
import 'package:record_route/util/toastr.dart';

class Service extends GetConnect {
  final ColorScheme color = appThemeDataLight.colorScheme;
  final toastr = ToastrService();

  @override
  void onInit() {
    baseUrl = enviroment['backendUrl'];
    timeout = const Duration(seconds: 10);
    super.onInit();
  }

  Future<Map<String, dynamic>?> getRequest(String route) async {
    return await Get.showOverlay(
      asyncFunction: () async {
        final response = await get(route);
        if (response.isOk) {
          return response.body;
        }

        if (response.statusCode == 401) {
          toastr.info('Error', ToastMessage.sessionOut);
          Get.offAllNamed('login');
          return null;
        }
        if (response.statusCode == 403) {
          toastr.info('Error', ToastMessage.unauthorizedUser);
          return null;
        }

        toastr.error(response.body['message']);
        return null;
      },
      loadingWidget:
          Center(child: CircularProgressIndicator(color: color.primary)),
    );
  }

  Future<dynamic> postRequest(
      {required String route, required Map<String, dynamic> body}) async {
    final headers = await getHeaders();
    return await Get.showOverlay(
      asyncFunction: () async {
        await Future.delayed(const Duration(seconds: 2));

        final response = await post(route, body, headers: headers);
        if (response.isOk) {
          return response.body;
        }

        if (response.statusCode == 401) {
          toastr.info('Error', ToastMessage.sessionOut);
          Get.offAllNamed('login');
          return null;
        }
        if (response.statusCode == 403) {
          toastr.info('Error', ToastMessage.unauthorizedUser);
          return null;
        }
        if (response.statusCode == 404) {
          toastr.info('Error', 'Error no encontra');
          return null;
        }
        toastr.error(response.body['message']);
        return null;
      },
      loadingWidget:
          Center(child: CircularProgressIndicator(color: color.primary)),
    );
  }

  Future<dynamic> postSimpleRequest(
      {required String route, required Map<String, dynamic> body}) async {
    final headers = await getHeaders();

    final response = await post(route, body, headers: headers);
    if (response.isOk) {
      return response.body;
    }

    if (response.statusCode == 401) {
      toastr.info('Error', ToastMessage.sessionOut);
      Get.offAllNamed('login');
      return null;
    }
    if (response.statusCode == 403) {
      toastr.info('Error', ToastMessage.unauthorizedUser);
      return null;
    }
    if (response.statusCode == 404) {
      toastr.info('Error', 'Error no encontra');
      return null;
    }
    toastr.error(response.body['message']);
    return null;
  }

  Future<Map<String, dynamic>?> postLogin(
      String route, Map<String, String> headers) async {
    return await Get.showOverlay(
      asyncFunction: () async {
        // await Future.delayed(const Duration(seconds: 4));
        final response = await post(route, {}, headers: headers);
        if (response.isOk) {
          return response.body;
        }

        if (response.statusCode == 401) {
          toastr.info('Error', ToastMessage.sessionOut);
          Get.offAllNamed('login');
          return null;
        }
        if (response.statusCode == 403) {
          toastr.info('Error', ToastMessage.unauthorizedUser);
          return null;
        }
        if (response.statusCode == 404) {
          toastr.info('Error', 'Error no encontra');
          return null;
        }
        if (response.body is Map) {
          toastr.error(response.body['message']);
        }
        return null;
      },
      loadingWidget:
          Center(child: CircularProgressIndicator(color: color.primary)),
    );
  }

  Future<Map<String, dynamic>?> postReconnect(
      String route, Map<String, String> headers) async {
    return await Get.showOverlay(
      asyncFunction: () async {
        // await Future.delayed(const Duration(seconds: 2));
        final response = await post(route, {}, headers: headers);
        if (response.isOk) {
          return response.body;
        }

        if (response.statusCode == 401) {
          toastr.info('Error', ToastMessage.sessionOut);
          Get.offAllNamed('login');
          return null;
        }
        if (response.statusCode == 403) {
          toastr.info('Error', ToastMessage.unauthorizedUser);
          return null;
        }
        if (response.statusCode == 404) {
          toastr.info('Error', 'Error no encontra');
          return null;
        }
        return null;
      },
      loadingWidget:
          Center(child: CircularProgressIndicator(color: color.primary)),
    );
  }

  Future<Map<String, String>> getHeaders() async {
    String? token = await Auth.instance.getToken();
    return {'Authorization': 'Bearer $token'};
  }
}
