import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(JsonApp());
}

class JsonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Interaksi Data_Nurina Khairiah Usman',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JsonScreen(),
    );
  }
}

class JsonScreen extends StatefulWidget {
  @override
  _JsonScreenState createState() => _JsonScreenState();
}

class _JsonScreenState extends State<JsonScreen> {
  List<dynamic> todos = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/'));
    if (response.statusCode == 200) {
      setState(() {
        todos = json.decode(response.body);
      });
    } else {
      print('Gagal Memuat Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data external (json)'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index]['title']),
            subtitle: Text('Completed: ${todos[index]['completed']}'),
          );
        },
      ),
    );
  }
}