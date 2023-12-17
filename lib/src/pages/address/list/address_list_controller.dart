import 'dart:ffi';

import 'package:ecomerce_mobile/src/models/address.dart';
import 'package:get/get.dart';

class AddressListController extends GetxController {
  var radioValue = 0.obs;

  void handleRadioValueChange(int? value) {
    radioValue.value = value!;
    print('valor seleccionado $value');
  }

  List<Address> address = [];

  void goToAddAddressCreate() {
    Get.toNamed('/address/create');
  }
}
