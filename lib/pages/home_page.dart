import 'package:flutter/material.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/data/news_data.dart';
import 'package:news_app/widgets/custom_app_bar.dart';
import 'package:news_app/widgets/trending_news_slider.dart';
import 'package:news_app/widgets/category_tabs.dart';
import 'package:news_app/widgets/news_card.dart';

class HomePage extends StatefulWidget {
  final void Function(NewsArticle) onArticleSelect;

  const HomePage({super. key, required this.onArticleSelect});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';
  late Future<List<NewsArticle>> _futureTrendingNews;
  late Future<List<NewsArticle>> _futureCategoryNews;

  // Define the categories here. You can make this dynamic by fetching them from an API.
  final List<String> _categories = [
    'All',
    'Business',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology'
  ];

  @override
  void initState() {
    super.initState();
    _futureTrendingNews = fetchNewsByCategory('All');
    _futureCategoryNews = fetchNewsByCategory(selectedCategory);
  }

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
      _futureCategoryNews = fetchNewsByCategory(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "NewsApp"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            FutureBuilder<List<NewsArticle>>(
              future: _futureTrendingNews,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return TrendingNewsSlider(
                      news: snapshot.data!, onSelect: widget.onArticleSelect);
                } else {
                  return const Center(child: Text('No trending news found.'));
                }
              },
            ),
            const SizedBox(height: 16),
            CategoryTabs(
              categories: _categories,
              selectedCategory: selectedCategory,
              onCategorySelected: _onCategorySelected,
            ),
            const SizedBox(height: 16),
            FutureBuilder<List<NewsArticle>>(
              future: _futureCategoryNews,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return Column(
                    children: snapshot.data!.map((article) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: NewsCard(
                          article: article,
                          onTap: () => widget.onArticleSelect(article),
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return const Center(
                      child: Text('No news found for this category.'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
