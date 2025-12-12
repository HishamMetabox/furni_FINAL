import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furni_mobile_app/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: const SplashScreen()),
    ),
  );
}
