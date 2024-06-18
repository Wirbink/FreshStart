import 'package:flutter/material.dart';
import 'package:fresh_start/core/presentation/views/Cash%20Express/cash_express_view.dart';
import 'package:fresh_start/core/presentation/views/dash.dart';
import 'package:fresh_start/core/presentation/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FreshBank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0XFFF0F2F5)),
      home: const HomePage(),
    );
  }
}
