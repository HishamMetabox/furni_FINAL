import 'package:flutter/material.dart';
import 'package:furni_mobile_app/contactUs/contactus.dart';
import 'package:furni_mobile_app/home_page/data/aboutUs.dart'; // Your Model
import 'package:furni_mobile_app/services/api_aboutus.dart'; // Adjust path to your ApiService

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const String baseUrl = "http://159.65.15.249:1337";

    return FutureBuilder<AboutData?>(
      future: ApiService.fetchAboutSection(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError || snapshot.data == null) {
          // Fallback if API fails or returns no data
          return const SizedBox.shrink(); 
        }

        final data = snapshot.data!;

        return Column(
          children: [
            // Dynamic Image from Strapi
            Image.network(
              data.imageUrl.startsWith('http') ? data.imageUrl : '$baseUrl${data.imageUrl}',
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => 
                  Image.asset('assets/images/about_us.png', width: double.infinity),
            ),
            
            const SizedBox(height: 16),
            
            // Dynamic Heading
            Text(
              data.heading,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            
            const SizedBox(height: 8),
            
            // Dynamic Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                data.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => const Contactus()),
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1.2),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 6.0),
                            child: Text(
                              data.ctaText, // Dynamic CTA Text
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Icon(Icons.arrow_forward, size: 16, color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}