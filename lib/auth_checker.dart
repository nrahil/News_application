import 'package:news_app/pages/login_page.dart';
import 'package:news_app/data/saved_articles_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/main_screen.dart';

class AuthChecker extends StatelessWidget {
  final void Function(bool) onToggleTheme;
  final bool isDark;

  const AuthChecker({super.key, required this.onToggleTheme, required this.isDark});

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
