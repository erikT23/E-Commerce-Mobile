import 'package:ecomerce_mobile/src/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController{
  User user = User.fromJson(GetStorage().read('user')?? {});

  HomeController(){
    print('Usuario de sesión: ${user.toJson()}');
  }


  void LogOut(){
    GetStorage().remove('user');
    Get.offNamedUntil('/', (route) => false);
  }
}