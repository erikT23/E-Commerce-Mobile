import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OrdersCreateController extends GetxController {
  List<dynamic> selectedProducts = [].obs;
  var total = 0.0.obs;

  OrdersCreateController() {
    if (GetStorage().read('cart') != null) {
      if (GetStorage().read('cart') is List) {
        var result = GetStorage().read('cart') ?? [];
        selectedProducts.clear();
        selectedProducts.addAll(result);
      } else {
        var result = GetStorage().read('cart') ?? [];
        selectedProducts.clear();
        selectedProducts.addAll(result);
      }
      getTotal();
    }
  }

  void getTotal() {
    total.value = 0.0;
    selectedProducts.forEach((product) {
      total.value = total.value + (product['price'] * product['quantity']);
    });
  }

  void deleteItem(Map<String, dynamic> product) {
    selectedProducts.remove(product);
    GetStorage().write('cart', selectedProducts);
    getTotal();
  }

  void addItem(Map<String, dynamic> product) {
    int index = selectedProducts.indexWhere((p) => p['id'] == product['id']);

    selectedProducts.remove(product);
    product['quantity'] = product['quantity'] + 1;
    selectedProducts.insert(index, product);
    GetStorage().write('cart', selectedProducts);
    getTotal();
  }

  void removeItem(Map<String, dynamic> product) {
    if (product['quantity'] > 1) {
      int index = selectedProducts.indexWhere((p) => p['id'] == product['id']);

      selectedProducts.remove(product);
      product['quantity'] = product['quantity'] - 1;
      selectedProducts.insert(index, product);
      GetStorage().write('cart', selectedProducts);
      getTotal();
    } else {
      Fluttertoast.showToast(
          msg: "No se puede eliminar el producto",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.amber,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
