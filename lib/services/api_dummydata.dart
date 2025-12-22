import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:furni_mobile_app/product/data/dummyData.dart'; // Your Product Model
import 'package:furni_mobile_app/shop/data/category_model.dart'; // The model above

class ApiService {
  static const String baseUrl = "http://159.65.15.249:1337";

  /// 1. Fetch all products (with Category relations populated)
  static Future<List<Product>> fetchProducts() async {
    // ?populate=* ensures the "Category" table is joined in the response
    final response = await http.get(
      Uri.parse('$baseUrl/api/products?populate=*'),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List data = body['data'];
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  /// 2. Fetch all categories for the Filter Bottom Sheet
  static Future<List<CategoryModel>> fetchCategories() async {
    // This hits your Strapi category endpoint
    final response = await http.get(
      Uri.parse('$baseUrl/api/product-categories'),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List data = body['data'];
      return data.map((e) => CategoryModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
