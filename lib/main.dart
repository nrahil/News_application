import 'package:flutter/material.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/pages/explore_page.dart';
import 'package:news_app/pages/article_detail_page.dart';
import 'package:news_app/widgets/bottom_nav_bar.dart';
import 'package:news_app/models/news_article.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        fontFamily: 'Open Sans',
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF0F0F0), // A light gray background
        primaryColor: const Color(0xFF1A237E), // A deep blue
        hintColor: const Color(0xFF1A237E), // Accent color for highlights
        cardColor: const Color(0xFFFFFFFF), // White cards
        textTheme: const TextTheme(
            headlineLarge : TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF212121),
          ),
          headlineSmall: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF212121),
          ),
          bodyLarge: TextStyle(
            fontSize: 16.0,
            color: Color(0xFF424242),
          ),
          bodyMedium: TextStyle(
            fontSize: 14.0,
            color: Color(0xFF757575),
          ),
          titleSmall: TextStyle(
            fontSize: 12.0,
            color: Color(0xFF9E9E9E),
          ),
        ),
      ),
      home: Scaffold(
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
            const Center(child: Text("Profile Page", style: TextStyle(color: Color(0xFF212121)))),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}