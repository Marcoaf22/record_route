import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:record_route/pages/home/home_controller.dart';
import 'package:record_route/pages/setting/setting_controller.dart';
import 'package:record_route/pages/setting/widget/option_seeting.dart';
import 'package:record_route/util/percent_width_height.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colorScheme;
    return GetBuilder<SettingController>(
      init: SettingController(),
      builder: (_) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(100.0.wp, 8.0.hp),
          child: Padding(
            padding: EdgeInsets.only(top: 2.0.hp),
            child: Text(
              'Configuracion',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colors.onPrimary,
                fontSize: 3.3.dp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 8.0.hp),
              ClipRRect(
                clipBehavior: Clip.none,
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: SvgPicture.asset('assets/logo.svg', width: 25.0.wp),
                ),
              ),
              SizedBox(height: 5.0.hp),
              OptionSeeting(
                colorIcon: Colors.blueGrey,
                title: 'Usar la Camara',
                icon: Icons.camera_alt,
                value: _.onCamera,
                onChanged: (event) {
                  _.configOnCamera(event);
                },
              ),
              // OptionSeeting(
              //   colorIcon: Colors.blueGrey,
              //   value: _.darkMode,
              //   title: 'Modo nocturno',
              //   icon: Icons.dark_mode,
              //   onChanged: (event) async {
              //     await _.configDarkMode(event);
              //     // print(Theme.of(context).colorScheme.primary);
              //   },
              // ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff3498db),
                  ),
                  onPressed: () {
                    final c = Get.find<HomeController>();
                    c.logOut();
                  },
                  child: Text(
                    'Cerrar Sesion',
                    style: TextStyle(
                      color: colors.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 2.0.dp,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
