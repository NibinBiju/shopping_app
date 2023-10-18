import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:provider_practise/controller/my_provider/my_provider.dart';
import 'package:provider_practise/views/cart_page.dart';
import 'package:provider_practise/views/favorite_page.dart';
import 'package:provider_practise/views/home_page.dart';
import 'package:provider_practise/views/settings_page.dart';

class MainBottomNavigation extends StatelessWidget {
  MainBottomNavigation({super.key});

  final List pages = [
    Homepage(),
    FavoritePage(),
    CartPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final myprvid = Provider.of<Myprovider>(context);

    return Scaffold(
      body: pages[myprvid.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myprvid.selectedIndex,
        onTap: (value) {
          myprvid.selectedicon(value);
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/home-angle-svgrepo-com.svg'),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/favorite-svgrepo-com.svg'),
              label: 'Favorite'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/bag-svgrepo-com.svg'),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/settings-svgrepo-com (1).svg'),
              label: 'Settings'),
        ],
      ),
    );
  }
}
