import 'package:ecomerce_mobile/src/pages/address/create/address_create_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

class AddressCreatePage extends StatelessWidget {
  AddressCreateController con = Get.put(AddressCreateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _textNewAddress(),
          _iconBack(context),
        ],
      ),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperTwo(
          flip:
              true), // Existen diferentes clippers de onda, como WaveClipperTwo, etc.
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.35,
        color: Colors.black,
      ),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.3,
        left: 25,
        right: 25,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 15,
              offset: Offset(0.0, 7.5),
            )
          ]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textFieldAddress(),
            _textFieldCity(),
            _textFieldRefPoint(context),
            SizedBox(height: 20),
            _buttonAddAddress(context),
          ],
        ),
      ),
    );
  }

  Widget _iconBack(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 10),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
    );
  }

  Widget _textFieldAddress() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: con.addressController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Dirección',
          labelText: 'Dirección',
          suffixIcon: Icon(Icons.location_on),
        ),
      ),
    );
  }

  Widget _textFieldCity() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: con.cityController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Ciudad',
          labelText: 'Ciudad',
          suffixIcon: Icon(Icons.location_city),
        ),
      ),
    );
  }

  Widget _textFieldRefPoint(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        onTap: () => con.openGoogleMaps(context),
        controller: con.refPointController,
        autofocus: false,
        focusNode: AlwaysDisabledFocusNode(),
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Punto de referencia',
          labelText: 'Punto de referencia',
          suffixIcon: Icon(Icons.location_on),
        ),
      ),
    );
  }

  Widget _textNewAddress() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        alignment: Alignment.topCenter,
        child: const Column(
          children: [
            Icon(Icons.location_on, color: Colors.white, size: 100),
            Text(
              'Nueva dirección',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonAddAddress(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () => con.createAddress(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: const Text('Añadir nueva dirección',
            style: TextStyle(color: Colors.black, fontSize: 17)),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
