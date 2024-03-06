import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/common/my_appbar.dart';
import 'package:flutter_demo/presentation/home/ui/categories.dart';
import 'package:flutter_demo/presentation/home/ui/popular.dart';
import 'package:flutter_demo/presentation/home/ui/search.dart';
import 'package:flutter_demo/presentation/home/ui/slides.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          MyAppBar(),
        ];
      },
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Slides(),
            SearchBox(),
            Categories(),
            Popular()
          ],
        ),
      ),
    );
  }
}