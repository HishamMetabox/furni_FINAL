import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  // Brand Chips
  List<String> brands = ["Ardell", "bareMinerals", "Ciaté"];
  List<String> selectedBrands = [];

  // Color Chips
  List<Color> colorOptions = [
    Colors.grey,
    Colors.black,
    Colors.white,
    Colors.teal,
  ];
  int selectedColorIndex = 0;

  // Price Range
  RangeValues priceRange = const RangeValues(0, 234);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.85, // 85% height
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Grab handle
            Center(
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // CATEGORY
            rowHeader("Category"),
            const SizedBox(height: 20),

            // BRAND SECTION
            rowHeader("Brand"),
            const SizedBox(height: 10),
            buildBrandChips(),
            const SizedBox(height: 20),

            // COLOR SECTION
            rowHeader("Color"),
            const SizedBox(height: 10),
            buildColorChips(),
            const SizedBox(height: 20),

            // PRICE RANGE
            rowHeader("Price Range"),
            RangeSlider(
              min: 0,
              max: 234,
              values: priceRange,
              onChanged: (value) {
                setState(() {
                  priceRange = value;
                });
              },
            ),

            const SizedBox(height: 30),

            // APPLY BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Apply Filters",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ⬆️ Reusable Header
  Widget rowHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Text(
          "View all",
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }

  // BRAND CHIPS
  Widget buildBrandChips() {
    return Wrap(
      spacing: 10,
      children: List.generate(brands.length, (index) {
        bool isSelected = selectedBrands.contains(brands[index]);
        return ChoiceChip(
          label: Text(brands[index]),
          selected: isSelected,
          onSelected: (value) {
            setState(() {
              if (isSelected) {
                selectedBrands.remove(brands[index]);
              } else {
                selectedBrands.add(brands[index]);
              }
            });
          },
          selectedColor: Colors.black,
          backgroundColor: Colors.grey.shade300,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        );
      }),
    );
  }

  // COLOR CHIPS
  Widget buildColorChips() {
    return Wrap(
      spacing: 12,
      children: List.generate(
        colorOptions.length,
        (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedColorIndex = index;
              });
            },
            child: CircleAvatar(
              radius: 18,
              backgroundColor: colorOptions[index],
              child: selectedColorIndex == index
                  ? const Icon(Icons.check, color: Colors.white, size: 18)
                  : null,
            ),
          );
        },
      ),
    );
  }
}
