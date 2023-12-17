import 'package:ecomerce_mobile/src/environment/environment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesProviders extends GetConnect {
  //http://44.209.72.62:4000/apiEcomerce/1.0/categories?page=1&limit=9
  String url = Environment.API_URL + "categories";

  Future<Response> getCategories({int page = 1, int limit = 36}) async {
    final response = await get('$url?page=$page&limit=$limit');
    return response;
  }

  Future<Response> findProducts(queryParams) async {
    if (queryParams.isNotEmpty) {
      url += '?';
      queryParams.forEach((key, value) {
        url += '$key=$value&';
      });
    }
    final response = await get('$url?page=1&limit=9');
    return response;
  }
}



// class CategoriesProviders extends GetConnect {
//   String url = Environment.API_URL + "categories";

//   Future<Response> getCategories({int page = 1, int limit = 36}) async {
//     final response = await get('$url?page=$page&limit=$limit');
//     return response;
//   }

// Future<Response> findProducts({Map<String, dynamic> queryParams = const {}}) async {
//   String urlWithParams = url;
//   if (queryParams.isNotEmpty) {
//     urlWithParams += '?';
//     queryParams.forEach((key, value) {
//       urlWithParams += '$key=$value&';
//     });
//   }
//   urlWithParams += 'page=1&limit=9';
//   final response = await get(urlWithParams);
//   return response;
// }
// }

