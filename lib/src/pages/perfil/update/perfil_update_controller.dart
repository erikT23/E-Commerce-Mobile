import 'package:ecomerce_mobile/src/models/response_api.dart';
import 'package:ecomerce_mobile/src/models/user.dart';
import 'package:ecomerce_mobile/src/providers/users_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class PerfilUpdateController extends GetxController {
  User user = User.fromJson(GetStorage().read('user'));

  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  UsersProviders usersProviders = UsersProviders();

  void updateInfo(BuildContext context) async {
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text.trim();

    if (isValidForm(name, lastname, phone)) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 700, msg: '🦆Actualizando...');

      User myUser = User(
        id: user.id,
        name: name,
        lastName: lastname,
        phoneNumber: phone,
      );

      ResponseApi responseApi = await usersProviders.update(myUser);
      if (responseApi.message == 'succesful operation ok') {
        progressDialog.close();
        print('responseApi: ${responseApi.data}');
        user.name = name;
        user.lastName = lastname;
        user.phoneNumber = phone;
        GetStorage().write('user', user);
        Get.snackbar('Formulario valido', 'El formulario es valido',
            colorText: Colors.white, backgroundColor: Colors.green);
      } else {
        print('responseApi: ${responseApi.data}');
        progressDialog.close();
        Get.snackbar('Formulario no valido', 'El formulario no es valido',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    }
  }

  PerfilUpdateController() {
    nameController.text = user.name ?? '';
    lastnameController.text = user.lastName ?? '';
    phoneController.text = user.phoneNumber ?? '';
  }

  bool isValidForm(
    String name,
    String lastname,
    String phone,
  ) {
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

    return true;
  }
}
