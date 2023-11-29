import 'package:ecomerce_mobile/src/models/user.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class PerfilInfoController extends GetxController {
  
  User user = User.fromJson(GetStorage().read('user'));
}
