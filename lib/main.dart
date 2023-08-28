import 'package:flutter/material.dart';
import 'package:listview_with_flutter/screens/user/user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
        home: const UserPage());
  }
}
