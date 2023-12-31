import 'package:ecomerce_mobile/src/pages/perfil/info/perfil_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

class PerfilInfoPage extends StatelessWidget {
  PerfilInfoController con = Get.put(PerfilInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _imageUser(context),
          _buttonLogOut()
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
      child: Column(
        children: [
          _textName(),
          _textEmail(),
          _textPhone(),
          _buttonUpdate(context),
        ],
      ),
    );
  }

  Widget _buttonLogOut() {
    return SafeArea(
      child: Container(
        alignment: Alignment.topRight,
        margin: const EdgeInsets.only(top: 20, right: 20),
        child: IconButton(
          icon: const Icon(Icons.power_settings_new, color: Colors.white),
          onPressed: () => con.logOut(),
        ),
      ),
    );
  }

  Widget _buttonUpdate(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () => con.goToUpdate(),
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

  Widget _textName() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListTile(
          leading: const Icon(
            Icons.person,
          ),
          title: Text(
            '${con.user.name ?? ''}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 21,
            ),
          ),
          subtitle: const Text(
            'Nombre',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          )),
    );
  }

  Widget _textEmail() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListTile(
          leading: const Icon(
            Icons.email,
          ),
          title: Text(
            '${con.user.email ?? ''}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 21,
            ),
          ),
          subtitle: const Text(
            'Email',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          )),
    );
  }

  Widget _textPhone() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListTile(
          leading: const Icon(
            Icons.phone,
          ),
          title: Text(
            '${con.user.phoneNumber ?? ''}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 21,
            ),
          ),
          subtitle: const Text(
            'Teléfono',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          )),
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
