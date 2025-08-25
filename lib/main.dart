// lib/main.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:news_app/main_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

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
        hintColor: const Color(0xFF1A237E),
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
        hintColor: const Color(0xFFBB86FC),
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
      home: AuthChecker(
        onToggleTheme: toggleTheme,
        isDark: _themeMode == ThemeMode.dark,
      ),
    );
  }
}