

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Questionnaire(),
    );
  }
}

class Questionnaire extends StatefulWidget {

  @override
  // ignore: library_private_types_in_public_api
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  int _currentQuestionIndex = 0;
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'I have been able to laugh and see the funny side of things:',
      'options': [
        {'number':0, 'text':'As much as I always could'},
        {'number':1, 'text':'Not quite so much now'},
        {'number':2, 'text':'Definitely not so much now'},
        {'number':3, 'text':'Not at all'}
        ]
    },
    {'question': 'I have looked forward with enjoyment to things:',
      'options': [
        {'number':0, 'text':'As much as I ever did'},
        {'number':1, 'text':'Rather less than I used to'},
        {'number':2, 'text':'Definitely less than I used to'},
        {'number':3, 'text':'Hardly at all'}
        ]
    },
    {
      'question': 'I have blamed myself unnecessarily when things went wrong:',
      'options': [
        {'number':3, 'text':'Yes, most of the time'},
        {'number':2, 'text':'Yes, some of the time'},
        {'number':1, 'text':'Not very often'},
        {'number':0, 'text':'No, never'}
       ]
    },
    {
      'question': 'I have been anxious or worried for no good reason:',
      'options': [
        {'number':0, 'text':'No, not at all'},
        {'number':1, 'text':'Hardly ever'},
        {'number':2, 'text':'Yes, sometimes'},
        {'number':3, 'text':'Yes, very often'}
      ]
    },
     {
      'question': 'I have felt scared or panicky for no good reason:',
      'options': [
        {'number':3, 'text':'Yes, quite a lot'},
        {'number':2, 'text':'Yes, sometimes'},
        {'number':1, 'text':'No, not much'},
        {'number':0, 'text':'No, not at all'}
       ]
    },
    {
      'question': 'Things have been getting to me:',
      'options': [
        {'number':3, 'text':'Yes, most of the time I haven’t been able to cope at all'},
        {'number':2, 'text':'Yes, sometimes I haven’t been coping as well as usual'},
        {'number':1, 'text':'No, most of the time I have coped quite well'},
        {'number':0, 'text':'No, I have been coping as well as ever'}
       ]
    },
     {
      'question': ' I have been so unhappy that I have had difficulty sleeping:',
      'options': [
        {'number':3, 'text':'Yes, most of the time'},
        {'number':2, 'text':'Yes, sometimes'},
        {'number':1, 'text':'No, not very often'},
        {'number':0, 'text':'No, not at all'}
       ]
    },
    {
      'question': 'I have felt sad or miserable:',
      'options': [
        {'number':3, 'text':'Yes, most of the time'},
        {'number':2, 'text':'Yes, quite often'},
        {'number':1, 'text':'Not very often'},
        {'number':0, 'text':'No, not at all'}
       ]
    },
    {
      'question': 'I have been so unhappy that I have been crying:',
      'options': [
        {'number':3, 'text':'Yes, most of the time'},
        {'number':2, 'text':'Yes, quite often'},
        {'number':1, 'text':'Only occasionally'},
        {'number':0, 'text':'No, never'}
       ]
    },
    {
      'question': 'The thought of harming myself has occurred to me:',
      'options': [
        {'number':3, 'text':'Yes, quite often'},
        {'number':2, 'text':'Sometimes'},
        {'number':1, 'text':'Hardly ever'},
        {'number':0, 'text':'Never'}
       ]
    }

  ];

  int? _selectedOptionIndex;
  num score = 0;

 void _selectOption(int optionIndex) {
    setState(() {
      if (_selectedOptionIndex == optionIndex) {
        // If the same option is selected again, deselect it
        _selectedOptionIndex = null;
        score -= _questions[_currentQuestionIndex]['options'][optionIndex]['number'];
      } else {
        // Deselect the previously selected option (if any)
        if (_selectedOptionIndex != null) {
          score -= _questions[_currentQuestionIndex]['options'][_selectedOptionIndex!]['number'];
        }
        // Select the new option
        _selectedOptionIndex = optionIndex;
        score += _questions[_currentQuestionIndex]['options'][optionIndex]['number'];
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      _selectedOptionIndex = null; // Reset selected option for the next question
    });
  }

  void _previousQuestion() {
  setState(() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      _selectedOptionIndex = null; // Reset selected option for the previous question
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionnaire'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                //when article button is pushed, goes to article
                MaterialPageRoute(builder: (context) => HomePage())
              );
          },
        ),
      ),
      body: _currentQuestionIndex < _questions.length
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _questions[_currentQuestionIndex]['question'],
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: List.generate(
                      _questions[_currentQuestionIndex]['options'].length,
                      (index) => GestureDetector(
                        onTap: () => _selectOption(index),
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectedOptionIndex == index ? Colors.blue : Colors.grey, // Change border color if selected
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            '${_questions[_currentQuestionIndex]['options'][index]['text']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: _selectedOptionIndex == index ? Colors.blue : Colors.black, // Change text color if selected
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (_currentQuestionIndex > 0)
                      ElevatedButton(
                        onPressed: _previousQuestion,
                        child: Text('Previous')),
                      
                      if (_selectedOptionIndex != null) // Show next button only if an option is selected
                      ElevatedButton(
                        onPressed: _nextQuestion,
                        child: Text('Next'),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have completed the screening tool',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Score: ${score}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height:20),
                  Text(
                    score > 10 ? 'Your score is over 10.' : 'Your score is under 10',
                    style:TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
    );
  }
}