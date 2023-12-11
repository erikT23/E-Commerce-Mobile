import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OrdersCreateController extends GetxController {
  List<dynamic> selectedProducts = [];
  var counter = 0.obs;

  OrdersCreateController() {
    selectedProducts = GetStorage().read('cart') ?? [];
  }
}
