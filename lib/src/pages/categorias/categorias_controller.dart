import 'package:ecomerce_mobile/src/providers/categories_providers.dart';
import 'package:get/get.dart';

class CategoriasController extends GetxController {
  final CategoriesProviders categoriesProvider = CategoriesProviders();

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
    loadCategories(); // Carga inicial de categorías
  }
}
