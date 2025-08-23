import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/login_page.dart';
import 'package:news_app/widgets/main_app_wrapper.dart';

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
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          // User is logged in, show the MainAppWrapper and pass the theme state down
          return MainAppWrapper(onToggleTheme: onToggleTheme, isDark: isDark);
        }
        // User is not logged in, show the LoginPage
        return const LoginPage();
      },
    );
  }
}