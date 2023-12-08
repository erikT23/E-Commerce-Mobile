import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart' as getx;

class ProductsProvider {
  Future<getx.Response> findProducts({String search = '', int page = 1, int limit = 9, int? category}) async {
    final String host = '44.209.72.62:4000';
    final String path = '/apiEcomerce/1.0/products/search';

    Map<String, dynamic> queryParams = {
      'search': search,
      'page': page.toString(),
      'limit': limit.toString(),
      // Add category to queryParams if it's not null
      if (category != null) 'category': category.toString(),
    };

    final uri = Uri.http(host, path, queryParams);
    final http.Response httpResponse = await http.get(uri);

    if (httpResponse.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      final body = jsonDecode(httpResponse.body);
      return getx.Response(statusCode: httpResponse.statusCode, body: body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load products');
    }
  }
}