import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_route/data/model/basic.dart';

import 'package:record_route/data/model/router.dart' as Model;
import 'package:record_route/pages/router_detail/router_detail_controller.dart';
import 'package:record_route/pages/router_detail/widget/button_option.dart';
import 'package:record_route/pages/router_detail/widget/button_final.dart';
import 'package:record_route/util/dialogs.dart';

class RouterDetailPage extends StatelessWidget {
  const RouterDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RouterDetailController>(
      init: RouterDetailController(),
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text("${_.user.company}")),
        body: SafeArea(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
              SizedBox(
                height: 30,
              ),
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
                          _.nextStep(2);
                        }
                      },
                      background: Colors.orange,
                      label: "Llegada a la Planta",
                      fontSize: 20,
                      index: 1,
                      indexSelected: _.setting.stepIndex,
                    ),
                    ButtonFinal(
                      icon: Icons.play_for_work_outlined,
                      onPressed: () async {
                        bool result = await showAcceptDialog(
                            backgroundAccept: Colors.blue,
                            title: 'Confirmar',
                            contentText: 'confirmar el ingreso a la planta');
                        if (result) {
                          _.nextStep(3);
                        }
                      },
                      background: Colors.orange,
                      label: "Ingreso - ${_.fuelPlant?.name}",
                      fontSize: 20,
                      index: 2,
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
                          _.nextStep(4);
                        }
                      },
                      background: Colors.orange,
                      label: "Salida de Planta",
                      fontSize: 20,
                      index: 3,
                      indexSelected: _.setting.stepIndex,
                    ),
                    ...List.generate(_.stations.length, (int i) {
                      BasicSelected item = _.stations[i];
                      return ButtonFinal(
                        icon: Icons.reply_outlined,
                        onPressed: () async {
                          bool result = await showAcceptDialog(
                              backgroundAccept: Colors.blue,
                              title: 'Confirmar',
                              contentText:
                                  '¿Esta seguro de finalizar la ruta?');
                          if (result) {
                            _.nextStep(4 + (i + 1));
                          }
                        },
                        background: Colors.orange,
                        label: "${item.index}: ${item.name}",
                        fontSize: 20,
                        index: 4 + i,
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
                          _.closed();
                        }
                      },
                      background: Colors.orange,
                      label: "Finalizar ruta",
                      fontSize: 20,
                      index: 4 + (_.stations.length),
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
