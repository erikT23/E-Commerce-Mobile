import 'package:ecomerce_mobile/src/models/address.dart';
import 'package:ecomerce_mobile/src/pages/address/list/address_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressListPage extends StatefulWidget {
  @override
  _AddressListPageState createState() => _AddressListPageState();
}

class _AddressListPageState extends State<AddressListPage> {
  AddressListController controller = Get.put(AddressListController());
  String? _selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Mis direcciones',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          _iconAddressCreate(),
        ],
      ),
      body: Column(
        children: [
          _textSelectAddress(),
          _listAddress(),
        ],
      ),
    );
  }

  Widget _listAddress() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          RadioListTile<String>(
            title: const Text('Av. Universidad 1801, UTEZ'),
            subtitle: const Text('Emiliano Zapata'),
            value: 'utez',
            groupValue: _selectedAddress,
            onChanged: (value) {
              setState(() {
                _selectedAddress = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Arcos de Xiutepec 1, Camelia'),
            subtitle: const Text('Jiutepec'),
            value: 'casa',
            groupValue: _selectedAddress,
            onChanged: (value) {
              setState(() {
                _selectedAddress = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _radioSelectorAddress(Address address, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Radio(
                value: index,
                groupValue: controller.radioValue.value,
                onChanged: controller.handleRadioValueChange,
              ),
              Column(
                children: [
                  Text(
                    address.address ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    address.neighborhood ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
          Divider(
            color: Colors.grey[400],
          )
        ],
      ),
    );
  }

  Widget _textSelectAddress() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        'Selecciona una dirección',
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
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
