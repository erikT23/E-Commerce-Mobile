import 'package:ecomerce_mobile/src/models/address.dart';
import 'package:ecomerce_mobile/src/models/user.dart';
import 'package:ecomerce_mobile/src/pages/address/map/address_map_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddressCreateController extends GetxController {
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController refPointController = TextEditingController();

  double latRefPoint = 0.0;
  double lngRefPoint = 0.0;

  User user = User.fromJson(GetStorage().read('user') ?? {});

  void openGoogleMaps(BuildContext context) async {
    Map<String, dynamic>? refPoint = await showModalBottomSheet(
      context: context,
      builder: (context) => AddressMapPage(),
      isDismissible: false,
      enableDrag: false,
    );

    if (refPoint != null) {
      refPointController.text = refPoint['address'];
      print('refPoint: $refPoint');
      latRefPoint = refPoint['lat'];
      lngRefPoint = refPoint['lng'];
    }
  }

  void createAddress() {
    String addressName = addressController.text;
    String city = cityController.text;

    if (isValidForm(addressName, city)) {
      Address address = Address(
        address: addressName,
        neighborhood: '',
        idUser: user.id,
        lat: latRefPoint,
        long: lngRefPoint,
      );

      Fluttertoast.showToast(
        msg: 'Dirección creada correctamente',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      Get.back();
    }
  }

  bool isValidForm(String address, String city) {
    if (address.isEmpty) {
      Get.snackbar(
        'Formulario no valido',
        'La dirección es obligatoria',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    if (city.isEmpty) {
      Get.snackbar(
        'Formulario no valido',
        'La ciudad es obligatoria',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    if (latRefPoint == 0.0 || lngRefPoint == 0.0) {
      Get.snackbar(
        'Formulario no valido',
        'El punto de referencia es obligatorio',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }
}
