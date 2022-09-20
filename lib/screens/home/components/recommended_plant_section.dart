import 'package:flutter/material.dart';
import 'package:plant_app/screens/plant_details/plant_details_screen.dart';

import 'recomemded_plant_card.dart';

class RecommendedPlantsSection extends StatelessWidget {
  const RecommendedPlantsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List plants = [
      {
        'title': 'Samatha',
        'country': 'Russia',
        'image': 'assets/images/image_1.png',
        'price': 440,
      },
      {
        'title': 'Angelica',
        'country': 'Russia',
        'image': 'assets/images/image_2.png',
        'price': 440,
      },
      {
        'title': 'Ishaya',
        'country': 'USA',
        'image': 'assets/images/image_3.png',
        'price': 440,
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...plants.map(
            (plant) => RecomendedPlantCard(
              country: plant['country'],
              image: plant['image'],
              price: plant['price'],
              title: plant['title'],
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => PlantDetailScreen(
                          country: plant['country'],
                          image: plant['image'],
                          price: plant['price'],
                          title: plant['title'],
                        )));
              },
            ),
          )
        ],
      ),
    );
  }
}
