import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/constants.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: const Body(),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }

  AppBar MyAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/menu.svg'),
        onPressed: () {},
      ),
    );
  }
}

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 35,
            offset: const Offset(0, -10),
            color: kPrimaryColor.withOpacity(0.38))
      ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/flower.svg')),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/heart-icon.svg')),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/user-icon.svg')),
      ]),
    );
  }
}
