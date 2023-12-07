import 'package:ecomerce_mobile/src/environment/environment.dart';
import 'package:get/get.dart';

class ProductsProvider extends GetConnect {
  String url = Environment.API_URL + "products";

  // Método para obtener los productos
  Future<Response> getProducts(Map<String, dynamic> queryParams,
      {int page = 1, int limit = 9}) async {
    if (queryParams.isNotEmpty) {
      url += '?';
      queryParams.forEach((key, value) {
        url += '$key=$value&';
      });
    }
    final response = await get('$url?page=$page&limit=$limit$url');
    return response;
  }

  Future<Response> findProducts({
    String? query,
    int? category,
    int page = 1,
    int limit = 9,
  }) async {
    final response =
        await get('$url/search/$query/$category?page=$page&limit=$limit');
    return response;
  }
}
