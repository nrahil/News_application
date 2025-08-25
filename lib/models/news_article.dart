
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
  
  // Method to convert the object to a JSON map
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'subtitle': subtitle,
    'description': description,
    'imageUrl': imageUrl,
    'category': category,
    'sourceUrl': sourceUrl,
    'isTrending': isTrending,
  };

  // Static method to create an object from a JSON map
  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      category: json['category'],
      sourceUrl: json['sourceUrl'],
      isTrending: json['isTrending'],
    );
  }
}