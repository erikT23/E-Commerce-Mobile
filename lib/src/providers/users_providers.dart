import 'package:ecomerce_mobile/src/environment/environment.dart';
import 'package:ecomerce_mobile/src/models/user.dart';
import 'package:get/get.dart';

class UsersProviders extends GetConnect {
  String url = Environment.API_URL + "auth/register";

  Future<Response> create(User user) async {
    var payload = {
      'user': user.toJson(),
      'role': 3  // Cambia esto según la lógica de tu aplicación
    };

    Response response = await post(url, payload, headers: {
      'Content-Type': 'application/json',
    });
    return response;
  }
}
