import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  bool isDone;
  String title;

  Todo(this.title, {this.isDone = false});
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final _items = <Todo>[]; // 할 일 목록을 저장할 리스트

  var _todoController = TextEditingController(); // 할 일 문자열 조작을 위한 컨트롤러

  @override // 사용이 끝나면 해제
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  Widget _buildItemWidget(DocumentSnapshot doc) {
    final todo = Todo(doc['title'], isDone: doc['isDone']);
    return ListTile(
      onTap: () => _toggleTodo(doc),
      title: Text(
        todo.title,
        style: todo.isDone
            ? TextStyle(
                decoration: TextDecoration.lineThrough, // 취소선
                fontStyle: FontStyle.italic, // 이탤릭체
              )
            : null, // 아무 스타일도 적용하지 않음
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () => _deleteTodo(todo),
      ),
    );
  }

  // 할 일 추가 메소드
  void _addTodo(Todo todo) {
    FirebaseFirestore.instance
        .collection('todo')
        .add({'title': todo.title, 'isDone': todo.isDone});
    _todoController.text = '';
  }

  // 할 일 삭제 메소드
  void _deleteTodo(Todo todo) {
    setState(() {
      _items.remove(todo);
    });
  }

  // 할 일 완료/미완료 메소드
  void _toggleTodo(DocumentSnapshot doc) {
    FirebaseFirestore.instance
        .collection('todo')
        .document(doc.documentID)
        .updateData({
      'isDone': !doc['isDone'],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('남은 할 일'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    controller: _todoController,
                  )),
                  RaisedButton(
                    child: Text('추가'),
                    onPressed: () => _addTodo(Todo(_todoController.text)),
                  ),
                ],
              ),
              StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection('todo').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    final docs = snapshot.data!.docs;
                    return Expanded(
                        child: ListView(
                      children:
                          docs.map((doc) => _buildItemWidget(doc)).toList(),
                    ));
                  })
            ],
          )),
    );
  }
}
