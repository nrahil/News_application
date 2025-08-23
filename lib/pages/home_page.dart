import 'package:flutter/material.dart';
import 'package:news_app/data/dummy_data.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/widgets/custom_app_bar.dart';
import 'package:news_app/widgets/trending_news_slider.dart';
import 'package:news_app/widgets/category_tabs.dart';
import 'package:news_app/widgets/news_card.dart';

class HomePage extends StatefulWidget {
  final void Function(NewsArticle) onArticleSelect;

  const HomePage({Key? key, required this.onArticleSelect}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';

  List<NewsArticle> getNewsForCategory(String category) {
    if (category == 'All') {
      // Exclude trending news from the main list
      return allNews.where((article) => !article.imageUrl.contains('600x400')).toList();
    }
    return allNews.where((article) => article.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    // Filter for trending news items to be passed to the slider
    final trendingNews = allNews.where((article) => article.imageUrl.contains('600x400')).toList();
    final newsToDisplay = getNewsForCategory(selectedCategory);

    return Scaffold(
      appBar: const CustomAppBar(title: "Daily Brief"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Pass the trendingNews list to the slider
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
            }).toList(),
          ],
        ),
      ),
    );
  }
}