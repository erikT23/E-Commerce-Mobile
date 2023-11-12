import 'package:ecomerce_mobile/src/models/user.dart';
import 'package:ecomerce_mobile/src/providers/users_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProviders usersProviders = UsersProviders();

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print('Email: $email');
    print('Password: $password');

    if (isValidForm(email, name, lastname, phone, password, confirmPassword)) {
      User user = User(
        name: name,
        lastName: lastname,
        password: password,
        email: email,
        phoneNumber: phone,
      );

      Response response = await usersProviders.create(user);
      print('Response ${response.body}');

      Get.snackbar('Formulario valido', 'El formulario es valido',
          colorText: Colors.white, backgroundColor: Colors.green);
    }
  }

  bool isValidForm(String email, String name, String lastname, String phone,
      String password, String confirmPassword) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'El email es requerido',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'El email no es valido',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }

    if (name.isEmpty) {
      Get.snackbar('Formulario no valido', 'El nombre es requerido',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }

    if (lastname.isEmpty) {
      Get.snackbar('Formulario no valido', 'El apellido es requerido',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }

    if (phone.isEmpty) {
      Get.snackbar('Formulario no valido', 'El teléfono es requerido',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }

    if (phone.length < 10) {
      Get.snackbar('Formulario no valido', 'El teléfono tiene que ser de 10 dígitos',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'La contraseña es requerida',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }

    if (confirmPassword.isEmpty) {
      Get.snackbar(
          'Formulario no valido', 'La confirmación de contraseña es requerida',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }

    if (password != confirmPassword) {
      Get.snackbar('Formulario no valido', 'Las contraseñas no coinciden',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }

    return true;
  }
}