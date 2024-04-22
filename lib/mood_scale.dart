import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(MoodScale());
}

class MoodScale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Scale',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoodScaleScreen(),
    );
  }
}

class MoodScaleScreen extends StatefulWidget {
  @override
  _MoodScaleScreenState createState() => _MoodScaleScreenState();
}

class _MoodScaleScreenState extends State<MoodScaleScreen> {
   TextEditingController _textEditingController = TextEditingController();

  double _selectedMoodValue = 3.0; // Default mood value
  List<String> _moods = [
    "😭", // Very Sad
    "😞", // Sad
    "😐", // Neutral
    "😊", // Happy
    "😄", // Very Happy
  ];
  List<Color> _moodColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mood Scale'),
        leading: IconButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage())
            );
          },
          icon: Icon(Icons.arrow_back),
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'How are you feeling today?',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            MoodSlider(
              value: _selectedMoodValue,
              onChanged: (value) {
                setState(() {
                  _selectedMoodValue = value;
                });
              },
              moodColors: _moodColors,
              divisions: _moods.length - 1,
            ),
            SizedBox(
            width: 300.0, // Set the width of the text field
            height: 100.0, // Set the height of the text field
            child: TextField(
              controller: _textEditingController,
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter text',
                labelText: 'Journal your thoughts',
                
              ),
            ),
            ),
            
            /*
            
            TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'Journal',
                  border: OutlineInputBorder(),
                ),
              ),
            */
            SizedBox(height: 20.0),
            Text(
              'Selected Mood: ${_moods[_selectedMoodValue.toInt()]}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String enteredText = _textEditingController.text;
                // You can add functionality here to save the selected mood
                // or perform any other action based on the mood.
                print('Selected mood: ${_moods[_selectedMoodValue.toInt()]}');
                print('Entered text: $enteredText');
                },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class MoodSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final List<Color> moodColors;
  final int divisions;

  MoodSlider({
    required this.value,
    required this.onChanged,
    required this.moodColors,
    this.divisions = 5,
  });

  @override
  _MoodSliderState createState() => _MoodSliderState();
}

class _MoodSliderState extends State<MoodSlider> {
  double _value = 3.0;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 20.0,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
      ),
      child: Slider(
        value: _value,
        onChanged: (newValue) {
          setState(() {
            _value = newValue;
            widget.onChanged(newValue);
          });
        },
        min: 0,
        max: (widget.moodColors.length-1).toDouble(),
        divisions: widget.divisions,
        activeColor: _getColor(_value.toInt(), widget.moodColors),
      ),
    );
  }

  Color _getColor(int index, List<Color> colors) {
    if (index <= 0) {
      return colors.first;
    } else if (index >= colors.length) {
      return colors.last;
    } else {
      return colors[index];
    }
  }
}
