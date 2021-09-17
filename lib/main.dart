import 'package:flutter/material.dart';
import 'package:items_manager/screens/home_screen.dart';
import 'package:items_manager/widgets/custom_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Items Manager',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: CustomColor.themeColor,
      ),
      home: const HomeScreen(),
    );
  }
}
