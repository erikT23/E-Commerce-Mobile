import 'package:ecomerce_mobile/src/pages/categorias/categorias_controller.dart';
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
            return Container();
          }).toList(),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CategoriesScreen extends StatelessWidget {
//   final CategoriesController controller = Get.put(CategoriesController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Categorías'),
//       ),
//       body: Obx(() {
//         if (controller.categories.isEmpty) {
//           return Center(child: CircularProgressIndicator());
//         }
//         return ListView.builder(
//           itemCount: controller.categories.length,
//           itemBuilder: (context, index) {
//             var category = controller.categories[index];
//             return ListTile(
//               title: Text(category['name']), // Ajusta según la estructura de tu JSON
//               // Añadir más lógica según sea necesario
//             );
//           },
//         );
//       }),
//     );
//   }
// }
