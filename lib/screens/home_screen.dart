import 'package:flutter/material.dart';
import 'package:furni_project/home_page/about_us.dart';
import 'package:furni_project/Header/header.dart';
import 'package:furni_project/home_page/bundle.dart';
import 'package:furni_project/home_page/carousel.dart';
import 'package:furni_project/home_page/newproduct.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            Header(),
            CarouselWidget(),
            Bundle(),
            NewArrival(),

            AboutUsSection(),
            //  FooterWidget(),
          ],
        ),
      ),
    );
  }
}
