// lib/services/news_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/models/news_article.dart';

const String apiKey = '1fba5d65c5d9485e92c958d8d8e28ff8';
const String _baseUrl = 'https://newsapi.org/v2';

Future<List<NewsArticle>> fetchNewsByCategory(String category) async {
  final isTrending = category.toLowerCase() == 'all';
  final url = isTrending
      ? Uri.parse('$_baseUrl/top-headlines?country=us&apiKey=$apiKey')
      : Uri.parse('$_baseUrl/top-headlines?country=us&category=$category&apiKey=$apiKey');
      
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = json.decode(response.body);
    final List<dynamic> articles = jsonData['articles'];

    if (articles.isEmpty) {
      return [];
    }

    final List<NewsArticle> newsList = articles.map((article) {
      final String imageUrl = article['urlToImage'] ?? 'https://via.placeholder.com/150';

      return NewsArticle(
        id: articles.indexOf(article),
        title: article['title'] ?? 'No Title',
        subtitle: article['description'] ?? 'No Subtitle',
        description: article['content'] ?? 'No Description',
        imageUrl: imageUrl,
        category: category,
        isTrending: isTrending,
        sourceUrl: article['url'],

      );
    }).toList();

    return newsList;
  } else {
    throw Exception('Failed to load news for category: $category (Status Code: ${response.statusCode})');
  }
}

// New function to fetch news based on a search query
Future<List<NewsArticle>> fetchNewsBySearch(String query) async {
  final url = Uri.parse('$_baseUrl/everything?q=$query&sortBy=publishedAt&language=en&apiKey=$apiKey');
      
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = json.decode(response.body);
    final List<dynamic> articles = jsonData['articles'];

    if (articles.isEmpty) {
      return [];
    }

    final List<NewsArticle> newsList = articles.map((article) {
      final String imageUrl = article['urlToImage'] ?? 'https://via.placeholder.com/150';

      return NewsArticle(
        id: articles.indexOf(article),
        title: article['title'] ?? 'No Title',
        subtitle: article['description'] ?? 'No Subtitle',
        description: article['content'] ?? 'No Description',
        imageUrl: imageUrl,
        category: 'Search',
        isTrending: false,
        sourceUrl: article['url'],
      );
    }).toList();

    return newsList;
  } else {
    throw Exception('Failed to load news for search: $query (Status Code: ${response.statusCode})');
  }
}