import 'package:ecomerce_mobile/src/pages/perfil/update/perfil_update_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PerfilUpdatePage extends StatelessWidget {
  PerfilUpdateController con = Get.put(PerfilUpdateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _buttonBack(),
          _imageUser(context)
        ],
      ),
    );
  }

  Widget _buttonBack() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
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
            _textIngresarInfo(),
            _textFieldName(),
            _textFieldLastName(),
            _textFieldPhone(),
            _buttonUpdate(context),
          ],
        ),
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: con.nameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Nombre completos',
          labelText: 'Nombre completo',
          suffixIcon: Icon(Icons.person),
        ),
      ),
    );
  }

  Widget _textFieldLastName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: con.lastnameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Apellidos',
          labelText: 'Apellidos',
          suffixIcon: Icon(Icons.person_2_outlined),
        ),
      ),
    );
  }

  Widget _textFieldPhone() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: con.phoneController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: 'Teléfono',
          labelText: 'Teléfono',
          suffixIcon: Icon(Icons.phone),
        ),
      ),
    );
  }

  Widget _buttonUpdate(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () => con.updateInfo(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: const Text('Actualizar Datos',
            style: TextStyle(color: Colors.black, fontSize: 17)),
      ),
    );
  }

  Widget _textIngresarInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: const Text(
        'Registrarse',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _imageUser(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        alignment: Alignment.topCenter,
        child: const CircleAvatar(
          child: Icon(
            Icons.person,
            color: Colors.black,
            size: 90.0,
          ),
          radius: 60,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
