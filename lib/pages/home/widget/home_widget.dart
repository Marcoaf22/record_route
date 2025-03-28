import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_route/core/utils/enviroments.dart';
import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/pages/home/home_controller.dart';
import 'package:record_route/pages/widgets/button_scanner.dart';
import 'package:record_route/pages/widgets/label_text.dart';
import 'package:record_route/routes/app_pages.dart';
import 'package:record_route/util/dialogs.dart';
import 'package:record_route/util/percent_width_height.dart';
import 'package:record_route/util/toastr.dart';

class HomeWidget extends StatelessWidget {
  final toastr = ToastrService();
  HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController patientcontroller = TextEditingController();
    final FocusNode _focusNode = FocusNode();
    final colors = Theme.of(context).colorScheme;
    return GetBuilder<HomeController>(
      id: 'homeWidget',
      builder: (_) {
        return GestureDetector(
          onTap: () {
            _focusNode.unfocus();
          },
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 1.5.hp, left: 30),
                        child: Text(
                          _.user?.company ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: colors.onPrimary,
                              fontSize: 2.7.dp),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(35.0.wp / 2),
                      child: GetBuilder<HomeController>(builder: (_) {
                        String? path = _.user?.urlImage;
                        if (path == null) {
                          return Container(
                            height: 35.0.wp,
                            width: 35.0.wp,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.6),
                                    BlendMode.dstATop),
                                image: const AssetImage(
                                    "assets/users/user_male.png"),
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
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            height: 35.0.wp,
                            width: 35.0.wp,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10.0,
                                    spreadRadius: 10.0)
                              ],
                              image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.6),
                                    BlendMode.dstATop),
                                image: AssetImage(path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      })),
                  Container(
                    height: 2.0.hp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
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
                              _.user?.name ?? '',
                              style:
                                  TextStyle(fontSize: 15, fontFamily: 'Kanit'),
                            ),
                            const Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Kanit',
                                  fontStyle: FontStyle.normal),
                            ),
                            Text(
                              _.user?.email ?? '',
                              style:
                                  TextStyle(fontSize: 15, fontFamily: 'Kanit'),
                            ),
                            const Text(
                              'Telefono',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Kanit',
                                  fontStyle: FontStyle.normal),
                            ),
                            Text(
                              _.user?.phone ?? '',
                              style:
                                  TextStyle(fontSize: 15, fontFamily: 'Kanit'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5.0.hp),
                  Text(_.setting.onRecord ? 'Ruta en progreso' : 'Ultima ruta'),
                  Container(
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
                                'Ruta #4' ?? '',
                                style: TextStyle(),
                              ),
                              Text(
                                "Hora Inicio:12:23 AM",
                                style: TextStyle(
                                    fontSize: 11, fontFamily: 'Roboco'),
                              ),
                              Text(
                                "Hora Fin:16:35 AM",
                                style: TextStyle(
                                    fontSize: 11, fontFamily: 'Roboco'),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _.setting.onRecord
                                  ? TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.cyan),
                                      onPressed: () async {
                                        await Get.toNamed(Routes.routerDetail);
                                        _.updateSetting();
                                      },
                                      child: Text(
                                        'Ir',
                                        style: TextStyle(color: Colors.white),
                                      ))
                                  : Text(
                                      "3:23 Hr.",
                                      style: TextStyle(fontSize: 13),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
