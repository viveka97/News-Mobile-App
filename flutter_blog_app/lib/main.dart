import 'package:flutter/material.dart';
import 'package:flutter_blog_app/LoginRegisterPage.dart';
import 'LoginRegisterPage.dart';

void main() {
  runApp(new BlogApp());
}

class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "News App",
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LoginRegisterPage(),
    );
  }
}
