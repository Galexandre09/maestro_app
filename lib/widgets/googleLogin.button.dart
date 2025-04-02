import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maestro_app/widgets/loginView.controller.dart';

class GoogleLoginButton extends GetView<LoginController> {
  const GoogleLoginButton ({super.key});
  @override
   Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.tryToGoogleLogin();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
           Icon(Icons.g_mobiledata),
           Text('Entrar com o google'),
        ],
      ),
    );
  }
}