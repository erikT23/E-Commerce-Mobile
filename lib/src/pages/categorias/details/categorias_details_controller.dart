import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CategoriasDetailsController extends GetxController {
  dynamic product;

  var counter = 0.obs;
  var price = 0.0.obs;

  List<dynamic> selectedProducts = [];

  CategoriasDetailsController() {
    
  }

  void checkProduct(product, var price, var counter) {
    price.value = ((product['price'] as num).toDouble() * counter.value) ?? 0.0;

    
    selectedProducts = GetStorage().read('cart') ?? [];

    int index = selectedProducts.indexWhere((p) => p['id'] == product['id']);

    if (index != -1) {
      counter.value = selectedProducts[index]['quantity'] ?? 1;
      price.value =
          ((product['price'] as num).toDouble() * counter.value) ?? 0.0;
      selectedProducts.forEach((element) {
        print('Productos : $element');
      });
    }
  }

  void addToCart(product, var price, var counter) {
    if (counter.value > 0) {
      int index = selectedProducts.indexWhere((p) => p['id'] == product['id']);

      if (index == -1) {

        if (product.containsKey('quantity')) {
          product['quantity'] = 1;
        }
        selectedProducts.add(product);
      } else {
        selectedProducts[index]['quantity'] = counter.value;
      }
      GetStorage().write('cart', selectedProducts);

      Fluttertoast.showToast(
          msg: "Producto agregado al carrito",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.amber,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "No se puede agregar 0 productos",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void addItem(product, var price, var counter) {
    counter.value++;
    price.value = ((product['price'] as num).toDouble() * counter.value) ?? 0.0;
  }

  void removeItem(product, var price, var counter) {
    if (counter.value > 1) {
      counter.value--;
      price.value =
          ((product['price'] as num).toDouble() * counter.value) ?? 0.0;
    }
  }
}
