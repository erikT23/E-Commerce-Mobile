import 'dart:convert';
import 'dart:io';
import 'package:ecomerce_mobile/src/environment/environment.dart';
import 'package:ecomerce_mobile/src/models/response_api.dart';
import 'package:ecomerce_mobile/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class UsersProviders extends GetConnect {
  String url = Environment.API_URL + "auth";
  String urlUpdate = Environment.API_URL;
  User? currentUser;

  UsersProviders() {
    var userData = GetStorage().read('user');
    if (userData != null) {
      currentUser = User.fromJson(userData);
    }
  }

  Future<Response> create(User user) async {
    var payload = {'user': user.toJson(), 'role': 3};

    Response response = await post('$url/register', payload, headers: {
      'Content-Type': 'application/json',
    });
    return response;
  }

  Future<ResponseApi> update(User user) async {
    User currentUser = User.fromJson(GetStorage().read('user'));
    Response response =
        await put('${urlUpdate}users/${user.id}', user.toJson(), headers: {
      'Content-Type': 'application/json',
      'Authorization': currentUser.token ?? '',
    });
    print('Current user token: ${currentUser.token}');
    print('Current user ${currentUser.id}');

    print('Usuario: ${user.id}');

    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.bodyString}");

    if (response.body == null) {
      Get.snackbar('Error', 'no se pudo realizar la petición',
          colorText: Colors.white, backgroundColor: Colors.red);
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }

  Future<Stream> createWidthImage(User user, File image) async {
    Uri uri = Uri.http(Environment.API_URL_OLD, '/users/image/${user.id}}');
    final request = http.MultipartRequest('PATCH', uri);
    request.files.add(http.MultipartFile('imageFile',
        http.ByteStream(image.openRead().cast()), await image.length(),
        filename: basename(image.path)));
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
