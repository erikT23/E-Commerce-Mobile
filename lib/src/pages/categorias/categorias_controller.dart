import 'package:ecomerce_mobile/src/providers/categories_providers.dart';
import 'package:ecomerce_mobile/src/providers/products_provider.dart';
import 'package:get/get.dart';

class CategoriasController extends GetxController {
  final CategoriesProviders categoriesProvider = CategoriesProviders();
  final ProductsProvider productsProvider = ProductsProvider();
  final RxList<dynamic> categories = RxList<dynamic>();

 void loadCategories() async {
  Response response = await categoriesProvider.getCategories();
  if (response.statusCode == 200) {
    var responseData = response.body['data'];
    if (responseData != null && responseData is Map && responseData['categories'] is List) {
      categories.value = responseData['categories'];
    } else {
      print('Error: La estructura de la respuesta no es la esperada');
    }
  } else {
    print('Error al obtener categorías: ${response.statusCode}');
  }
}

  @override
  void onInit() {
    super.onInit();
    loadCategories(); 
    loadProducts();
  }

  final RxList<dynamic> products = RxList<dynamic>();

  void loadProducts() async {
    Response response = await productsProvider.getProducts();
    if (response.statusCode == 200) {
      var responseData = response.body['data'];
      if (responseData != null && responseData is Map && responseData['products'] is List) {
        products.value = responseData['products'];
      } else {
        print('Error: La estructura de la respuesta no es la esperada');
      }
    } else {
      print('Error al obtener productos: ${response.statusCode}');
    }
  }

}
