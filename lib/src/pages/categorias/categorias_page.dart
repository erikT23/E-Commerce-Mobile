import 'package:ecomerce_mobile/src/pages/categorias/categorias_controller.dart';
import 'package:ecomerce_mobile/src/pages/categorias/widgets/card_productos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriasPage extends StatelessWidget {
  final CategoriasController controller = Get.put(CategoriasController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.categories.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.amber,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              tabs: controller.categories.map((category) {
                return Tab(
                  text: category['name'],
                );
              }).toList(),
            ),
          ),
        ),
        body: TabBarView(
          children: controller.categories.map((category) {
            return ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (BuildContext context, int index) {
                return CardProductos(product: controller.products[index]);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
