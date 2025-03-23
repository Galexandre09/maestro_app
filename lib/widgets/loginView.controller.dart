import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();

  final loading = false.obs;
  final GoogleSignIn _googleSignIn =GoogleSignIn(); 
  String  ?userName = "";
  String  ?userEmail  = "";
  String  ?imageUrl = "";

  Future<void> tryToGoogleLogin() async{
    loading(true);
    final result = await _googleLogin();

    loading(false);
    result ? Login() : _showError();
  }
  
  Future<bool> _googleLogin() async{
    
    final result = await _googleSignIn.signIn().then((value){
      userName = value!.displayName;
      userEmail = value!.email;
      imageUrl = value.photoUrl;
    });
    return userName != '' ? true : false;
  }

  _showError(){
    print("Erro ao entrar");
  }

  void Login() {
    Get.to(Homeview());
  }


}
