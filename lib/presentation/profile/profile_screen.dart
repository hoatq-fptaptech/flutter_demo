import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/screen_type.dart';

class ProfileScreen extends StatefulWidget{
  final PageController controller;
  final Function(int) updateSelectedIndex;
  const ProfileScreen({required this.controller,
        required this.updateSelectedIndex});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("Profile"),
          ),
          Center(
            child: ElevatedButton(
              child: Text("Click Me to Home"),
              onPressed: (){
                 widget.controller.animateToPage(ScreenType.HOME.index,
                     duration: Duration(milliseconds: 300), curve: Curves.easeInSine);
                 widget.updateSelectedIndex(ScreenType.HOME.index);
              },
            ),
          )
        ],
      )
    );
  }
}