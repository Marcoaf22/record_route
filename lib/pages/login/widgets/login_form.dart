import 'package:flutter/material.dart';
// import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:record_route/pages/login/login_controller.dart';
import 'package:record_route/pages/login/widgets/input_text.dart';
import 'package:record_route/routes/app_pages.dart';

import 'package:record_route/util/percent_width_height.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    // final Responsive responsive = Responsive.of(context)
    return Positioned(
      bottom: 30,
      left: 20,
      right: 20,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InputText(
                label: 'USUARIO',
                keyboardType: TextInputType.text,
                fontSize: 1.7.dp,
                onChanged: (text) {
                  _email = text;
                },
                validator: (text) {
                  String txt = text ?? '';
                  if (txt.isEmpty) {
                    return "Usuario es requerido";
                  }
                  return null;
                },
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black12,
                ))),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InputText(
                        label: 'CONTRASEÑA',
                        onChanged: (text) {
                          _password = text;
                        },
                        keyboardType: TextInputType.text,
                        validator: (text) {
                          if (text != null) {
                            if (text.trim().isEmpty) {
                              return "Contraseña es requerida";
                            }
                            if (text.length < 3) {
                              return "La contraseña es demasiado corta";
                            }
                          }
                          return null;
                        },
                        obscureText: true,
                        borderEnable: false,
                        fontSize: 1.7.dp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0.dp,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    _submit();
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Text(
                    'Ingresar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.0.dp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _submit() async {
    final isOk = _formKey.currentState?.validate();
    // final isOk = true;
    if (isOk != null && isOk) {
      FocusScope.of(context).unfocus();
      LoginController c = Get.find<LoginController>();
      bool next = await c.signIn(_email, _password);
      if (next) {
        Get.offNamedUntil(Routes.home, (route) => false);
      }
    }
  }
}
