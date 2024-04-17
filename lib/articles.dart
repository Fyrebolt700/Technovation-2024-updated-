import 'package:flutter/material.dart';

class ArticleOne extends StatelessWidget {
  const ArticleOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Article'),
      ),
      // body:Center(
      //   child: ElevatedButton(
      //     child: Text("back"),
      //     onPressed: (){
      //       Navigator.pop(context);
      //     }
      //   ),
      // )

    );
  }
}