import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool _showSearch = false;
 
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  void clear(){
    _searchController.clear();
  }

  Widget _searchIcon(){
    return IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/search.svg',
                    width: 24,
                    height: 24,
                  ),
                 
                  onPressed: () {
                    setState(() {
                      debugPrint('Search for: ${_searchController.text}');
                      _searchController.clear();
                      _showSearch = !_showSearch;
                    });
                  },
                );
    
  }

  Widget _buildSearchBar() {
    return Container(
      height: 35,
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.grey.shade400),
        color: Colors.white,
      ),
      child: Center(
        child: TextFormField(
          
          controller: _searchController,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: IconButton(
                onPressed: (){clear();},
                icon: const Icon(Icons.close),
                iconSize: 18,
                padding: EdgeInsets.zero, // remove internal padding
                constraints: const BoxConstraints(
                  minWidth: 24,
                  minHeight: 24,
                ),
              
              ),
            ),         
            hintText: 'Search...',
            hintStyle: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 14),
            suffixIcon: _searchIcon(),
            border: InputBorder.none,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          ),
          textInputAction: TextInputAction.search,
          onFieldSubmitted: (value) {
            debugPrint('Search for: $value');
            _searchController.clear();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/furniLogo.svg',
            width: 100,
            height: 90,
          ),

          const Spacer(),
          if (_showSearch) _buildSearchBar(),
        
          Row(
            children: [
          if (!_showSearch) _searchIcon(),
            ],
          ),
        ],
      ),
    );
  }
}
