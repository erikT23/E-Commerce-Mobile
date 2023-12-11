import 'package:ecomerce_mobile/src/pages/address/list/address_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressListPage extends StatelessWidget {
  AddressListController controller = Get.put(AddressListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Mis direcciones',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          _iconAddressCreate(),
        ],
      ),
    );
  }

  Widget _iconAddressCreate() {
    return IconButton(
      icon: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () => controller.goToAddAddressCreate(),
    );
  }
}
