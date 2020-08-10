import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simple_todo_app/models/todo.item.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  var items = new List<TodoItem>();

  HomeScreen() {
    items = [];
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newTextCtrl = TextEditingController();

  void addTodoItem() {
    setState(() {
      widget.items.insert(
        0,
        TodoItem(
          title: newTextCtrl.text,
          done: false,
        ),
      );
    });
    saveTodoItemsInShared();
    newTextCtrl.clear();
  }

  void removeTodoItem(int index) {
    setState(() {
      widget.items.removeAt(index);
    });
    saveTodoItemsInShared();
  }

  Future loadTodoItemsFromShared() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('todoList');

    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<TodoItem> list = decoded.map((e) => TodoItem.fromJson(e)).toList();
      setState(() {
        widget.items = list;
      });
    }
  }

  saveTodoItemsInShared() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('todoList', jsonEncode(widget.items));
  }

  _HomeScreenState() {
    loadTodoItemsFromShared();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: newTextCtrl,
          decoration: InputDecoration(
            labelText: 'Entre com uma nova tarefa',
            border: InputBorder.none,
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctx, int index) {
          final item = widget.items[index];

          return Dismissible(
            key: Key(item.title),
            child: CheckboxListTile(
              title: Text(item.title),
              value: item.done,
              onChanged: (value) {
                setState(() {
                  item.done = value;
                });
                saveTodoItemsInShared();
              },
            ),
            background: Container(
              color: Colors.red.withOpacity(0.2),
            ),
            onDismissed: (direction) {
              removeTodoItem(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodoItem,
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
