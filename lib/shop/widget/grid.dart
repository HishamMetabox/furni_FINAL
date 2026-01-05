import 'package:flutter/material.dart';
import 'package:furni_mobile_app/product/Product_page.dart'; 
import 'package:furni_mobile_app/product/data/dummyData.dart';
import 'package:furni_mobile_app/product/widget/rating_star.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key, required this.items});
  final List<Product> items;

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        childAspectRatio: 0.55,
      ),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  // Navigates to ProductPage using the ID and required callback
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(
                        product_id: item.id, 
                        onQuantityChanged: (qty) => debugPrint("Qty: $qty"),
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(item.display_image),
                      fit: BoxFit.cover,
                      onError: (e, s) => const Icon(Icons.broken_image, size: 40),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 8,
                        left: 8,
                        right: 8,
                        child: SizedBox(
                          height: 35,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 6, 53, 107),
                              padding: EdgeInsets.zero,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              // Cart logic: Add item.id to your cart provider/state
                              debugPrint("Added ${item.name} to cart");
                            },
                            child: const Text(
                              'Add to Cart',
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Text Details Section
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingStar(initialRating: item.rating),
                  const SizedBox(height: 6),
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Rs ${item.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}