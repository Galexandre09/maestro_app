import 'package:get/get.dart';
import 'package:maestro_app/widgets/loginView.controller.dart';

class LoginBindings extends Bindings {
  @override
 void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}