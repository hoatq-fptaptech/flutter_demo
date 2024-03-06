import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/bookmark/bookmark_screen.dart';
import 'package:flutter_demo/presentation/game/game_screen.dart';
import 'package:flutter_demo/presentation/screen_type.dart';
import 'package:flutter_demo/presentation/home/home_screen.dart';
import 'package:flutter_demo/presentation/profile/profile_screen.dart';
import 'package:flutter_demo/provider/appbar_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppBarProvider(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _controller = PageController(initialPage: 0);
  int _selectedIndex = 0;
  // List Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        // title: Text("Hello"),
        backgroundColor: Colors.orange,
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context)=> AppBarProvider(),
        child: PageView.builder(
            controller: _controller,
            itemCount: ScreenType.values.length,
            itemBuilder: _getScreenPresent
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black26,
        currentIndex: _selectedIndex,
        iconSize: 30,
        showSelectedLabels: false,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad_outlined),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_4_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index){
      setState(() {
        _controller.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.easeInSine);
        _selectedIndex = index;
      });
  }

  void _updateSelectedIndex(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getScreenPresent(BuildContext context,int index) {
    ScreenType screenType = ScreenType.values[index];
    switch (screenType) {
      case ScreenType.SHOP:
        return GameScreen();
      case ScreenType.BOOKMARK:
        return BookmarkScreen();
      case ScreenType.PROFILE:
        return ProfileScreen(controller: _controller, updateSelectedIndex: _updateSelectedIndex,);
      default:
        return HomeScreen();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
