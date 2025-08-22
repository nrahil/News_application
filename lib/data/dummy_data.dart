import 'package:news_app/models/news_article.dart';

final List<String> categories = ['All', 'Sports', 'Politics', 'Business', 'Stockmarket'];

final List<NewsArticle> allNews = [
  NewsArticle(id: 1, title: "Tech Giants Announce New AI Partnership", description: "In a groundbreaking move, leading tech companies have joined forces to develop a new generation of artificial intelligence.", imageUrl: "https://via.placeholder.com/600x400?text=Trending+Tech", category: "Business"),
  NewsArticle(id: 2, title: "Global Sports Event Kicks Off with Fanfare", description: "The highly anticipated sports event has officially started, drawing millions of viewers worldwide.", imageUrl: "https://via.placeholder.com/600x400?text=Trending+Sports", category: "Sports"),
  NewsArticle(id: 3, title: "Economic Summit Concludes with New Trade Agreements", description: "World leaders met to sign new agreements aimed at boosting global trade and cooperation.", imageUrl: "https://via.placeholder.com/600x400?text=Trending+Business", category: "Politics"),
  NewsArticle(id: 4, title: "SpaceX Launches New Satellite Constellation", subtitle: "A new fleet of satellites aims to provide global internet coverage.", imageUrl: "https://via.placeholder.com/100x100?text=News+1", category: "All"),
  NewsArticle(id: 5, title: "New Study Reveals Breakthrough in Cancer Research", subtitle: "Scientists are one step closer to a cure with this new discovery.", imageUrl: "https://via.placeholder.com/100x100?text=News+2", category: "All"),
  NewsArticle(id: 6, title: "Major Politician Announces Retirement", subtitle: "After decades of service, a prominent figure steps down.", imageUrl: "https://via.placeholder.com/100x100?text=News+3", category: "All"),
  NewsArticle(id: 7, title: "Local Team Wins Championship in Thrilling Final", subtitle: "The underdog team took home the trophy in a stunning victory.", imageUrl: "https://via.placeholder.com/100x100?text=Sports+1", category: "Sports"),
  NewsArticle(id: 8, title: "Olympic Gold Medalist Sets New World Record", subtitle: "An incredible performance leads to a new record in the 100-meter dash.", imageUrl: "https://via.placeholder.com/100x100?text=Sports+2", category: "Sports"),
  NewsArticle(id: 9, title: "Government Passes Landmark Climate Bill", subtitle: "The new legislation aims to reduce carbon emissions significantly.", imageUrl: "https://via.placeholder.com/100x100?text=Politics+1", category: "Politics"),
  NewsArticle(id: 10, title: "Tech Startup Reaches Billion-Dollar Valuation", subtitle: "A young company achieves a major milestone in record time.", imageUrl: "https://via.placeholder.com/100x100?text=Business+1", category: "Business"),
  NewsArticle(id: 11, title: "Market Surges on Positive Economic Data", subtitle: "Stocks soar as new reports indicate strong growth.", imageUrl: "https://via.placeholder.com/100x100?text=Stockmarket+1", category: "Stockmarket"),
];