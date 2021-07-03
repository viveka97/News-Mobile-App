import 'package:flutter/material.dart';
import 'package:flutter_blog_app/Authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Mapping.dart';
import 'Authentication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: MappingPage(
        auth: Auth(),
      ),
    );
  }
}
