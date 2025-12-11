import 'package:flutter/material.dart';
import 'package:furni_project/data/dummy_data.dart';
import 'package:furni_project/home_page/widget.dart';

class NewArrival extends StatefulWidget {
  const NewArrival({super.key});

  @override
  State<NewArrival> createState() => _NewArrivalState();
}

class _NewArrivalState extends State<NewArrival> {
  final PageController _controller = PageController(viewportFraction: 0.75);
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 18),
          child: Text(
            'New',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 18),
          child: Text(
            'Arrivals',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),

        const SizedBox(height: 20),

        // ---------------- Product Slider ----------------
        SizedBox(
          height: 380,
          child: PageView.builder(
            controller: _controller,
            itemCount: dummyData.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  double scale = (1 - ((_currentPage - index).abs() * 0.1))
                      .clamp(0.9, 1.0);

                  return Transform.scale(
                    scale: scale,
                    child: NewProductCard(item: dummyData[index]),
                  );
                },
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        // ---------------- Indicator Bar ----------------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(50),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: (_currentPage + 1) / dummyData.length,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // ---------------- More Products ----------------
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
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
                    'More Products',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Icon(Icons.arrow_forward, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
