import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Carousel(
      boxFit: BoxFit.fill,
      images:const <AssetImage>[
        AssetImage('images/shoe1.png'),
        AssetImage('images/shoe2.png'),
        AssetImage('images/shoe3.png'),
        AssetImage('images/shoe4.png'),
      ],
    );
  }
}