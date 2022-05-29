import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero'),
      ),
      body: Center(
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HeroDetailPage()),
                );
              },
              child: Hero(
                  tag: 'image',
                  child: Image.asset(
                    'assets/sample.jpg',
                    width: 100,
                    height: 200,
                  )))),
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  const HeroDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hero'),
        ),
        body: Hero(
          tag: 'image',
          child: Image.asset('assets/sample.jpg'),
        ));
  }
}
