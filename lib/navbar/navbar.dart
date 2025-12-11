import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GlassFloatingNavBar extends StatefulWidget {
  const GlassFloatingNavBar({super.key});

  @override
  State<GlassFloatingNavBar> createState() => _GlassFloatingNavBarState();
}

class _GlassFloatingNavBarState extends State<GlassFloatingNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 16,
          right: 16,
          bottom: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.25),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 25,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.black54,
                  currentIndex: _selectedIndex,
                  onTap: (i) => setState(() => _selectedIndex = i),
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/shop-page.svg',
                        width: 26,
                      ),
                      label: "Shop",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/cart_logo.svg',
                        width: 26,
                      ),
                      label: "Cart",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/user-circle.svg',
                        width: 26,
                      ),
                      label: "Profile",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
