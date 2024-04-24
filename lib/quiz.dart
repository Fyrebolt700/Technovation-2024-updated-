import 'package:flutter/material.dart';
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
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  int _currentQuestionIndex = 0;
  final List<Map<String, dynamic>> _questions = [
    {
      'question':
          'Please answer these questions based on how you felt the past 7 days, not just today. This is a screening test; not a medical diagnosis. If something doesn’t seem right, call your health care provider regardless of your score.',
      'options': [
        {'number': 0, 'text': 'Begin'}
      ]
    },
    {
      'question': 'I have been able to laugh and see the funny side of things:',
      'options': [
        {'number': 0, 'text': 'As much as I always could'},
        {'number': 1, 'text': 'Not quite so much now'},
        {'number': 2, 'text': 'Definitely not so much now'},
        {'number': 3, 'text': 'Not at all'}
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
    // Add other questions here...
  ];

  int? _selectedOptionIndex;
  num score = 0;

  void _selectOption(int optionIndex) {
    setState(() {
      if (_selectedOptionIndex == optionIndex) {
        _selectedOptionIndex = null;
        score -= _questions[_currentQuestionIndex]['options'][optionIndex]['number'];
      } else {
        if (_selectedOptionIndex != null) {
          score -= _questions[_currentQuestionIndex]['options'][_selectedOptionIndex!]['number'];
        }
        _selectedOptionIndex = optionIndex;
        score += _questions[_currentQuestionIndex]['options'][optionIndex]['number'];
      }
      // Ensure the score doesn't exceed 30
      if (score > 30) {
        score = 30;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _selectedOptionIndex = null;
      } else {
        // Navigate to the final screen if all questions are completed
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FinalScreen(score: score)),
        );
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
        _selectedOptionIndex = null;
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
              MaterialPageRoute(builder: (context) => HomePage()),
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
                    style: TextStyle(fontSize: 20, color: Colors.black),
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
                            color: _selectedOptionIndex == index ? Colors.pink[100] : Colors.white,
                            border: Border.all(
                              color: _selectedOptionIndex == index ? Color.fromARGB(255, 239, 7, 185) : Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            '${_questions[_currentQuestionIndex]['options'][index]['text']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: _selectedOptionIndex == index ? Colors.white : Colors.black,
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
                          child: Text('Previous'),
                        ),
                      if (_selectedOptionIndex != null)
                        ElevatedButton(
                          onPressed: _nextQuestion,
                          child: Text(_currentQuestionIndex < _questions.length - 1 ? 'Next' : 'Finish'),
                        ),
                    ],
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class FinalScreen extends StatelessWidget {
  final num score;

  const FinalScreen({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Final Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have completed the screening tool',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              'Score: $score',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              score > 12
                  ? 'Your score is over 12 and you may be suffering from depression and should likely seek medical attention'
                  : 'Your score is below 12 and does not indicate any signs of depression. However, if something doesn’t seem right, call your health care provider regardless.',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
