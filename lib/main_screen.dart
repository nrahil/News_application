// lib/main_screen.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/login_page.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/pages/explore_page.dart';
import 'package:news_app/pages/article_detail_page.dart';
import 'package:news_app/pages/profile_page.dart';
import 'package:news_app/widgets/bottom_nav_bar.dart';
import 'package:news_app/data/saved_articles_data.dart';

class AuthChecker extends StatelessWidget {
  final void Function(bool) onToggleTheme;
  final bool isDark;

  const AuthChecker({Key? key, required this.onToggleTheme, required this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasData) {
          // Initialize the saved articles service with the user's UID
          SavedArticlesService().init(snapshot.data!.uid);
          return MainScreen(onToggleTheme: onToggleTheme, isDark: isDark);
        }
        return const LoginPage();
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  final void Function(bool) onToggleTheme;
  final bool isDark;

  const MainScreen({Key? key, required this.onToggleTheme, required this.isDark}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

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