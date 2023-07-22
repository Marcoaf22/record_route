import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/auth/setting.dart';
import 'package:record_route/data/model/database/setting.dart';
import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/data/service/get_location.dart';
import 'package:record_route/pages/home/home_controller.dart';
import 'package:record_route/pages/widgets/button_background.dart';
import 'package:record_route/routes/app_pages.dart';
import 'package:record_route/util/percent_width_height.dart';
import 'package:record_route/util/toastr.dart';
import 'package:record_route/util/utils.dart';

import '../../../util/dialogs.dart';

class HomeWidget extends StatelessWidget {
  final toastr = ToastrService();
  HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GetBuilder<HomeController>(
      // id: 'homeWidget',
      builder: (_) {
        return Center(
          child: Column(
            children: [
              Obx(() {
                GetLocation service = Get.find<GetLocation>();
                if (service.requestService.value) {
                  return Container(
                    width: 100.0.wp,
                    decoration: const BoxDecoration(color: Colors.yellowAccent),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          ' La ubicacion no esta habilitada',
                          style: TextStyle(fontSize: 1.35.dp),
                        ),
                        TextButton(
                          onPressed: () async {
                            // bool result =
                            //     await Geolocator.isLocationServiceEnabled();
                            // if (!result) {
                            //   await Geolocator.openLocationSettings();
                            // }
                          },
                          child: Text(
                            'Activar GPS',
                            style: TextStyle(fontSize: 1.35.dp),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.5.hp, left: 30),
                    child: Text(
                      'CONES',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colors.onPrimary,
                          letterSpacing: 2,
                          fontSize: 2.9.dp),
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(35.0.wp / 2),
                child: GetBuilder<HomeController>(
                  builder: (_) {
                    String? path = _.userProfile.user?.avatar;
                    if (path == null || path.isEmpty) {
                      return Container(
                        height: 35.0.wp,
                        width: 35.0.wp,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(1),
                              BlendMode.dstATop,
                            ),
                            image: const AssetImage(
                                "assets/users/user_default.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }
                    return Image.network(
                      path,
                      width: 35.0.wp,
                      height: 35.0.wp,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 35.0.wp,
                        width: 35.0.wp,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 10.0,
                              spreadRadius: 10.0,
                            )
                          ],
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.6),
                                BlendMode.dstATop),
                            image: const AssetImage(
                                'assets/users/user_default.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 2.0.hp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nombre',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Kanit',
                              fontStyle: FontStyle.normal),
                        ),
                        Text(
                          "${_.userProfile.user?.name} ${_.userProfile.driver?.lastName}" ??
                              '',
                          style: const TextStyle(
                              fontSize: 15, fontFamily: 'Kanit'),
                        ),
                        const Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Kanit',
                              fontStyle: FontStyle.normal),
                        ),
                        Text(
                          _.userProfile.user?.email ?? '',
                          style: const TextStyle(
                              fontSize: 15, fontFamily: 'Kanit'),
                        ),
                        const Text(
                          'Telefono',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Kanit',
                              fontStyle: FontStyle.normal),
                        ),
                        Text(
                          _.userProfile.user?.phone ?? '',
                          style: const TextStyle(
                              fontSize: 15, fontFamily: 'Kanit'),
                        ),
                        const Text(
                          'Cedula de Identidad',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Kanit',
                              fontStyle: FontStyle.normal),
                        ),
                        Text(
                          "${_.userProfile.driver?.identityCard} ${_.userProfile.driver?.identityCardExt}",
                          style: const TextStyle(
                              fontSize: 15, fontFamily: 'Kanit'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 5.0.hp),
              _.userProfile.routes.isEmpty
                  ? Container()
                  : Text(
                      _.setting.onRecord ? 'Ruta en progreso' : 'Ultima ruta'),
              _.userProfile.routes.isEmpty
                  ? SizedBox(
                      height: 10.0.hp,
                    )
                  : Container(
                      width: 90.0.wp,
                      height: 8.0.hp,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 2.0,
                              blurRadius: 1.0),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _.router?.name ?? '',
                                  style: TextStyle(fontSize: 1.69.dp),
                                ),
                                Text(
                                  "Fecha: ${_.router?.getDate()}",
                                  style: const TextStyle(
                                      fontSize: 11, fontFamily: 'Roboco'),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _.setting.onRecord
                                    ? TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.cyan),
                                        onPressed: () async {
                                          await Get.toNamed(
                                              Routes.routerDetail);
                                          _.updateSetting();
                                        },
                                        child: const Text(
                                          'Ir',
                                          style: TextStyle(color: Colors.white),
                                        ))
                                    : Text(
                                        _.router?.diffInHour() ?? '',
                                        style: const TextStyle(fontSize: 13),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
              SizedBox(height: 2.0.hp),
              Text(
                  'Con permisos: ${_.hasPermissions}, index: ${_.index} y solicitud: ${_.requestLocation}'),
              ButtonBackground(
                onPressed: () async {
                  _.hasPermissions = await _.service.verifyPermissions();

                  // RowSettingDB db = RowSettingDB();
                  // await db.open();
                  // int count = await db.count();
                  // print('count $count');
                  // await db.updateStep(
                  //     Seeting(darkMode: false, stepIndex: 3, onRecord: false));
                  String? token = await Auth.instance.getToken();
                  print('token $token');

                  UserProfile user =  await Auth.instance.getUser();
                  print('user ${user.user?.name}');


                  _.index = await Auth.instance.getStep();
                  print('preference step : ${_.index}');
                  Auth.instance.step(_.index + 1);
                  _.updateScreen();

                  // Seeting s = Auth.instance.getSeeting();
                  // _.index = s.stepIndex;
                  // _.updateScreen();
                  // print('index: ${_.index}');
                  // print('permiso: ${_.hasPermissions}');
                  // print('solicitud ${_.requestLocation}');
                  // print('mas 1 index: ');
                  // s.stepIndex = s.stepIndex + 1;
                  // await Auth.instance.setSeeting(s);

                  bool result = await showAcceptDialog(
                      title: 'Salir',
                      contentText: '¿Esta seguro de salir?',
                      backgroundAccept: Colors.blue);
                  if (result) {
                    Auth.instance.logOut();
                    Get.offAllNamed(Routes.login);
                  }
                },
                background: Colors.red,
                color: Colors.white,
                label: 'Salir',
                fontSize: 1.8.dp,
              )
              // TextButton(
              //   onPressed: () async {
              //     _.setting.stepIndex = 1;
              //     Auth.instance.setSeeting(_.setting);
              //     RowLocationDB db = RowLocationDB();
              //     await db.open();
              //   },
              //   child: const Text('test'),
              // ),
            ],
          ),
        );
      },
    );
  }
}
