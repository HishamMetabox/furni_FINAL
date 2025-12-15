import 'package:flutter/material.dart';
import 'package:furni_mobile_app/home_page/about_us.dart';
import 'package:furni_mobile_app/Header/header.dart';
import 'package:furni_mobile_app/home_page/bundle.dart';
import 'package:furni_mobile_app/home_page/carousel.dart';
import 'package:furni_mobile_app/home_page/newproduct.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
      ),
    );
  }
}
