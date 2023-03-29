import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FooterItems extends StatelessWidget {
  FooterItems({super.key, required this.imageName, required this.title});
  String title;
  String imageName;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imageName),
        Text(
          title,
          style: TextStyle(
            fontSize: width <= 320.0 ? 12 : 15,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
