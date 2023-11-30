import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _carousel()),
    );
  }
}

Widget _carousel() {
  List<String> imagePaths = [
    'assets/img/producto1.jpg',
    'assets/img/producto2.jpg',
    'assets/img/producto3.jpg',
  ];

  return FlutterCarousel(
    options: CarouselOptions(
      height: 150.0,
      showIndicator: true,
      autoPlay: true,
      slideIndicator: CircularSlideIndicator(),
    ),
    items: imagePaths.map((path) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(color: Colors.white),
            child: Image.asset(
              path,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
          );
        },
      );
    }).toList(),
  );
}

