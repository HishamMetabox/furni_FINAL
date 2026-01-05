import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sortby extends StatefulWidget {
  const Sortby({super.key});

  @override
  State<Sortby> createState() => _SortbyState();
}

class _SortbyState extends State<Sortby> {
  String _selectedOption = ''; 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      height: 380,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios_new, size: 18)
                ),
                const SizedBox(width: 15),
                Text('Sort by', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _option('Recommended', 'A'),
          _option('Recently Added', 'B'),
          _option('Price: Low to High', 'C'),
          _option('Price: High to Low', 'D'),
        ],
      ),
    );
  }

  Widget _option(String title, String val) {
    return RadioListTile<String>(
      title: Text(title, style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500)),
      value: val,
      groupValue: _selectedOption,
      activeColor: Colors.black,
      onChanged: (String? value) {
        setState(() => _selectedOption = value!);
        // This is the key: it closes the sheet and returns the value 'A', 'B', etc.
        Future.delayed(const Duration(milliseconds: 200), () {
          Navigator.pop(context, value);
        });
      },
    );
  }
}