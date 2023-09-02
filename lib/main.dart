import 'package:flutter/material.dart';
import 'Screen/home.dart';

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
        });
  }
}
