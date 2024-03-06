import 'package:flutter/material.dart';
import 'package:flutter_demo/model/entity/category.dart';
import 'package:flutter_demo/presentation/home/ui/category_item.dart';

class Categories extends StatefulWidget{
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}
class _CategoriesState extends State<Categories>{
  final List<Category> categories = [
    Category(
      id: 1,
      name: 'Technology',
      thumbnail: 'https://via.placeholder.com/150',
    ),
    Category(
      id: 2,
      name: 'Science',
      thumbnail: 'https://via.placeholder.com/150',
    ),
    Category(
      id: 3,
      name: 'Art',
      thumbnail: 'https://via.placeholder.com/150',
    ),
    Category(
      id: 4,
      name: 'Diamond',
      thumbnail: 'https://via.placeholder.com/150',
    ),
    Category(
      id: 5,
      name: 'Clothes',
      thumbnail: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left:10),
          child: const Text("Categories",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: CategoryItem(category: categories[index]),
              );
            },
          ),
        )
      ],
    );
  }
}