// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


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