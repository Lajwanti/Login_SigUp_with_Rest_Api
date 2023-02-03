import 'package:flutter/material.dart';
import 'package:signuplogin_with_restapi/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SignUp demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Signup(),

    );
  }
}
