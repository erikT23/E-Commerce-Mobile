import 'package:ecomerce_mobile/src/pages/categorias/details/categorias_details_page.dart';
import 'package:ecomerce_mobile/src/providers/categories_providers.dart';
import 'package:ecomerce_mobile/src/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CategoriasController extends GetxController {
  final CategoriesProviders categoriesProvider = CategoriesProviders();
  final ProductsProvider productsProvider = ProductsProvider();
  final RxList<dynamic> categories = RxList<dynamic>();

  void loadCategories() async {
    Response response = await categoriesProvider.getCategories();
    if (response.statusCode == 200) {
      var responseData = response.body['data'];
      if (responseData != null &&
          responseData is Map &&
          responseData['categories'] is List) {
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
    loadProducts(category: 1);
  }

  final RxList<dynamic> products = RxList<dynamic>();
  final RxList<dynamic> productsByCategory = RxList<dynamic>();

  Future<void> loadProducts({int? category}) async {
    try {
      Response response =
          (await productsProvider.findProducts(category: category)) as Response;
      if (response.statusCode == 200) {
        var responseData = response.body['data'];
        if (responseData != null && responseData['products'] is List) {
          // Actualiza la lista de productos
          products.value = List.from(responseData['products']);
          print('Loaded ${products.length} products');
        } else {
          print('Error: La estructura de la respuesta no es la esperada');
        }
      } else {
        print('Error al obtener productos: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al realizar la solicitud: $e');
    }
  }

  Future<void> openButtomSheet(BuildContext context, int index) async {
    await loadProducts();
    print('Number of products: ${products.length}');
    if (index >= 0 && index < products.length) {
      showModalBottomSheet(
        context: context,
        builder: (context) => CategoriasDetailsPage(product: products[index]),
      );
    } else {
      print('Error: Invalid product index: $index');
    }
  }

  void goToOrdersCreatePage() {
    Get.toNamed('/orders/create');
  }
}


// class CategoriasController extends GetxController {
//   int? selectedCategory;
//   final CategoriesProviders categoriesProvider = CategoriesProviders();
//   final ProductsProvider productsProvider = ProductsProvider();
//   final RxList<dynamic> categories = RxList<dynamic>();

//   void loadCategories() async {
//     Response response = await categoriesProvider.getCategories();
//     if (response.statusCode == 200) {
//       var responseData = response.body['data'];
//       if (responseData != null &&
//           responseData is Map &&
//           responseData['categories'] is List) {
//         categories.value = responseData['categories'];
//       } else {
//         print('Error: La estructura de la respuesta no es la esperada');
//       }
//     } else {
//       print('Error al obtener categorías: ${response.statusCode}');
//     }
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     loadCategories();
//     loadProducts(category: 1);
//   }

//   final RxList<dynamic> products = RxList<dynamic>();
//   final RxList<dynamic> productsByCategory = RxList<dynamic>();

//   Future<void> loadProducts({int? category}) async {
//     selectedCategory = category;
//     try {
//       var response = await productsProvider.findProducts(queryParams: {'category': selectedCategory});
//       if (response.statusCode == 200) {
//         var responseData = response.body['data'];
//         if (responseData != null && responseData['products'] is List) {
//           // Actualiza la lista de productos
//           products.value = List.from(responseData['products']);
//           print('Loaded ${products.length} products');
//         } else {
//           print('Error: La estructura de la respuesta no es la esperada');
//         }
//       } else {
//         print('Error al obtener productos: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error al realizar la solicitud: $e');
//     }
//   }

//   Future<void> openButtomSheet(BuildContext context, int index) async {
//     await loadProducts(category: index);
//     print('Number of products: ${products.length}');
//     if (index >= 0 && index < products.length) {
//       showModalBottomSheet(
//         context: context,
//         builder: (context) => CategoriasDetailsPage(product: products[index]),
//       );
//     } else {
//       print('Error: Invalid product index: $index');
//     }
//   }

//   void goToOrdersCreatePage() {
//     Get.toNamed('/orders/create');
//   }
// }
