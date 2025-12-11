import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    const int itemCount = 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Add padding OUTSIDE the rounded corners
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),

            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // ---- CAROUSEL ----
                FlutterCarousel(
                  items: [
                    Image.asset(
                      'assets/images/carousel1.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/carousel2.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/carousel3.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                  options: CarouselOptions(
                    height: 350,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    showIndicator: false,
                    onPageChanged: (index, reason) {
                      setState(() => _currentIndex = index);
                    },
                  ),
                ),

                // ---- CUSTOM INDICATOR ----
                Positioned(
                  bottom: 14,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(itemCount, (i) {
                      final bool isActive = i == _currentIndex;

                      return Padding(
                        padding: EdgeInsets.only(
                          right: i == itemCount - 1 ? 0 : 8,
                        ),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 220),
                          width: isActive ? 26 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: isActive
                                ? const Color.fromARGB(255, 245, 244, 244)
                                : const Color.fromARGB(255, 246, 245, 245),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
