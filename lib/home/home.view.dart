import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maestro_app/widgets/loginView.controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find(); // Obtém o controller

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              loginController.logout(); // Chama o logout
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Center(child: Text("Bem-vindo!"));
  }
}
