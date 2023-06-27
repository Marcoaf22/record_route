import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/pages/router_detail/router_detail_controller.dart';
import 'package:record_route/pages/router_detail/widget/button_final.dart';
import 'package:record_route/util/dialogs.dart';
import 'package:record_route/util/toastr.dart';

class RouterDetailPage extends StatelessWidget {
  const RouterDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RouterDetailController>(
      init: RouterDetailController(),
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Ruta en progreso')),
        body: SafeArea(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Column(
                  children: [
                    ButtonFinal(
                      icon: Icons.place,
                      onPressed: () async {
                        bool result = await showAcceptDialog(
                            backgroundAccept: Colors.blue,
                            title: 'Confirmar',
                            contentText: 'confirmar llegada a la planta');
                        if (result) {
                          Get.showOverlay(
                            asyncFunction: () async {
                              bool saved = await _.nextStep(2);
                              if (saved) {
                                ToastrService toarst = ToastrService();
                                toarst.success(
                                    title: 'LLEGADA A LA PLANTA',
                                    message: 'Registrado');
                              }
                              await Future.delayed(const Duration(seconds: 1));

                              return null;
                            },
                            loadingWidget: const Center(
                              child: CircularProgressIndicator(),
                            ),
                            opacity: 0.4,
                            opacityColor: Colors.black45,
                          );
                        }
                      },
                      background: Colors.orange,
                      label: " ${_.router.locations[0].description}",
                      fontSize: 20,
                      index: 1,
                      indexSelected: _.setting.stepIndex,
                    ),
                    ButtonFinal(
                      icon: Icons.output_rounded,
                      onPressed: () async {
                        bool result = await showAcceptDialog(
                            backgroundAccept: Colors.blue,
                            title: 'Confirmar',
                            contentText:
                                '¿Quiere confirma llegada a la planta?');
                        if (result) {
                          Get.showOverlay(
                            asyncFunction: () async {
                              bool saved = await _.nextStep(3);
                              if (saved) {
                                ToastrService toarst = ToastrService();
                                toarst.success(
                                    title: 'SALIDA DE PLANTA',
                                    message: 'Registrado');
                              }
                              await Future.delayed(const Duration(seconds: 1));

                              return null;
                            },
                            loadingWidget: const Center(
                              child: CircularProgressIndicator(),
                            ),
                            opacity: 0.4,
                            opacityColor: Colors.black45,
                          );
                        }
                      },
                      background: Colors.orange,
                      label: _.router.locations[1].description,
                      fontSize: 20,
                      index: 2,
                      indexSelected: _.setting.stepIndex,
                    ),
                    ...List.generate(_.companies.length, (int i) {
                      Location item = _.companies[i];
                      return ButtonFinal(
                        icon: Icons.reply_outlined,
                        onPressed: () async {
                          bool result = await showAcceptDialog(
                              backgroundAccept: Colors.blue,
                              title: 'Confirmar',
                              contentText:
                                  '¿Esta seguro de finalizar la ruta?');
                          if (result) {
                            Get.showOverlay(
                              asyncFunction: () async {
                                bool saved = await _.nextStep(3 + (i + 1));
                                if (saved) {
                                  ToastrService toarst = ToastrService();
                                  toarst.success(
                                      title: item.name, message: 'Registrado');
                                }
                                await Future.delayed(
                                    const Duration(seconds: 1));
                                return null;
                              },
                              loadingWidget: const Center(
                                child: CircularProgressIndicator(),
                              ),
                              opacity: 0.4,
                              opacityColor: Colors.black45,
                            );
                          }
                        },
                        background: Colors.orange,
                        label: "${item.description} ${item.name}",
                        fontSize: 20,
                        index: 3 + i,
                        indexSelected: _.setting.stepIndex,
                      );
                    }),
                    ButtonFinal(
                      icon: Icons.new_releases_outlined,
                      onPressed: () async {
                        bool result = await showAcceptDialog(
                            backgroundAccept: Colors.blue,
                            title: 'Confirmar',
                            contentText: '¿Esta seguro de finalizar la ruta?');
                        if (result) {
                          Get.showOverlay(
                            asyncFunction: () async {
                              bool saved = await _.closed();
                              if (saved) {
                                ToastrService toarst = ToastrService();
                                toarst.success(
                                    title: 'FINALIZAR RUTA',
                                    message: 'Registrado');
                              }
                              await Future.delayed(const Duration(seconds: 1));
                              return null;
                            },
                            loadingWidget: const Center(
                              child: CircularProgressIndicator(),
                            ),
                            opacity: 0.4,
                            opacityColor: Colors.black45,
                          );
                        }
                      },
                      background: Colors.orange,
                      label: "FINALIZAR RUTA",
                      fontSize: 20,
                      index: 3 + (_.companies.length),
                      indexSelected: _.setting.stepIndex,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
