import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LeadingImage extends StatelessWidget {
  String image;
  LeadingImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/${image}.svg',
      width: 35,
      colorFilter: const ColorFilter.mode(
        Colors.red,
        BlendMode.srcIn,
      ),
    );
  }
}
