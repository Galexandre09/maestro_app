import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:maestro_app/widgets/googleLogin.button.dart';

class LoginView extends StatelessWidget   {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(child: const Text('Login')),),
      body: _body(),
    );
  }

  _body(){
      return ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(12),
        children: [
          SizedBox(
            height: Get.height / 3,
          ),
          Divider(),
          GoogleLoginButton()
        ],
      );
  }
}