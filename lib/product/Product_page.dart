import 'package:flutter/material.dart';
import 'package:furni_mobile_app/Header/header.dart';
import 'package:furni_mobile_app/navbar/navbar.dart';
import 'package:furni_mobile_app/product/data/dummyData.dart';
import 'package:furni_mobile_app/product/widget/Add_review.dart';
import 'package:furni_mobile_app/product/widget/details_card.dart';
import 'package:furni_mobile_app/product/widget/display_images.dart';
import 'package:furni_mobile_app/product/widget/navigation.dart';
import 'package:furni_mobile_app/product/widget/review.dart';
import 'package:furni_mobile_app/services/api_dummydata.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.onQuantityChanged,
    required this.product_id,
    this.initialQuantity = 1,
    this.initialColor,
  });

  final void Function(int) onQuantityChanged;
  final int product_id;
  final int initialQuantity;
  final String? initialColor;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  void _refreshReviews() {
    setState(() {}); // triggers rebuild, which refetches Review's FutureBuilder
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: ApiService.fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return Scaffold(
            body: Center(child: Text("Error: ${snapshot.error ?? 'No data found'}")),
          );
        }

        // Find the specific product
        final productList = snapshot.data!;
        final product = productList.firstWhere(
          (p) => p.id == widget.product_id,
          orElse: () => productList.first,
        );

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: const Header(),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Navigation(),
                const SizedBox(height: 16),

                // Product Images
                SizedBox(
                  height: 414,
                  width: double.infinity,
                  child: DisplayImages(display_image: product.images,),
                ),
                const SizedBox(height: 16),

                // Details Card
                DetailsCard(
                  name: product.name,
                  category: product.category,
                  colours: product.colours,
                  description: product.description,
                  measurements: product.measurements,
                  price: product.price,
                  rating: product.rating,
                  quantity: widget.initialQuantity,
                  initialColor: widget.initialColor,
                  image: product.display_image,
                  productId: widget.product_id,
                  onQuantityChanged: (qtyMap) {
                    widget.onQuantityChanged(qtyMap[widget.product_id] ?? 1);
                  },
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 1.5),
                const SizedBox(height: 15),

                // Add Review
                AddReview(
                  productId: widget.product_id.toString(),
                  onReviewPosted: _refreshReviews,
                ),
                const SizedBox(height: 20),

                // Reviews List
                Review(productId: widget.product_id.toString()),
              ],
            ),
          ),
          bottomNavigationBar: const SizedBox(
            height: 90,
            child: GlassFloatingNavBar(),
          ),
        );
      },
    );
  }
}