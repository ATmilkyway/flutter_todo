import 'package:flutter/material.dart';
import 'package:todo/pages/Todo_page.dart';

void main() {
  runApp(const MyApp());
  // for different screen
  // runApp(DevicePreview(builder: (context) => const MyApp()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'T O D O',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF4A3780)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4A3780),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF4A3780),
          foregroundColor: Colors.white,
        ),
      ),
      home: TodoPage(),
    );
  }
}
