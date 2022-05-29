import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  // const SliverListPage({Key? key}) : super(key: key);
  final _items = List.generate(50, (i) => ListTile(title: Text('No.$i')));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Sliver List'),
            background: Image.asset(
              'assets/sample.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(_items),
        )
      ],
    ));
  }
}
