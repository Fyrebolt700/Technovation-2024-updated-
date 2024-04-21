import 'package:flutter/material.dart';
import 'mood_scale.dart';

//Styles the log page
//Stateful to update date picked by user
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
        builder: (context) => MoodScale(),
       // builder: (context) => SelectedDatePage(selectedDate: _selectedDate),
      )
    );
  }
}
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Daily Log'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              // ignore: prefer_const_constructors
              Text(
                'Track your symptoms daily and maintain a daily mental health journal',
                style: TextStyle(
                  fontSize: 16,
                )
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                   _datePicker();
                  },
            child: const Text('Calendar'),
          ),
            ],
          ),
        ),
      ),
    );
  }
}

//New page to display the selected date
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
