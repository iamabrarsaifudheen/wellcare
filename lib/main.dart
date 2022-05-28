import 'package:flutter/material.dart';
import 'package:wellcare/authenticate.dart';
import 'package:wellcare/sign_in.dart';
import 'package:wellcare/wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Montserrat',

  
        primaryColor: const Color(0xff1E3E72)
      ),
      home: Authenticate()
    );
  }
}


