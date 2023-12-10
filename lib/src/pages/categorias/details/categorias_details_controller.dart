import 'package:ecomerce_mobile/src/pages/categorias/list/categorias_controller.dart';
import 'package:get/get.dart';

class CategoriasDetailsController extends GetxController {
  dynamic product;

  var counter = 1.obs;
  var price = 0.0.obs;

  CategoriasDetailsController(this.product) {
    price.value = ((product['price'] as num).toDouble() * counter.value) ?? 0.0;  }

  void addItem() {
    counter.value++;
    price.value = ((product['price'] as num).toDouble() * counter.value) ?? 0.0;  }

  void removeItem() {
    if (counter.value > 1) {
      counter.value--;
      price.value = ((product['price'] as num).toDouble() * counter.value) ?? 0.0;    }
  }
}
