// lib/services/saved_articles_service.dart

import 'package:news_app/models/news_article.dart';

class SavedArticlesService {
  // A private list to store the articles
  final List<NewsArticle> _savedArticles = [];

  // A singleton instance
  static final SavedArticlesService _instance = SavedArticlesService._internal();
  factory SavedArticlesService() {
    return _instance;
  }
  SavedArticlesService._internal();

  // Get a copy of the saved articles list
  List<NewsArticle> get savedArticles => List.unmodifiable(_savedArticles);

  // Method to add an article
  void addArticle(NewsArticle article) {
    if (!_savedArticles.contains(article)) {
      _savedArticles.add(article);
    }
  }

  // Method to remove an article
  void removeArticle(NewsArticle article) {
    _savedArticles.remove(article);
  }

  // Check if an article is already saved
  bool isArticleSaved(NewsArticle article) {
    return _savedArticles.any((element) => element.id == article.id);
  }
}