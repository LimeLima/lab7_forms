import 'package:flutter/material.dart';
import 'package:lab7_forms/form_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Form_page(),
    );
  }
}
