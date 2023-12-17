import 'package:ecomerce_mobile/src/pages/categorias/details/categorias_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';

class CategoriasDetailsPage extends StatelessWidget {
  final dynamic product;
  final CategoriasDetailsController controller;
  var counter = 0.obs;
  var price = 0.0.obs;

  CategoriasDetailsPage({@required this.product})
      : controller = Get.put(CategoriasDetailsController());

  @override
  Widget build(BuildContext context) {

    controller.checkProduct(product, price, counter);
    return Obx(() => Scaffold(
            body: Column(
          children: [
            _carrousel(),
            Row(
              children: [
                _textNameProduct(),
                const Spacer(),
                _textPriceProduct(),
              ],
            ),
            _textDescriptionProduct(),
            _buttonAddCart(),
          ],
        )));
  }

  Widget _textNameProduct() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 20, top: 20),
      child: Text(
        '${product['name']}',
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
      ),
    );
  }

  Widget _textDescriptionProduct() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 20, top: 10),
      child: Text(
        '${product['description']}',
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  Widget _textPriceProduct() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 20, right: 30),
      child: Text(
        '\$${product['price']}',
        style: const TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buttonAddCart() {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () => controller.removeItem(product, price, counter),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
            ),
            child: const Text(
              '-',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                // Añade esta línea
                borderRadius: BorderRadius.zero, // Añade esta línea
              ), // Añade esta línea
              backgroundColor: Colors.white,
              minimumSize: const Size(40, 37),
            ),
            child: Text(
              '${counter.value}',
              style: const TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),
          ElevatedButton(
            onPressed: () => controller.addItem(product, price, counter),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
            ),
            child: const Text(
              '+',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () => controller.addToCart(product,  price,  counter),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Text(
                  '\$${price.value}',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _carrousel() {
    var image = product['Images'][0]['url'];
    return SafeArea(
      child: Stack(
        children: [
          ImageSlideshow(width: 300, height: 250, children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 20), // Ajusta el valor para cambiar el margen superior
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  fadeInDuration: const Duration(milliseconds: 50),
                  placeholder: const AssetImage('assets/img/no-data.png'),
                  image: image != null
                      ? NetworkImage(image)
                      : const AssetImage('assets/img/no-data.png')
                          as ImageProvider,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 20), // Ajusta el valor para cambiar el margen superior
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  fadeInDuration: const Duration(milliseconds: 50),
                  placeholder: const AssetImage('assets/img/no-data.png'),
                  image: image != null
                      ? NetworkImage(image)
                      : const AssetImage('assets/img/no-data.png')
                          as ImageProvider,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 20), // Ajusta el valor para cambiar el margen superior
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  fadeInDuration: const Duration(milliseconds: 50),
                  placeholder: const AssetImage('assets/img/no-data.png'),
                  image: image != null
                      ? NetworkImage(image)
                      : const AssetImage('assets/img/no-data.png')
                          as ImageProvider,
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
