
import 'package:creations/splash%20.dart';
import 'package:flutter/material.dart';

const saveKeyName = 'user_logged_in';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'login sample',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Splash(),
    );
  }
}
