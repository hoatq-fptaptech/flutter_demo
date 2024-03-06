import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/model/entity/product.dart';
import 'package:flutter_demo/presentation/common/star_rating.dart';

class PopularItem extends StatelessWidget{
  final Product product;
  const PopularItem({super.key, required this.product});

  Color getRandomElement(int index) {
    final List<Color> colors = [
      const Color(0xFFC5EFD1),
      const Color(0xFFE7E0B6),
      const Color(0xFFFAD6DC),
    ];
    return colors[index];
  }

  @override
  Widget build(BuildContext context) {
      final color = getRandomElement(product.id!= null? product.id! % 3:0);
      return Container(
        // height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0.0),
        decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(10.0),
            color: color
        ),
        padding: const EdgeInsets.all(12),
        child: Container(
          color: color,
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(product.thumbnail??""),
                    ))),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title??"",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text("${product.description??""}",
                          style: Theme.of(context).textTheme.caption),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          StarRating(
                            starCount: 5,
                            rating: product.rating??0.0,
                            color: Colors.orange,
                            size: 20.0,
                          ),
                        ],
                      ),
                      Text('\$${product.price}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                      ),)
                    ],
                  )),
            ],
            ),
        ),
      );
  }
}