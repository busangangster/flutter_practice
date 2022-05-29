import 'package:flutter/material.dart';

class timepicker extends StatefulWidget {
  const timepicker({Key? key}) : super(key: key);

  @override
  _timepickerState createState() => _timepickerState();
}

class _timepickerState extends State<timepicker> {
  DateTime _selectedTime = DateTime.now(); // Initialize DateTime

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Time Picker')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Future<TimeOfDay?> selectedTime = showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );
                    selectedTime.then((timeOfDay) {
                      setState(() {
                        _selectedTime =
                            '${timeOfDay?.hour}:${timeOfDay?.minute}'
                                as DateTime;
                      });
                    });
                  },
                  child: Text('Time Picker')),
              Text('$_selectedTime'),
            ],
          ),
        ));
  }
}
