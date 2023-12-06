import 'package:ecomerce_mobile/src/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController{

  var indexTab = 0.obs;
  void changeTab(int index){
    indexTab.value = index;
  }



  User user = User.fromJson(GetStorage().read('user')?? {});


  HomeController(){
    print('Usuario de sesión: ${user.toJson()}');
    print('token de sesión: ${user.token}');
  }


  void logOut(){
    GetStorage().remove('user');
    Get.offNamedUntil('/', (route) => false);
  }
}