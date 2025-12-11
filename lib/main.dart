import 'package:flutter/material.dart';
import 'package:furni_mobile_app/contactUs/contactus.dart';
import 'package:furni_mobile_app/contactUs/widget/services.dart';
import 'package:furni_mobile_app/shop/widget/filternav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Filternav(),
      ),
    );
  }
}

