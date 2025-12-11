import 'package:flutter/material.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset('assets/images/about_us.png', width: double.infinity),
          const SizedBox(height: 16),
          const Text(
            'About Us',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Its more affordable than ever to give every room in your home a stylish makeover',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),

          const SizedBox(height: 20),

          /// 🔥 Underlined Row — Correctly Placed INSIDE children[]
          Padding(
            padding: const EdgeInsets.all(20.0),

            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 1.2),
                    ),
                  ),
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 6.0),
                        child: Text(
                          'Contact Us',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
