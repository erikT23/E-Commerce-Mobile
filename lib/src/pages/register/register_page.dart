import 'package:ecomerce_mobile/src/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _buttonRegister(context),
          _imageUser(context),
          _buttonBack(),
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
        color: Colors.amber.withOpacity(0.8),
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
            _textFieldEmail(),
            _textFieldName(),
            _textFieldLastName(),
            _textFieldPhone(),
            _textFielPassword(),
            _textFielConfirmPassword(),
          ],
        ),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: registerController.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'Correo electrónico',
          labelText: 'Correo electrónico',
          suffixIcon: Icon(Icons.email_outlined),
        ),
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: registerController.nameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Nombre completo',
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
        controller: registerController.lastnameController,
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
        controller: registerController.phoneController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: 'Teléfono',
          labelText: 'Teléfono',
          suffixIcon: Icon(Icons.phone),
        ),
      ),
    );
  }

  Widget _textFielPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: registerController.passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Contraseña',
          labelText: 'Contraseña',
          suffixIcon: Icon(Icons.lock),
        ),
      ),
    );
  }

  Widget _textFielConfirmPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: registerController.confirmPasswordController,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Confirmar contraseña',
          labelText: 'Confirmar Contraseña',
          suffixIcon: Icon(Icons.lock_outline_rounded),
        ),
      ),
    );
  }

  Widget _buttonRegister(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 630, left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () => registerController.register(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text('Registrarse',
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
        child: GestureDetector(
            onTap: () => registerController.showAlertDialog(context),
            child: GetBuilder<RegisterController>(
              builder: (value) => CircleAvatar(
                backgroundImage: registerController.imageFile != null
                    ? FileImage(registerController.imageFile!)
                    : const AssetImage(
                        'assets/img/register.png',
                      ) as ImageProvider,
                radius: 60,
                backgroundColor: Colors.white,
              ),
            )),
      ),
    );
  }
}
