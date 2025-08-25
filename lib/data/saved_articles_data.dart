import 'package:news_app/models/news_article.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';

class SavedArticlesService {
  final List<NewsArticle> _savedArticles = [];
  bool _isInitialized = false;

  static final SavedArticlesService _instance = SavedArticlesService._internal();
  factory SavedArticlesService() {
    return _instance;
  }
  SavedArticlesService._internal();

  // This is the missing 'init' method. It initializes the service for the current user.
  Future<void> init(String userId) async {
    if (_isInitialized) {
      return;
    }
    
    final prefs = await SharedPreferences.getInstance();
    final articlesJson = prefs.getStringList('savedArticles_$userId') ?? [];
    
    _savedArticles.clear();
    for (var jsonString in articlesJson) {
      _savedArticles.add(NewsArticle.fromJson(json.decode(jsonString)));
    }
    _isInitialized = true;
  }

  // Get a copy of the saved articles list
  List<NewsArticle> get savedArticles => List.unmodifiable(_savedArticles);

  // Method to save articles to SharedPreferences
  Future<void> _saveArticles() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    
    final prefs = await SharedPreferences.getInstance();
    final articlesJson = _savedArticles.map((article) => json.encode(article.toJson())).toList();
    await prefs.setStringList('savedArticles_${user.uid}', articlesJson);
  }
  
  // Method to clear articles on logout
  Future<void> clear() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('savedArticles_${user.uid}');
    _savedArticles.clear();
    _isInitialized = false;
  }

  // Method to add an article
  void addArticle(NewsArticle article) {
    if (!_savedArticles.any((element) => element.id == article.id)) {
      _savedArticles.add(article);
      _saveArticles();
    }
  }

  // Method to remove an article
  void removeArticle(NewsArticle article) {
    _savedArticles.removeWhere((element) => element.id == article.id);
    _saveArticles();
  }

  // Check if an article is already saved
  bool isArticleSaved(NewsArticle article) {
    return _savedArticles.any((element) => element.id == article.id);
  }
}