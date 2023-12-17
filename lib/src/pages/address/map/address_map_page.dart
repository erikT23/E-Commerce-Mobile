import 'package:ecomerce_mobile/src/pages/address/map/address_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressMapPage extends StatelessWidget {
  AddressMapController controller = Get.put(AddressMapController());
  @override
  Widget build(BuildContext context) {
    return Obx(() =>Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.amber,
        title: const Text(
          'Tu punto de referencia',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          _googleMaps(),
          _iconMyLocation(),
          _cardAddres(),
          _buttonAceptar(context),
          // Positioned(
          //   bottom: 20,
          //   right: 20,
          //   child: FloatingActionButton(
          //     onPressed: () {
          //       Get.back(result: controller.initialPosition.target);
          //     },
          //     child: const Icon(Icons.check),
          //   ),
          // ),
        ],
      ),
    )
    );
  }

  Widget _buttonAceptar(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          controller.selectRefPoint(context);
        },
        child: const Text(
          'Aceptar',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _cardAddres() {
    return Container(
      width: double.infinity,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
      child: Card(
        color: Colors.grey[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            controller.addressName.value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconMyLocation() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/img/pin.png',
        width: 50,
        height: 50,
      ),
    );
  }

  Widget _googleMaps() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: controller.initialPosition,
      onMapCreated: controller.onMapCreated,
      myLocationButtonEnabled: false,
      myLocationEnabled: false,
      onCameraMove: (position) {
        controller.initialPosition = position;
      },
      onCameraIdle: () async {
        await controller.setLocationDraggableMarker();
      },
    );
  }
}
