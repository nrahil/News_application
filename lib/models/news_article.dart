class NewsArticle {
  final int id;
  final String title;
  final String? subtitle;
  final String? description;
  final String imageUrl;
  final String? category;
  final String? sourceUrl;

  NewsArticle({
    required this.id,
    required this.title,
    this.subtitle,
    this.description,
    required this.imageUrl,
    this.category,
    this.sourceUrl,
  });
}