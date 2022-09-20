import 'package:flutter/material.dart';

import 'featured_plants_section.dart';
import 'header_with_more_btn.dart';
import 'header_with_searchbox.dart';
import 'recommended_plant_section.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String name = 'John';

    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(name: name),
          HeaderwithMoreBtn(
            title: 'Recomended',
            onMoreBtnPress: () {},
          ),
          const RecommendedPlantsSection(),
          HeaderwithMoreBtn(title: 'Featured Plants', onMoreBtnPress: () {}),
          const FeaturedPlantsSection(),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
