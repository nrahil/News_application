// lib/pages/saved_articles_page.dart
import 'package:flutter/material.dart';

class SavedArticlesPage extends StatelessWidget {
  const SavedArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Saved Articles",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: isDark ? Colors.white : Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 4,
      ),
      body: Center(
        child: Text(
          "Your saved articles will appear here.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}