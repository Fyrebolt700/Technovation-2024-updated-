
import 'package:flutter/material.dart';
import 'homepage.dart';

//main page that links to other pages
//main page has no independatn function

void main() {
  runApp(const MyApp());
}

//widgets are basciacally functions
//Stateless widgets (one below ↓) always stay the same. No changes unless maually entered in code.

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}