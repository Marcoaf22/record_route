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
        appBar: AppBar(title: Text('Ruta en progreso')),
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
                          bool saved = await _.nextStep(2);
                          if (saved) {
                            ToastrService toarst = ToastrService();
                            toarst.success(
                                title: 'Ruta',
                                message: 'La llegada ala planta registrada');
                          }
                        }
                      },
                      background: Colors.orange,
                      label: " ${_.router.locations[0].description}",
                      fontSize: 20,
                      index: 1,
                      indexSelected: _.setting.stepIndex,
                    ),
                    // ButtonFinal(
                    //   icon: Icons.play_for_work_outlined,
                    //   onPressed: () async {
                    //     bool result = await showAcceptDialog(
                    //         backgroundAccept: Colors.blue,
                    //         title: 'Confirmar',
                    //         contentText: 'confirmar el ingreso a la planta');
                    //     if (result) {
                    //       _.nextStep(3);
                    //     }
                    //   },
                    //   background: Colors.orange,
                    //   label: "Ingreso a la planta",
                    //   fontSize: 20,
                    //   index: 2,
                    //   indexSelected: _.setting.stepIndex,
                    // ),
                    ButtonFinal(
                      icon: Icons.output_rounded,
                      onPressed: () async {
                        bool result = await showAcceptDialog(
                            backgroundAccept: Colors.blue,
                            title: 'Confirmar',
                            contentText:
                                '¿Quiere confirma llegada a la planta?');
                        if (result) {
                          bool saved = await _.nextStep(3);
                          if (saved) {
                            ToastrService toarst = ToastrService();
                            toarst.success(
                                title: 'Ruta',
                                message: 'La salida de la planta registrada');
                          }
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
                            bool saved = await _.nextStep(3 + (i + 1));
                            if (saved) {
                              ToastrService toarst = ToastrService();
                              toarst.success(
                                  title: 'Ruta',
                                  message:
                                      'La llegada ala estacion registrada');
                            }
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
                          bool saved = await _.closed();
                          if (saved) {
                            ToastrService toarst = ToastrService();
                            toarst.success(
                                title: 'Ruta',
                                message: 'La ruta ha finalizado');
                          }
                        }
                      },
                      background: Colors.orange,
                      label: "Finalizar ruta",
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
