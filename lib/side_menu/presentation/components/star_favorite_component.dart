import 'package:flutter/material.dart';

class StarFavorite extends StatelessWidget {
  bool isFavorite;
  StarFavorite({super.key, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return isFavorite
        ? const Icon(
            Icons.star,
            color: Colors.red,
            size: 20,
          )
        : const Icon(
            Icons.star_border,
            color: Colors.black,
            size: 20,
            weight: 20,
          );
  }
}
