import 'package:flutter/material.dart';
import 'package:flutter_application/Screen/%5Banime%5Dmylist.dart';
import 'Screen/home.dart';
import 'Screen/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User CRUD',
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/login': (context) => const Login(),
          '/mylist':(context) => const mylist()
        });
  }
}
