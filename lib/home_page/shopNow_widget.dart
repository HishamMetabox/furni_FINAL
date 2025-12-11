import 'package:flutter/material.dart';

class ShopNowLink extends StatelessWidget {
  const ShopNowLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Shop Now',
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(width: 4), // small gap like the picture
            const Icon(Icons.arrow_forward, size: 18, color: Colors.black),
          ],
        ),

        // underline under BOTH text + icon
        Container(
          margin: const EdgeInsets.only(top: 2),
          height: 1.5,
          width: 95, // adjust to match your design
          color: Colors.black,
        ),
      ],
    );
  }
}
