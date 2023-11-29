import 'dart:io';

import 'package:ecomerce_mobile/src/models/user.dart';
import 'package:ecomerce_mobile/src/providers/users_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProviders usersProviders = UsersProviders();
  ImagePicker imagePicker = ImagePicker();
  File? imageFile;

  void register(BuildContext context) async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print('Email: $email');
    print('Password: $password');

    if (isValidForm(email, name, lastname, phone, password, confirmPassword)) {

      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 400, msg: '🔧Creando usuario...');

      User user = User(
        name: name,
        lastName: lastname,
        password: password,
        email: email,
        phoneNumber: phone,
      );

      Response response = await usersProviders.create(user);
      print('Response ${response.body}');

      if(response.isOk){
        progressDialog.close();
        Get.snackbar('Formulario valido', 'El formulario es valido',
          colorText: Colors.white, backgroundColor: Colors.green);
      }
      else{
        progressDialog.close();
        Get.snackbar('Formulario no valido', 'El formulario no es valido',
          colorText: Colors.white, backgroundColor: Colors.red);
      }
      
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
      Get.snackbar(
          'Formulario no valido', 'El teléfono tiene que ser de 10 dígitos',
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

  Future selectImage(ImageSource source) async {
    XFile? image = await imagePicker.pickImage(source: source);
    if (image != null) {
      imageFile = File(image.path);
      update();
    }
  }

  void showAlertDialog(BuildContext context) {
    Widget galleryButton = ElevatedButton(
      child: const Text(
        'Galeria',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Get.back();
        selectImage(ImageSource.gallery);
      },
    );

    Widget cameraButton = ElevatedButton(
      child: const Text(
        'Camara',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Get.back();
        selectImage(ImageSource.camera);
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text('Selecciona una opción'),
      content: const Text('¿De donde quieres tomar la foto?'),
      actions: [
        galleryButton,
        cameraButton,
      ],
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}


// Stream stream = await usersProviders.createWidthImage(user, imageFile!);
//       stream.listen((response) {

//         ResponseApi responseApi = ResponseApi.fromJson(json.decode(response));

//         if (responseApi.success == true) {
//           GetStorage().write(
//             'user', responseApi.data); // Guardar el usuario en el local storage
//         GoToHomePage();
//         }
//         else {
//           Get.snackbar(
//               'Registro fallido', responseApi.message ?? 'Error al registrar',
//               colorText: Colors.white, backgroundColor: Colors.red);
//         }
        
//       });