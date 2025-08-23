// lib/models/news_article.dart
class NewsArticle {
  final int id;
  final String title;
  final String? subtitle;
  final String? description;
  final String imageUrl;
  final String? category;
  final String? sourceUrl;
  final bool isTrending;

  NewsArticle({
    required this.id,
    required this.title,
    this.subtitle,
    this.description,
    required this.imageUrl,
    this.category,
    this.sourceUrl,
    this.isTrending = false,
  });
}