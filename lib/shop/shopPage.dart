import 'package:flutter/material.dart';
import 'package:furni_mobile_app/Header/header.dart';
import 'package:furni_mobile_app/navbar/navbar.dart';
import 'package:furni_mobile_app/product/data/dummyData.dart'; 
import 'package:furni_mobile_app/services/api_dummydata.dart';
import 'package:furni_mobile_app/shop/widget/filternav.dart';
import 'package:furni_mobile_app/shop/widget/grid.dart';
import 'package:furni_mobile_app/shop/widget/productFilter.dart';
import 'package:furni_mobile_app/shop_page/hero_section.dart';

class Shoppage extends StatefulWidget {
  final String? selectedCategory;
  const Shoppage({super.key, this.selectedCategory});

  @override
  State<Shoppage> createState() => _ShoppageState();
}

class _ShoppageState extends State<Shoppage> {
  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchAndInitProducts();
  }
Future<void> _fetchAndInitProducts() async {
  try {
    final products = await ApiService.fetchProducts();
    
    if (!mounted) return;

    setState(() {
      _allProducts = products;
      
      if (widget.selectedCategory != null && widget.selectedCategory!.isNotEmpty) {
        // 1. CLEAN THE INPUT: 
        // Convert "Living Room Bundle" -> "living room"
        String target = widget.selectedCategory!
            .toLowerCase()
            .replaceAll('bundle', '')
            .trim();

        _filteredProducts = _allProducts.where((p) {
          // 2. NORMALIZE STRAPI DATA:
          String productCat = p.category.toLowerCase().trim();
          String productName = p.name.toLowerCase().trim();

          // 3. MULTI-WAY CHECK:
          // Does the Strapi category contain the keyword? (e.g., "living room" in "living room furniture")
          // Does the keyword contain the Strapi category? (e.g., "living room" in "living room bundle")
          return productCat.contains(target) || 
                 target.contains(productCat) ||
                 productName.contains(target);
        }).toList();
        
        // Fallback: if cleaning was too aggressive and results are 0, show all
        if (_filteredProducts.isEmpty) {
           debugPrint("No results found for cleaned target: $target. Showing all.");
           _filteredProducts = List.from(products);
        }
      } else {
        _filteredProducts = List.from(products);
      }
      
      _isLoading = false;
    });
  } catch (e) {
    debugPrint("Error: $e");
    if (mounted) setState(() => _isLoading = false);
  }
}
  void _applySort(String criteria) {
    setState(() {
      if (criteria == 'C') { // Price: Low to High
        _filteredProducts.sort((a, b) => a.price.compareTo(b.price));
      } else if (criteria == 'D') { // Price: High to Low
        _filteredProducts.sort((a, b) => b.price.compareTo(a.price));
      } else if (criteria == 'B') { // Recently Added (ID)
        _filteredProducts.sort((a, b) => b.id.compareTo(a.id));
      } else if (criteria == 'A') { // Recommended (Rating)
        _filteredProducts.sort((a, b) => b.rating.compareTo(a.rating));
      }
    });
  }

  void _applyFilter(ProductFilter filter) {
    setState(() {
      _filteredProducts = _allProducts.where((product) {
        // Match specific category from the Filter BottomSheet
        final categoryMatch = filter.category == null || 
                             product.category.toLowerCase() == filter.category!.toLowerCase();
        
        // Match Price Range
        final priceMatch = product.price >= filter.minPrice && product.price <= filter.maxPrice;
        
        return categoryMatch && priceMatch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Header(), 
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator(color: Color(0xFF06356B)))
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeroSection(),
                
                Filternav(
                  onFilterApplied: _applyFilter,
                  onSortApplied: _applySort, 
                ),

                _filteredProducts.isEmpty 
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 60),
                        child: Text("No products match this selection."),
                      ),
                    )
                  : ProductGrid(items: _filteredProducts), 
                
                const SizedBox(height: 100),
              ],
            ),
          ),
      bottomNavigationBar: const SizedBox(height: 90, child: GlassFloatingNavBar()),
    );
  }
}