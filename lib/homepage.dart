// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'articles.dart';

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
        // ignore: prefer_const_literals_to_create_immutables
        tabs:[
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

//This styles the homepage
class HomeStyle extends StatelessWidget {
  const HomeStyle({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Homepage')
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Icon(
                Icons.female,
                size: 100
              ),
              SizedBox(height:20),

              Text(
                'Welcome to [APP NAME]',
                style:TextStyle(
                  fontSize: 40,
                )
                ),
              SizedBox(height:30),
              Container(
                width:450,
                child: Center(
                  child: Text('This app is made for spreading information about post-partem depression and helping you gather information about your own health.',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              )
              )
            ],
          )
        ),
        ),
    );
  }
}

//This style the article page
class NewsStyle extends StatelessWidget {
  const NewsStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Article Page')
      ),
      body: Align(
        alignment: Alignment(0.9, -0.6),
          child: InkWell(
            onTap: (){
              Navigator.push(
                context,
                //when article button is pushed, goes to articles.dart
                MaterialPageRoute(builder: (context) => ArticleOne())
              );
            },
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: EdgeInsets.all(0),
                child: Row(
                  children: [
                    SizedBox(width: 50),
                    SizedBox(
                      width: 200,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                        'assets/ArticleExample.png',
                        fit: BoxFit.cover,
                      ),
                      )
                    ),
                    // Image.asset(
                    //   'assets/ArticleExample.png',
                    //   width: 200,
                    //   height: 200,
                    // ),
                    SizedBox(width: 100),
                    Text(
                      'Read Article',
                      style: TextStyle(fontSize: 18),
                      )
                  ],
                ),
              )
            )
          )
      )
    );
  }
}

//Styles the log page
//Stateless because user interactes with calendar
class LogStyle extends StatefulWidget {
  const LogStyle({super.key});

  @override
  State<LogStyle> createState() => _LogStyleState();
}

class _LogStyleState extends State<LogStyle> {
  late DateTime _selectedDate;

  void _datePicker() async{
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
  );

  //if date is selected, update the selectedDate variable
  if (selectedDate != null){
    setState(() {
      _selectedDate = selectedDate;
    });

    //navigate to date page
    Navigator.push(
      context,
      MaterialPageRoute(
        //When user clicks date, goes to new page
        builder: (context) => SelectedDatePage(selectedDate: _selectedDate),
      )
    );
  }
}
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              _datePicker();
            },
            child: const Text('press me'),
          ),
        ),
      ),
    );
  }
}

// New page to display the selected date
class SelectedDatePage extends StatelessWidget {
  final DateTime selectedDate;

  const SelectedDatePage({Key? key, required this.selectedDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Date'),
      ),
      body: Center(
        child: Text(
          'Selected Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
