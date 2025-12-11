import 'package:flutter/material.dart';
import 'package:furni_project/home_page/shopNow_widget.dart';

class Bundle extends StatelessWidget {
  const Bundle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // --- Container 1 ---
            Container(
              height: 450,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/living_room.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 25,
                    left: 10,
                    child: Text(
                      'Living Room',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 24,
                      ),
                    ),
                  ),

                  Positioned(top: 60, left: 15, child: ShopNowLink()),
                ],
              ),
            ),
            //--------------------------------container 2------------------------
            Container(
              height: 230,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(100, 243, 245, 247),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/bedroom.png',
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 10,
                    child: Text(
                      'Bedroom',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 24, 24, 24),
                        fontSize: 24,
                      ),
                    ),
                  ),

                  Positioned(top: 135, left: 10, child: ShopNowLink()),
                ],
              ),
            ),
            //------------------------------container 3------------------------
            Container(
              height: 300,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(100, 243, 245, 247),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/kitchen0.png',
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 15,
                    child: Text(
                      'Kitchen',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 25, 24, 24),
                        fontSize: 24,
                      ),
                    ),
                  ),

                  Positioned(top: 135, left: 11, child: ShopNowLink()),
                ],
              ),
            ), //3
          ],
        ),
      ),
    );
  }
}
