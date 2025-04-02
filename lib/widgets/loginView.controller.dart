import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maestro_app/home/home.view.dart';
import 'package:maestro_app/login/login.view.dart';

class LoginController extends GetxController {
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();

  final loading = false.obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn(); 

  String? userName;
  String? userEmail;
  String? imageUrl;

  /// **Faz login com o Google**
  Future<void> tryToGoogleLogin() async {
    loading(true);
    bool result = await _googleLogin();
    loading(false);

    if (result) {
      Get.offAll(() => HomeView()); // Navegação segura
    } else {
      _showError();
    }
  }

  /// **Lógica do login com Google corrigida**
  Future<bool> _googleLogin() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      
      if (googleUser != null) {
        userName = googleUser.displayName;
        userEmail = googleUser.email;
        imageUrl = googleUser.photoUrl;
        return true;
      } else {
        return false; // Usuário cancelou o login
      }
    } catch (e) {
      print("Erro no login: $e");
      return false;
    }
  }

  /// **Mostra erro caso o login falhe**
  void _showError() {
    Get.snackbar("Erro", "Falha ao realizar login com Google",
        snackPosition: SnackPosition.BOTTOM);
  }

  /// **Faz logout do Google**
  Future<void> logout() async {
    await _googleSignIn.signOut(); 
    userName = null;
    userEmail = null;
    imageUrl = null;
    Get.offAll(() => LoginView()); // Redireciona para a tela de login
  }
}
