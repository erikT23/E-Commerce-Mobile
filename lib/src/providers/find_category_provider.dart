import 'package:ecomerce_mobile/src/environment/environment.dart';
import 'package:get/get.dart';

class ProductsProvider extends GetConnect {
  String url = Environment.API_URL + "products";

  // Método para obtener los productos
  Future<Response> getProducts({int page = 1, int limit = 9}) async {
    final response = await get('$url?page=$page&limit=$limit');
    return response;
  }
}