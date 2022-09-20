import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/constants.dart';

class Body extends StatelessWidget {
  const Body(
      {super.key,
      required this.image,
      required this.country,
      required this.title,
      required this.price});

  final String image, country, title;
  final int price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    showBuyingMessage() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Buying is not supported now!'),
        ),
      );
    }

    return Stack(
      children: [
        Column(
          children: [
            // image + sizebar
            ImageAndSideBar(
              image: image,
              title: title,
            ),

            // details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleAndPrice(
                    country: country,
                    title: title,
                    price: price,
                  ),

                  const SizedBox(height: 8),

                  // buttons
                  ButtomActions(
                    onBuy: showBuyingMessage,
                    onDescriptionPress: () {},
                  )
                ],
              ),
            ),
          ],
        ),

        // top actions
        const TopBarActions(),
      ],
    );
  }
}

class ButtomActions extends StatelessWidget {
  const ButtomActions({
    Key? key,
    required this.onBuy,
    required this.onDescriptionPress,
  }) : super(key: key);

  final VoidCallback onBuy;
  final VoidCallback onDescriptionPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: SizedBox(
              height: 84,
              child: ElevatedButton(
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  backgroundColor: MaterialStatePropertyAll(kPrimaryColor),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                onPressed: onBuy,
                child: const Text(
                  'Buy now',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 84,
              child: ElevatedButton(
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.transparent,
                  ),
                ),
                onPressed: onDescriptionPress,
                child: const Text(
                  'Description',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageAndSideBar extends StatelessWidget {
  const ImageAndSideBar({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image, title;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.8,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding * 3,
                  horizontal: kDefaultPadding / 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(
                          height: 30,
                        ),
                        IconCard(icon: 'assets/icons/sun.svg'),
                        IconCard(icon: 'assets/icons/icon_2.svg'),
                        IconCard(icon: 'assets/icons/icon_3.svg'),
                        IconCard(icon: 'assets/icons/icon_4.svg'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Hero(
            tag: title,
            child: Container(
              height: size.height * 0.8,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(63),
                  bottomLeft: Radius.circular(63),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 60,
                    color: kPrimaryColor.withOpacity(0.29),
                  )
                ],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopBarActions extends StatelessWidget {
  const TopBarActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: SvgPicture.asset(
                  'assets/icons/back_arrow.svg',
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.more_horiz),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key? key,
    required this.title,
    required this.country,
    required this.price,
  }) : super(key: key);

  final String title, country;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title\n",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextSpan(
                  text: ' $country',
                  style: const TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          ),
          Text(
            '\$$price',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: kPrimaryColor),
          ),
        ],
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  final String icon;
  const IconCard({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: 62,
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 15),
            blurRadius: 22,
            color: kPrimaryColor.withOpacity(0.22),
          ),
          const BoxShadow(
            offset: Offset(-15, -15),
            blurRadius: 20,
            color: Colors.white,
          ),
        ],
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
