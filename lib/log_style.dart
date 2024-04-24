import 'package:flutter/material.dart';
import 'mood_scale.dart';

// Styles the log page
// Stateful to update date picked by the user
class LogStyle extends StatefulWidget {
  const LogStyle({Key? key});

  @override
  State<LogStyle> createState() => _LogStyleState();
}

class _LogStyleState extends State<LogStyle> {
  late DateTime _selectedDate;

  void _datePicker() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    // If date is selected, update the selectedDate variable
    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });

      // Navigate to the date page
      Navigator.push(
        context,
        MaterialPageRoute(
          // When the user clicks the date, go to the new page
          builder: (context) => MoodScale(),
          // builder: (context) => SelectedDatePage(selectedDate: _selectedDate),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Daily Log',
            style: TextStyle(fontWeight: FontWeight.bold)
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFE46D86),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Track your symptoms daily and maintain a daily mental health journal',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 40),
              Container(
                width:200,
                height: 50,
               child:  ElevatedButton(
                onPressed: () {
                  _datePicker();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_month),
                    SizedBox(width: 5),
                    Text('Calendar'),
                  ],
                ),
              ),
              )
              
            ],
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
