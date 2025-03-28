import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:record_route/pages/router/router_controller.dart';
import 'package:record_route/data/model/router.dart' as Model;
import 'package:record_route/routes/app_pages.dart';
import 'package:record_route/util/dialogs.dart';
import 'package:record_route/util/percent_width_height.dart';

class RouterPage extends StatelessWidget {
  const RouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RouterController>(
      init: RouterController(),
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text(_.user?.company ?? '')),
        body: SafeArea(
          child: Column(
            children: [
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
                              // bool result = await showAcceptDialog(
                              //     backgroundAccept: Colors.cyan,
                              //     contentText:
                              //         "¿Esta seguro de iniciar la ruta?",
                              //     title: "Ruta");
                              // if (result) {
                              // _.create();

                              await Get.toNamed(Routes.routerForm);

                              _.updateSetting();
                              // }
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
                    Model.Router router = _.routes[index];
                    return Container(
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
                                  router.name ?? '',
                                  style: TextStyle(),
                                ),
                                Text(
                                  "Hora Inicio: ${router.duration} AM",
                                  style: TextStyle(
                                      fontSize: 11, fontFamily: 'Roboco'),
                                ),
                                Text(
                                  "Hora Fin:${router.duration} AM",
                                  style: TextStyle(
                                      fontSize: 11, fontFamily: 'Roboco'),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${router.duration} Hr.",
                                  style: TextStyle(fontSize: 13),
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
        ),
      ),
    );
  }
}
