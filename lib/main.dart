// lib/main.dart

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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Your full theme data goes here to be accessible throughout the app
      theme: ThemeData(
        fontFamily: 'Open Sans',
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF0F0F0),
        primaryColor: const Color(0xFF1A237E),
        hintColor: const Color(0xFF1A237E),
        cardColor: const Color(0xFFFFFFFF),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Open Sans',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFF1A237E),
        hintColor: const Color(0xFFBB86FC),
        cardColor: const Color(0xFF1E1E1E),
      ),
      themeMode: ThemeMode.light, // This will be dynamic with a provider later
      home: const AuthChecker(),
    );
  }
}