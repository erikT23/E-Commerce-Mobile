import 'package:ecomerce_mobile/src/pages/orders/create/orders_create_controller.dart';
import 'package:ecomerce_mobile/src/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersCreatePage extends StatelessWidget {
  OrdersCreateController controller = Get.put(OrdersCreateController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        bottomNavigationBar: Container(
          height: 100,
          child: _totalToPay(),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Mi carrito',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: controller.selectedProducts.isNotEmpty
            ? ListView(
                children: controller.selectedProducts
                    .map((product) => _cardProduct(product))
                    .toList(),
              )
            : NoDataWidget(
                text: 'No hay productos seleccionados',
              )));
  }

  Widget _totalToPay() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(
                  height: 3,
                  color: Colors.grey[300],
                ),
                Text(
                  'Total a pagar: ${controller.total.value}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 60),
                  width: 170,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () => controller.goToAddressList(),
                      child: Text(
                        'Confirmar pedido',
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imgProduct(Map<String, dynamic> product) {
    String? imageUrl = product['Images'][0]['url'];
    return Container(
      margin: const EdgeInsets.all(10),
      child: imageUrl != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(
                  20), // Ajusta el radio del borde redondeado aquí
              child: Image.network(
                imageUrl,
                width: 100,
                height: 100,
              ),
            )
          : Container(),
    );
  }

  Widget _iconDelete(Map<String, dynamic> product) {
    return IconButton(
        onPressed: () => controller.deleteItem(product),
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
          size: 20,
        ));
  }

  Widget _textPrice(Map<String, dynamic> product) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        '\$${(product['price'] ?? 1) * (product['quantity'] ?? 0)}',
        style: const TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buttomsAddRemove(Map<String, dynamic> product) {
    return Row(children: [
      GestureDetector(
        onTap: () => controller.removeItem(product),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          child: Text(
            '-',
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
        color: Colors.grey[200],
        child: Text(
          '${product['quantity']}',
          style: const TextStyle(color: Colors.black),
        ),
      ),
      GestureDetector(
        onTap: () => controller.addItem(product),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Text(
            '+',
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    ]);
  }

  Widget _cardProduct(Map<String, dynamic> product) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            _imgProduct(product),
            Column(
              mainAxisSize: MainAxisSize
                  .min, // Hace que la Column se ajuste al tamaño de sus hijos
              children: [
                Flexible(
                  child: Text(
                    '${product['name']}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(child: _buttomsAddRemove(product)),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                _textPrice(product),
                _iconDelete(product),
              ],
            )
          ],
        ),
      ),
    );
  }
}
