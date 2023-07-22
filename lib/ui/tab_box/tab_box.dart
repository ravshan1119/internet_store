import 'package:flutter/material.dart';
import 'package:internet_store/data/network/providers/api_provider.dart';
import 'package:internet_store/data/network/repositories/category_repo.dart';
import 'package:internet_store/data/network/repositories/product_repo.dart';
import 'package:internet_store/data/network/repositories/user_repo.dart';
import 'package:internet_store/ui/cart/cart_screen.dart';
import 'package:internet_store/ui/favorite/favorite_screen.dart';
import 'package:internet_store/ui/home/home_screen.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key, required this.apiProvider});

  final ApiProvider apiProvider;

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
  ];

  late ProductRepo productRepo;
  late UserRepo userRepo;
  late CategoryRepo categoryRepo;

  @override
  void initState() {
    productRepo = ProductRepo(apiProvider: widget.apiProvider);
    userRepo = UserRepo(apiProvider: widget.apiProvider);
    categoryRepo = CategoryRepo(apiProvider: widget.apiProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Favourites',
                ),
                GButton(
                  icon: LineIcons.shoppingCart,
                  text: 'Cart',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
