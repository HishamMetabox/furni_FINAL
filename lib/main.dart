import 'package:flutter/material.dart';
import 'package:furni_mobile_app/screens/home_screen.dart';
import 'package:furni_mobile_app/navbar/navbar.dart';
import 'package:furni_mobile_app/shop_page/hero_section.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.transparent),
      home: Scaffold(
        extendBody: true,
        body: SafeArea(child: HeroSection()),

        bottomNavigationBar: SizedBox(height: 90, child: GlassFloatingNavBar()),
      ),
    ),
  );
}
