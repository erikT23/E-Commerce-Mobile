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
}
