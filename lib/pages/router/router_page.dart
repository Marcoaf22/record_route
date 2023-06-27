import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_route/data/service/get_location.dart';

import 'package:record_route/pages/router/router_controller.dart';
import 'package:record_route/routes/app_pages.dart';
import 'package:record_route/util/percent_width_height.dart';
import 'package:record_route/data/model/user_profile.dart' as Models;
//import 'package:location/location.dart';

class RouterPage extends StatelessWidget {
  const RouterPage({ super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GetBuilder<RouterController>(
      init: RouterController(),
      builder: (_) => Column(
        children: [
          Obx(() {
            GetLocation service = Get.find<GetLocation>();
            if (service.requestService.value) {
              return Container(
                width: 100.0.wp,
                decoration: const BoxDecoration(color: Colors.yellowAccent),
                child: Row(
                  children: [
                    const Text('La ubicacion no esta habilitada'),
                    TextButton(
                      onPressed: () async {
                       // Location location = new Location();
                       // bool isEnable = await location.serviceEnabled();
                       // if (!isEnable) {
                       //   bool result = await location.requestService();
                       //   service.hideLocation();
                       // }
                        // service.requestLocationService();
                      },
                      child: const Text('Activar GPS'),
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
                  'PRUEBA',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colors.onPrimary,
                      fontSize: 2.7.dp),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _.setting.onRecord
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextButton(
                        onPressed: () async {
                          await Get.toNamed(Routes.routerDetail);
                          _.updateSetting();
                        },
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10),
                            backgroundColor: Colors.cyan),
                        child: const Text('Ver ruta',
                            style: TextStyle(color: Colors.white)),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () async {
                          await Get.toNamed(Routes.routerForm);
                          _.updateSetting();
                        },
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(10),
                            backgroundColor: Colors.cyan),
                        child: const Text('Iniciar Ruta',
                            style: TextStyle(color: Colors.white)),
                      ),
                    )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (buildContext, index) {
                Models.Route router = _.routes[index];
                return Container(
                  width: 90.0.wp,
                  height: 8.0.hp,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
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
                              router.name,
                              style: const TextStyle(),
                            ),
                            Text(
                              "Hora Inicio: ${router.getDateStart()}",
                              style: const TextStyle(
                                  fontSize: 11, fontFamily: 'Roboco'),
                            ),
                            Text(
                              "Hora Fin: ${router.getDateFinish()}",
                              style: const TextStyle(
                                  fontSize: 11, fontFamily: 'Roboco'),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              router.diffInHour(),
                              style: const TextStyle(fontSize: 13),
                            ),
                            Text(
                              router.status,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: _.routes.length,
            ),
          )
        ],
      ),
    );
  }
}
