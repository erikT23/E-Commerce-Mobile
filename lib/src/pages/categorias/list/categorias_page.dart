import 'package:ecomerce_mobile/src/pages/categorias/list/categorias_controller.dart';
import 'package:ecomerce_mobile/src/pages/categorias/widgets/card_productos.dart';
import 'package:ecomerce_mobile/src/widgets/no_data_widget.dart';
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
              preferredSize: const Size.fromHeight(120),
              child: AppBar(
                flexibleSpace: Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.topCenter,
                  child: Wrap(
                    children: [
                      _textFielSerch(context),
                      _iconShoppingCart(),
                    ],
                  ),
                ),
                backgroundColor: Colors.black,
                bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.amber,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white.withOpacity(0.5),
                  overlayColor: MaterialStateProperty.all(Colors.amber),
                  tabs: controller.categories.asMap().entries.map((entry) {
                    int idx = entry.key;
                    var category = entry.value;
                    return Tab(
                      text: '${category['name']}',
                    );
                  }).toList(),
                ),
              ),
            ),
            body: TabBarView(
              children: controller.categories.map((category) {
                return GetBuilder<CategoriasController>(
                  init: controller,
                  builder: (_) {
                    // Carga los productos cuando cambia la categoría
                    controller.loadProducts(category: category['id']);
                    if (controller.products.isEmpty) {
                      return NoDataWidget(
                        text: 'No hay productos disponibles',
                      );
                    } else {
                      return ListView.builder(
                        itemCount: controller.products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () =>
                                controller.openButtomSheet(context, index),
                            child: CardProductos(
                                product: controller.products[index]),
                          );
                        },
                      );
                    }
                  },
                );
              }).toList(),
            )));
  }

  Widget _iconShoppingCart() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: IconButton(
          onPressed: () => controller.goToOrdersCreatePage(),
          icon: Icon(
            Icons.shopping_cart_outlined,
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget _textFielSerch(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextField(
          decoration: InputDecoration(
            hintText: "Buscar",
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(8),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
