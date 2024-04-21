import 'package:flutter/material.dart';

//This style the article page
class NewsStyle extends StatelessWidget {
  const NewsStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Article Page'),
        automaticallyImplyLeading: false,
      ),
      body: Align(
        alignment: Alignment(0.9, -0.6),
          child: InkWell(
            onTap: (){
              Navigator.push(
                context,
                //when article button is pushed, goes to article
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


class ArticleOne extends StatelessWidget {
  const ArticleOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Article'),
      ),
    );
  }
}