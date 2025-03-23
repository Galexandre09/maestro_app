import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maestro_app/login/login.view.dart';
import 'package:get/get.dart';
import 'package:maestro_app/widgets/login.bindings.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: LoginBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red, 
        ),
      home: const LoginView(),
    );
  }
}
