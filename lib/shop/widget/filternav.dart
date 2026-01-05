import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furni_mobile_app/shop/widget/filter.dart';
import 'package:furni_mobile_app/shop/widget/sortby.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:furni_mobile_app/shop/widget/productFilter.dart';

class Filternav extends StatelessWidget {
  final Function(ProductFilter) onFilterApplied;
  final Function(String) onSortApplied;

  const Filternav({
    super.key, 
    required this.onFilterApplied, 
    required this.onSortApplied
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          TextButton(
            onPressed: () async {
              final result = await showModalBottomSheet<ProductFilter>(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24))
                ),
                builder: (ctx) => const FilterBottomSheet(),
              );
              if (result != null) onFilterApplied(result);
            },
            child: Row(
              children: [
                SvgPicture.asset('assets/images/filter.svg', width: 20),
                const SizedBox(width: 8),
                Text('Filter', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
              ],
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () async {
              final String? result = await showModalBottomSheet<String>(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24))
                ),
                builder: (ctx) => const Sortby(),
              );
              if (result != null) onSortApplied(result);
            },
            child: Row(
              children: [
                Text('Sort by', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
                const Icon(Icons.arrow_drop_down, color: Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }
}