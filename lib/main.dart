import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imc_app/ui/imc.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: ImcPage(),
    );
  }
}
