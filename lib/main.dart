import 'package:expense_tracker/pages/homePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan)
              .copyWith(secondary: const Color.fromARGB(255, 168, 182, 5))),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
