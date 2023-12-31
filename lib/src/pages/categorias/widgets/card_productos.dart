import 'package:flutter/material.dart';

class CardProductos extends StatelessWidget {
  final dynamic product;

  const CardProductos({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 255, 255, 255),
      elevation: 2.0,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              product['name'],
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text('Precio: \$${product['price']}',
                style: const TextStyle(fontSize: 16.0, color: Colors.black)),
            const SizedBox(height: 10),
            product['Images'] != null && product['Images'].isNotEmpty
                ? Image.network(product['Images'][0]['url'], fit: BoxFit.cover)
                : const SizedBox(), // Mostrar una imagen o un placeholder
            // Añade más elementos a la tarjeta según sea necesario
          ],
        ),
      ),
    );
  }
}
