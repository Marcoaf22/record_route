import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:record_route/pages/home/home_controller.dart';
import 'package:record_route/util/percent_width_height.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    print('build homepage');
    return GetBuilder<HomeController>(
      init: Get.find<HomeController>(),
      builder: (_) {
        return Scaffold(
          backgroundColor: colors.background,
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  color: Colors.red,
                ),
                // _.requestLocation
                //     ? Container(
                //         width: 100.0.wp,
                //         decoration: BoxDecoration(color: Colors.yellowAccent),
                //         child: Text('Habilitar ubicacion'),
                //       )
                //     : const SizedBox.shrink(),
                Positioned(
                  top: 7.0.hp,
                  child: Container(
                    height: 100.0.hp,
                    width: 100.0.wp,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                    top: 0.0.hp,
                    right: -50.0.hp,
                    child: Transform.rotate(
                      angle: math.pi / 5,
                      child: Container(
                        height: 30.0.hp,
                        width: 190.0.wp,
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15)),
                          color: Colors.blue,
                        ),
                      ),
                    )),
                _.listPage[_.indexSelected],
                Positioned.fill(
                  child: Obx(
                    () {
                      if (_.staterequest == RequestState.loading) {
                        return Container(
                          color: Colors.black26,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: _CustomNavigationBar(
            index: _.indexSelected,
            onPressed: (selected) {
              _.updateIndexSelected(selected);
            },
          ),
        );
      },
    );
  }
}

class _CustomNavigationBar extends StatelessWidget {
  final int index;
  final Function(int event) onPressed;

  const _CustomNavigationBar({required this.index, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.primary,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  onPressed(0);
                },
                icon: const Icon(FontAwesomeIcons.house),
                color: index == 0 ? colors.onPrimary : Colors.grey,
              ),
              IconButton(
                onPressed: () {
                  onPressed(1);
                },
                icon: const Icon(FontAwesomeIcons.route),
                color: index == 1 ? colors.onPrimary : Colors.grey,
              ),
              // IconButton(
              //   onPressed: () {
              //     onPressed(2);
              //   },
              //   icon: const Icon(FontAwesomeIcons.userDoctor),
              //   color: index == 2 ? colors.onPrimary : colors.secondary,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
