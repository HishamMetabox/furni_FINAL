import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:furni_mobile_app/product/widget/rating_star.dart';
import 'package:furni_mobile_app/product/data/reviewdata.dart';
import 'package:furni_mobile_app/services/api_review.dart';
class Review extends StatefulWidget {
  const Review({super.key, required this.productId});
  final String productId;

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final ReviewService _reviewService = ReviewService();

  Future<List<ReviewWeb>> _fetchReviews() {
    return _reviewService.fetchReviewWebs(productId: widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ReviewWeb>>(
      future: _fetchReviews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No reviews yet."));
        }

        final reviews = snapshot.data!;
        return Column(
          children: reviews.map((r) {
            return ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(r.pictureUrl)),
              title: Text(r.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingStar(initialRating: r.rating, readOnly: true),
                  Text(r.comment),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
