import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/entity/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(category.thumbnail,height: 100,width: 100,),
        SizedBox(height: 8.0),
        Text(category.name),
      ],
    );
  }
}