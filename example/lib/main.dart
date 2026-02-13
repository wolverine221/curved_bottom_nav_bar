import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:curved_bottom_nav_bar/curved_bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Curved Bottom Nav Bar Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
          ),
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  // Example 1: Using Material Icons
  final List<NavBarItem> _iconItems = [
    const NavBarItem(
      icon: Icons.home,
      label: 'Home',
    ),
    const NavBarItem(
      icon: Icons.search,
      label: 'Search',
    ),
    const NavBarItem(
      icon: Icons.favorite,
      label: 'Favorite',
    ),
    const NavBarItem(
      icon: Icons.person,
      label: 'Profile',
    ),
  ];

  // Example 2: Using Asset Images (uncomment to use)
  // final List<NavBarItem> _assetItems = [
  //   const NavBarItem(
  //     icon: 'assets/icons/home.png',
  //     label: 'Home',
  //   ),
  //   const NavBarItem(
  //     icon: 'assets/icons/search.png',
  //     label: 'Search',
  //   ),
  //   const NavBarItem(
  //     icon: 'assets/icons/favorite.png',
  //     label: 'Favorite',
  //   ),
  //   const NavBarItem(
  //     icon: 'assets/icons/profile.png',
  //     label: 'Profile',
  //   ),
  // ];

  final List<Color> _pageColors = [
    Colors.blue.shade50,
    Colors.purple.shade50,
    Colors.pink.shade50,
    Colors.orange.shade50,
  ];

  final List<String> _pageTitles = [
    'Home',
    'Search',
    'Favorite',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageColors[_currentIndex],
      appBar: AppBar(
        title: Text(_pageTitles[_currentIndex]),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: _buildBody(),
      bottomNavigationBar: CurvedBottomNavBar(
        items: _iconItems, // Change to _assetItems to use asset icons
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // Customization options (uncomment to customize)
        backgroundColor: Colors.white,
        selectedColor: _getSelectedColor(),
        selectedSecondaryColor: _getSelectedSecondaryColor(),
        unselectedColor: Colors.grey,
        shadowColor: Colors.black26,
        // height: 80,
        // floatingButtonSize: 65,
        // iconSize: 26,
        // curveDepth: 40,
        // animationDuration: Duration(milliseconds: 400),
      ),
    );
  }

  Color _getSelectedColor() {
    switch (_currentIndex) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.purple;
      case 2:
        return Colors.pink;
      case 3:
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }

  Color _getSelectedSecondaryColor() {
    switch (_currentIndex) {
      case 0:
        return Colors.blue.shade300;
      case 1:
        return Colors.purple.shade300;
      case 2:
        return Colors.pink.shade300;
      case 3:
        return Colors.orange.shade300;
      default:
        return Colors.blue.shade300;
    }
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _iconItems[_currentIndex].icon as IconData,
            size: 100,
            color: _getSelectedColor(),
          ),
          const SizedBox(height: 20),
          Text(
            '${_pageTitles[_currentIndex]} Page',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: _getSelectedColor(),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Index: $_currentIndex',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
