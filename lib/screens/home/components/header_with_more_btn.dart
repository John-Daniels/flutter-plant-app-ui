import 'package:flutter/material.dart';
import '../../../constants.dart';

class HeaderwithMoreBtn extends StatelessWidget {
  final String title;
  final VoidCallback onMoreBtnPress;

  const HeaderwithMoreBtn({
    Key? key,
    required this.title,
    required this.onMoreBtnPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          UnderlinedTitle(
            title: title,
          ),
          const Spacer(),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(kPrimaryColor),
            ),
            onPressed: onMoreBtnPress,
            child: const Text('more'),
          )
        ],
      ),
    );
  }
}

class UnderlinedTitle extends StatelessWidget {
  final String title;
  const UnderlinedTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(right: kDefaultPadding / 4),
              height: 7,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
