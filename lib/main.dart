

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home_style.dart';
import 'news_style.dart';
import 'log_style.dart';

//main page that links to other pages
//main page has no independatn function

void main() {
  runApp(const MyApp());
}

//widgets are basciacally functions
//Stateless widgets (one below ↓) always stay the same. No changes unless maually entered in code.

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

//stateful widgets (below ↓) are updated based on user interaction. They change.
class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late Widget page;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight:FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    const List<Widget> widgetOptions = <Widget>[
    //these are the functions called for each tab in navbar
    //every page has its own file
    HomeStyle(),
    NewsStyle(),
    LogStyle(),

    Text('Resources',
    style: optionStyle,
    ),

  ];

    return Scaffold(
      body:Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: GNav(
        gap: 12,
        //Below is the nav bar with the icons and words.
        tabs:const [
          GButton(
            icon: Icons.home,
            text: "Home"
          ),
          GButton(
            icon: Icons.note_add_rounded,
            text: "Articles"
          ),
          GButton(
            icon: Icons.calendar_month_outlined,
            text: 'Log'
          ),
          GButton(
            icon: Icons.book_sharp,
            text:"Resources"
          ),
        ],

      selectedIndex: _selectedIndex,
      onTabChange: (index) {
        setState(() {
          _selectedIndex = index;
          }
        );
          
          },
        ),
      );
  }
  
}