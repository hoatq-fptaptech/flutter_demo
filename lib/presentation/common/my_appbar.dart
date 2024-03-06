import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/provider/appbar_provider.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatefulWidget{
  const MyAppBar({super.key});

  @override
  _MyAppBarState createState() => _MyAppBarState();
}
class _MyAppBarState extends State<MyAppBar>{
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: context.watch<AppBarProvider>().appBarHeight,
      floating: true,
      pinned: context.watch<AppBarProvider>().appBarPinned,
      stretch: true,
      shape: ShapeBorder.lerp(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100)),
          ),null,0
      ),
      backgroundColor: Colors.orange,
      flexibleSpace: const FlexibleSpaceBar(
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        // title: const Text("Collapsing Appbar",
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 16.0,
        //     )),

      ),
    );
  }

}