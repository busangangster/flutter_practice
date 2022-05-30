import 'package:flutter/material.dart';

class EasyUi extends StatefulWidget {
  const EasyUi({Key? key}) : super(key: key);

  @override
  _EasyUiState createState() => _EasyUiState();
}

class _EasyUiState extends State<EasyUi> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Damn', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '$_index 페이지',
          style: TextStyle(fontSize: 40),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: '이용서비스'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: '내정보'),
        ],
      ),
    );
  }
}
