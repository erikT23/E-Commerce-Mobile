import 'package:flutter/material.dart';

class CardProductos extends StatelessWidget {
  final dynamic product; 

  CardProductos({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              product['name'],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('Precio: ${product['price']}'),
            SizedBox(height: 10),
            product['Images'] != null && product['Images'].isNotEmpty
                ? Image.network(product['Images'][0]['url'], fit: BoxFit.cover)
                : SizedBox(), // Mostrar una imagen o un placeholder
            // Añade más elementos a la tarjeta según sea necesario
          ],
        ),
      ),
    );
  }
}
