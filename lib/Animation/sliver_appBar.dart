import 'package:flutter/material.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        pinned: true,
        expandedHeight: 200.0,
        flexibleSpace: FlexibleSpaceBar(
          title: Text("Sliver"),
          background: Image.asset(
            'assets/sample.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      SliverFillRemaining(child: Center(child: Text('center')))
    ]));
  }
}
