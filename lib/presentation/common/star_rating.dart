import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color color;
  final double size;

  StarRating({this.starCount = 5, this.rating = 0.0, this.color = Colors.amber, this.size = 20.0});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: color,
          size: size,
        );
      }),
    );
  }
}