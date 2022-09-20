import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class FeaturedPlantCard extends StatelessWidget {
  final String image;
  const FeaturedPlantCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding / 20,
      ),
      width: size.width * 0.8,
      height: 185,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
        ),
      ),
    );
  }
}
