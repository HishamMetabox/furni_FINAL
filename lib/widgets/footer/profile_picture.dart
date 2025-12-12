import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 70,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: AssetImage('assets/images/profile_picture.jpg'),
        ),
        Positioned(
          bottom: -3,
          right: -8,
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/camera_icon.svg',
              width: 35,
              height: 35,
            ),
          ),
        ),
      ],
    );
  }
}
