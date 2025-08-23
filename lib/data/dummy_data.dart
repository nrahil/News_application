import 'package:news_app/models/news_article.dart';

// lib/data/dummy_data.dart

final List<String> categories = ['All', 'Sports', 'Politics', 'Business', 'Stockmarket'];

final List<NewsArticle> allNews = [
  // These are the trending news articles for the slider.
  NewsArticle(id: 1, title: "Tech Giants Announce New AI Partnership", description: "In a groundbreaking move, leading tech companies have joined forces to develop a new generation of artificial intelligence.", imageUrl: "https://images.pexels.com/photos/347141/pexels-photo-347141.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", category: "Trending", isTrending: true),
  NewsArticle(id: 2, title: "Global Sports Event Kicks Off with Fanfare", description: "The highly anticipated sports event has officially started, drawing millions of viewers worldwide.", imageUrl: "https://images.pexels.com/photos/1103829/pexels-photo-1103829.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", category: "Trending", isTrending: true),
  NewsArticle(id: 3, title: "Economic Summit Concludes with New Trade Agreements", description: "World leaders met to sign new agreements aimed at boosting global trade and cooperation.", imageUrl: "https://images.pexels.com/photos/209224/pexels-photo-209224.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", category: "Trending", isTrending: true),
  
  // These are the regular news articles for the main list.
  NewsArticle(id: 4, title: "SpaceX Launches New Satellite Constellation", subtitle: "A new fleet of satellites aims to provide global internet coverage.", imageUrl: "https://images.pexels.com/photos/1036808/pexels-photo-1036808.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", category: "All"),
  NewsArticle(id: 5, title: "New Study Reveals Breakthrough in Cancer Research", subtitle: "Scientists are one step closer to a cure with this new discovery.", imageUrl: "https://images.pexels.com/photos/3845129/pexels-photo-3845129.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", category: "All"),
  NewsArticle(id: 6, title: "Major Politician Announces Retirement", subtitle: "After decades of service, a prominent figure steps down.", imageUrl: "https://images.pexels.com/photos/2260840/pexels-photo-2260840.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", category: "All"),
  NewsArticle(id: 7, title: "Local Team Wins Championship in Thrilling Final", subtitle: "The underdog team took home the trophy in a stunning victory.", imageUrl: "https://images.pexels.com/photos/248547/pexels-photo-248547.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", category: "Sports"),
  NewsArticle(id: 8, title: "Olympic Gold Medalist Sets New World Record", subtitle: "An incredible performance leads to a new record in the 100-meter dash.", imageUrl: "https://images.pexels.com/photos/1960207/pexels-photo-1960207.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", category: "Sports"),
  NewsArticle(id: 9, title: "Government Passes Landmark Climate Bill", subtitle: "The new legislation aims to reduce carbon emissions significantly.", imageUrl: "https://images.pexels.com/photos/2623348/pexels-photo-2623348.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", category: "Politics"),
  NewsArticle(id: 10, title: "Tech Startup Reaches Billion-Dollar Valuation", subtitle: "A young company achieves a major milestone in record time.", imageUrl: "https://images.pexels.com/photos/207865/pexels-photo-207865.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", category: "Business"),
  NewsArticle(id: 11, title: "Market Surges on Positive Economic Data", subtitle: "Stocks soar as new reports indicate strong growth.", imageUrl: "https://images.pexels.com/photos/209151/pexels-photo-209151.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", category: "Stockmarket"),
];