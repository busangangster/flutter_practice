import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class datepicker extends StatefulWidget {
  const datepicker({Key? key}) : super(key: key);

  @override
  _datepickerState createState() => _datepickerState();
}

class _datepickerState extends State<datepicker> {
  DateTime _selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DatePicker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                Future<DateTime?> selectedDate = showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2022),
                  lastDate: DateTime(2030),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.dark(),
                      child: child!,
                    );
                  },
                );
                selectedDate.then((dateTime) {
                  setState(() {
                    _selectedTime = dateTime!;
                  });
                });
              },
              child: Text('Date Picker'),
            ),
            Text('$_selectedTime'),
          ],
        ),
      ),
    );
  }
}
