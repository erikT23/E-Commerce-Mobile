import 'dart:convert';
import 'dart:io';
import 'package:ecomerce_mobile/src/environment/environment.dart';
import 'package:ecomerce_mobile/src/models/response_api.dart';
import 'package:ecomerce_mobile/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class UsersProviders extends GetConnect {
  String url = Environment.API_URL + "auth";

  Future<Response> create(User user) async {
    var payload = {
      'user': user.toJson(),
      'role': 3 // Cambia esto según la lógica de tu aplicación
    };

    Response response = await post('$url/register', payload, headers: {
      'Content-Type': 'application/json',
    });
    return response;
  }

  Future<Stream> createWidthImage(User user, File image) async {
    Uri uri = Uri.http(Environment.API_URL_OLD, '/users/image/${user.id}}');
    final request = http.MultipartRequest('PATCH', uri);
    request.files.add(http.MultipartFile(
      'imageFile',
      http.ByteStream(image.openRead().cast()),
      await image.length(),
      filename: basename(image.path)
    ));
    request.fields['imageFile'] = json.encode(user);
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }

  Future<ResponseApi> login(String email, String password) async {
    Response response = await post('$url/login', {
      'email': email,
      'password': password,
    }, headers: {
      'Content-Type': 'application/json',
    });
    if (response.body == null) {
      Get.snackbar('Error', 'no se pudo realizar la petición',
          colorText: Colors.white, backgroundColor: Colors.red);
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }
}
