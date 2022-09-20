import 'package:flutter/material.dart';

import 'featured_plant_card.dart';

class FeaturedPlantsSection extends StatelessWidget {
  const FeaturedPlantsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          FeaturedPlantCard(image: 'assets/images/bottom_img_1.png'),
          FeaturedPlantCard(image: 'assets/images/bottom_img_1.png'),
          FeaturedPlantCard(image: 'assets/images/bottom_img_1.png'),
          FeaturedPlantCard(image: 'assets/images/bottom_img_1.png'),
          FeaturedPlantCard(image: 'assets/images/bottom_img_1.png'),
        ],
      ),
    );
  }
}
