import 'package:flutter/material.dart';
import 'formulario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Formulario',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: formulario(),
    );
  }
}