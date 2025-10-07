// lib/main_screen.dart

import 'package:flutter/material.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/pages/explore_page.dart';
import 'package:news_app/pages/article_detail_page.dart';
import 'package:news_app/pages/profile_page.dart';
import 'package:news_app/widgets/bottom_nav_bar.dart';


class MainScreen extends StatefulWidget {
  final void Function(bool) onToggleTheme;
  final bool isDark;

  const MainScreen({super.key, required this.onToggleTheme, required this.isDark});

  @override
State<MainScreen> createState() {
  return _MainScreenState();
  }}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomePage(onArticleSelect: (article) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetailPage(article: article),
              ),
            );
          }),
          ExplorePage(onArticleSelect: (article) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetailPage(article: article),
              ),
            );
          }),
          ProfilePage(
            onToggleTheme: widget.onToggleTheme,
            isDark: widget.isDark,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}