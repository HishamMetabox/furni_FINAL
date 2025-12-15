import 'package:flutter/material.dart';
import 'package:furni_mobile_app/Items/bottomsheet.dart';

class HommeScreen extends StatelessWidget {
  const HommeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Show Bottom Sheet'),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (ctx) => BottomCartSheet(),
            );
          },
        ),
      ),
    );
  }
}
