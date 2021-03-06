import 'package:book/Easy_Ui/Easy_ui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BMI/BMI_main.dart';
import 'Stopwatch/Stopwatch.dart';
import 'Todo/Todo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Main'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Open route'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TodoList()));
            },
          ),
        ));
  }
}
