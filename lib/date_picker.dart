import 'package:flutter/material.dart';

class datepicker extends StatefulWidget {
  const datepicker({Key? key}) : super(key: key);

  @override
  _datepickerState createState() => _datepickerState();
}

class _datepickerState extends State<datepicker> {
  DateTime _selectedTime = DateTime.now(); // Initialize DateTime

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DatePicker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align center
          children: [
            ElevatedButton(
              onPressed: () {
                Future<DateTime?> selectedDate = showDatePicker(
                  context: context,
                  initialDate: DateTime.now(), // set initial date
                  firstDate: DateTime(2022), // set first date
                  lastDate: DateTime(2030), // set last date
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.dark(), // Dark mode
                      child: child!,
                    );
                  },
                );
                selectedDate.then((dateTime) {
                  setState(() {
                    _selectedTime =
                        dateTime!; // renew _selectedTime by using setState function
                  });
                });
              },
              child: Text('Date Picker'),
            ),
            Text('$_selectedTime'), // show the selectedTime
          ],
        ),
      ),
    );
  }
}
