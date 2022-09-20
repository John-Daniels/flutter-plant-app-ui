import 'package:flutter/material.dart';
import './components/body.dart';

class PlantDetailScreen extends StatelessWidget {
  const PlantDetailScreen(
      {super.key,
      required this.image,
      required this.country,
      required this.title,
      required this.price});

  final String image, country, title;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        country: country,
        image: image,
        price: price,
        title: title,
      ),
    );
  }
}
