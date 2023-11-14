import 'package:ecomerce_mobile/src/models/user.dart';
import 'package:ecomerce_mobile/src/pages/home/home_page.dart';
import 'package:ecomerce_mobile/src/pages/login/login_page.dart';
import 'package:ecomerce_mobile/src/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

User myUser = User.fromJson(GetStorage().read('user') ?? {});

void main() async {
  await GetStorage.init();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('myUser: ${myUser.id}');

    return GetMaterialApp(
      title: 'FastShop',
      debugShowCheckedModeBanner: false,
      initialRoute: myUser.id != null ? '/home' : '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/home', page: () => HomePage())
      ],
      theme: ThemeData(
          primaryColor: Colors.amber,
          colorScheme: const ColorScheme(
              primary: Colors.amber,
              secondary: Colors.amberAccent,
              brightness: Brightness.light,
              onBackground: Colors.grey,
              onPrimary: Colors.grey,
              surface: Colors.grey,
              onSurface: Colors.grey,
              error: Colors.red,
              onError: Colors.red,
              onSecondary: Colors.amber,
              background: Colors.white)),
      navigatorKey: Get.key,
    );
  }
}
