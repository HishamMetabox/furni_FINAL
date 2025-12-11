import 'package:flutter/material.dart';
import 'package:furni_project/screens/home_screen.dart';
import 'package:furni_project/navbar/navbar.dart';
import 'package:furni_project/shop_page/featured_article.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.transparent),
      home: Scaffold(
        extendBody: true,
        body: SafeArea(child: FeaturedArticle()),

        bottomNavigationBar: SizedBox(
          height: 90, // <- VERY IMPORTANT
          child: GlassFloatingNavBar(),
        ),
      ),
    ),
  );
}
