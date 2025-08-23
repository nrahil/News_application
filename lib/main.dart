import 'package:flutter/material.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/pages/explore_page.dart';
import 'package:news_app/pages/article_detail_page.dart';
import 'package:news_app/pages/profile_page.dart';
import 'package:news_app/widgets/bottom_nav_bar.dart';
import 'package:news_app/widgets/custom_app_bar.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/pages/saved_articles_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  ThemeMode _themeMode = ThemeMode.light;

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

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        fontFamily: 'Open Sans',
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF0F0F0),
        primaryColor: const Color(0xFF1A237E),
        hintColor: const Color(0xFF1A237E), // Replaced accentColor with hintColor
        cardColor: const Color(0xFFFFFFFF),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF212121),
          ),
          headlineMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF212121),
          ),
          bodyMedium: TextStyle(
            fontSize: 16.0,
            color: Color(0xFF424242),
          ),
          bodySmall: TextStyle(
            fontSize: 14.0,
            color: Color(0xFF757575),
          ),
          labelSmall: TextStyle(
            fontSize: 12.0,
            color: Color(0xFF9E9E9E),
          ),
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Open Sans',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFF1A237E),
        hintColor: const Color(0xFFBB86FC), // Replaced accentColor with hintColor
        cardColor: const Color(0xFF1E1E1E),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFFF8F8F8),
          ),
          headlineMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFFF8F8F8),
          ),
          bodyMedium: TextStyle(
            fontSize: 16.0,
            color: Color(0xFFC0C0C0),
          ),
          bodySmall: TextStyle(
            fontSize: 14.0,
            color: Color(0xFFC0C0C0),
          ),
          labelSmall: TextStyle(
            fontSize: 12.0,
            color: Color(0xFF888888),
          ),
        ),
      ),
      themeMode: _themeMode,
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
            ProfilePage(
              onToggleTheme: toggleTheme,
              isDark: _themeMode == ThemeMode.dark,
            ),
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