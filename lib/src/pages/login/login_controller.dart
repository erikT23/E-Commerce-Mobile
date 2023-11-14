import 'package:ecomerce_mobile/src/models/response_api.dart';
import 'package:ecomerce_mobile/src/providers/users_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProviders usersProviders = UsersProviders();

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email: $email');
    print('Password: $password');

    if (isValidForm(email, password)) {
      ResponseApi responseApi = await usersProviders.login(email, password);

      print('Response API : ${responseApiToJson(responseApi)}}');

      if (responseApi.message == 'succesful operation Loggin') {
        Get.snackbar('Login correcto', responseApi.message ?? 'Login correcto',
            colorText: Colors.white, backgroundColor: Colors.green);
      } else {
        Get.snackbar(
            'Login fallido', responseApi.message ?? 'Error al iniciar sesión',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    }
  }

  bool isValidForm(String email, String password) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'El email es requerido',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'La contraseña es requerida',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }

    if (password.length < 4) {
      Get.snackbar('Formulario no valido', 'La contraseña debe ser mayor a 4 caracteres',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }


    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'El email no es valido',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }

    return true;
  }
}
