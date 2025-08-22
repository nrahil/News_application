import 'package:flutter/material.dart';
import 'package:news_app/data/dummy_data.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/widgets/custom_app_bar.dart';
import 'package:news_app/widgets/trending_news_slider.dart';
import 'package:news_app/widgets/category_tabs.dart';
import 'package:news_app/widgets/news_card.dart';

class HomePage extends StatefulWidget {
  final void Function(NewsArticle) onArticleSelect;

  const HomePage({super.key, required this.onArticleSelect});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';

  List<NewsArticle> getNewsForCategory(String category) {
    if (category == 'All') {
      return allNews.where((article) => !article.imageUrl.contains('Trending')).toList();
    }
    return allNews.where((article) => article.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    final trendingNews = allNews.where((article) => article.imageUrl.contains('Trending')).toList();
    final newsToDisplay = getNewsForCategory(selectedCategory);

    return Scaffold(
      appBar: const CustomAppBar(title: "Daily Brief"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TrendingNewsSlider(news: trendingNews, onSelect: widget.onArticleSelect),
            const SizedBox(height: 16),
            CategoryTabs(
              categories: categories,
              selectedCategory: selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
            const SizedBox(height: 16),
            ...newsToDisplay.map((article) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: NewsCard(
                  article: article,
                  onTap: () => widget.onArticleSelect(article),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}