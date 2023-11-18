import 'package:ecomerce_mobile/src/pages/categorias/categorias_page.dart';
import 'package:ecomerce_mobile/src/pages/home/home_controller.dart';
import 'package:ecomerce_mobile/src/pages/inicio/inicio_page.dart';
import 'package:ecomerce_mobile/src/pages/perfil/perfil_page.dart';
import 'package:ecomerce_mobile/src/pages/wishlist/wishlist_page.dart';
import 'package:ecomerce_mobile/src/utils/custom_animated_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _bottomBar(),
        body: Obx(
          () => IndexedStack(
            index: homeController.indexTab.value,
            children: [
              InicioPage(),
              WishlistPage(),
              CategoriasPage(),
              PerfilPage(),
            ],
          ),
        ));
  }

  Widget _bottomBar() {
    return Obx(() => CustomAnimatedBottomBar(
          containerHeight: 70,
          backgroundColor: Colors.amber,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          selectedIndex: homeController.indexTab.value,
          onItemSelected: (index) => homeController.changeTab(index),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Inicio'),
              activeColor: Colors.white,
              inactiveColor: Colors.black,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Wishlist'),
              activeColor: Colors.white,
              inactiveColor: Colors.black,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Categorias'),
              activeColor: Colors.white,
              inactiveColor: Colors.black,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Perfil'),
              activeColor: Colors.white,
              inactiveColor: Colors.black,
            ),
          ],
        ));
  }
}
