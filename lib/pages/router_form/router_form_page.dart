import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/pages/home/home_controller.dart';
import 'package:record_route/util/percent_width_height.dart';

import 'package:record_route/pages/router_form/router_form_controller.dart';
import 'package:record_route/routes/app_pages.dart';
import 'package:record_route/util/toastr.dart';

class RouterFormPage extends StatelessWidget {
  const RouterFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RouterFormController>(
      init: RouterFormController(),
      builder: (_) => SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text("Nueva Ruta")),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Seleccionar producto'),
                      ),
                      Center(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: const Row(
                              children: [
                                Icon(
                                  Icons.list,
                                  size: 16,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    'Seleccionar',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: _.products
                                .map((item) => DropdownMenuItem<Product>(
                                      value: item,
                                      child: Text(
                                        item.description ?? '',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: _.product,
                            onChanged: (value) {
                              if (value != null) {
                                print(value.description);
                                _.product = value;
                                _.update();
                              }
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              width: 90.0.wp,
                              padding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                color: Colors.white,
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 14,
                              iconEnabledColor: Colors.black,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 40.0.hp,
                              width: 90.0.wp,
                              padding: null,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              elevation: 8,
                              offset: const Offset(0, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                    MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Seleccionar planta origen'),
                      ),
                      Center(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: const Row(
                              children: [
                                Icon(
                                  Icons.list,
                                  size: 16,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    'Seleccionar',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: _.plants
                                .map((item) => DropdownMenuItem<Company>(
                                      value: item,
                                      child: Text(
                                        item.name ?? '',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: _.plant,
                            onChanged: (value) {
                              if (value != null) {
                                _.plant = value;
                                _.update();
                              }
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              width: 90.0.wp,
                              padding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                color: Colors.white,
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 14,
                              iconEnabledColor: Colors.black,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 40.0.hp,
                              width: 90.0.wp,
                              padding: null,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              elevation: 8,
                              offset: const Offset(0, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                    MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Seleccionar EESS destino'),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 90.0.wp,
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int i) {
                              Company item = _.stations[i];
                              return GestureDetector(
                                onTap: () {
                                  item.selected = !item.selected;
                                  if (!item.selected) {
                                    _.desmark(item.index);
                                    item.index = 0;
                                  }
                                  if (item.selected) {
                                    item.index = _.nextIndex();
                                  }
                                  _.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  width: 80.0.wp,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                      color: item.selected
                                          ? Colors.green
                                          : Colors.white,
                                      border: Border.all(color: Colors.black26),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5,
                                            spreadRadius: 5)
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(item.name),
                                      Text(item.index > 0
                                          ? item.index.toString()
                                          : ''),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: _.stations.length,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80.0.wp,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blueAccent),
                          onPressed: () {
                            save(_);
                          },
                          child: Text(
                            'Iniciar Ruta',
                            style: TextStyle(
                                color: Colors.white, fontSize: 2.0.dp),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0.hp)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  save(_) async {

    if (_.plant == null) {
      ToastrService().info('Faltan datos', 'Debe seleccionar una planta');
      return;
    }
    if (_.product == null) {
      ToastrService().info('Faltan datos', 'Debe seleccionar un producto');
      return;
    }

    if (_.validateForm()) {
      ToastrService().info('Faltan datos', 'Debe seleccionar una EESS');
      return;
    }

    bool result = false;
    result = await _.validateServiceEnable();
    if (!result) {
      ToastrService().info('ERROR', 'Debe habilitar el servicio de GPS');
      return;
    }
    result = await _.save();
    if (result) {
      HomeController home = Get.find<HomeController>();
      home.updateSetting();

      ToastrService().success(title: 'Ruta', message: 'La ruta ha sido creada');
      Get.offAndToNamed(Routes.routerDetail);
    }
  }
}
