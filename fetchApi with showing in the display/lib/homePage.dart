// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  static const String path = "homepage";
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List users = [];
  @override
  void initState() {
    getUsers();
    super.initState();
  }

  Future getUsers() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      users = jsonDecode(response.body);
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter theme"),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: const [
          Icon(Icons.search),
          Icon(Icons.more_vert),
          SizedBox(width: 10),
        ],
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext ctx, int index) {
            return ListTile(
              title: Text(users[index]["name"]),
              subtitle: Text(users[index]["address"]["city"]),
              trailing: Text(users[index]["email"]),
            );
          }),
    );
  }
}
