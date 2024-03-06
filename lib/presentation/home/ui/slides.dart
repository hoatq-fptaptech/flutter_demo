import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Slides extends StatefulWidget{
  const Slides({Key? key}) : super(key: key);

  @override
  _SlidesState createState() => _SlidesState();
}
class _SlidesState extends State<Slides>{
  final List<String> images = [
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 16 / 9,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          height: 300,
        ),
        items: images.map((item) => Image.network(item)).toList(),
    );
  }
}