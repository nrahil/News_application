import 'package:flutter/material.dart';
import 'package:news_app/data/saved_articles_data.dart'; // Import the new service
import 'package:news_app/widgets/news_card.dart';
import 'package:news_app/pages/article_detail_page.dart';

class SavedArticlesPage extends StatelessWidget {
  const SavedArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final savedArticles = SavedArticlesService().savedArticles;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Saved Articles",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
        ),
        backgroundColor: isDark ? const Color(0xFF212121) : Theme.of(context).primaryColor,
        elevation: 4,
      ),
      body: savedArticles.isEmpty
          ? const Center(
              child: Text(
                "You haven't saved any articles yet.",
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: savedArticles.length,
              itemBuilder: (context, index) {
                final article = savedArticles[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: NewsCard(
                    article: article,
                    onTap: () {
                      // Navigate to the article detail page when tapped
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleDetailPage(article: article)));
                    },
                  ),
                );
              },
            ),
    );
  }
}