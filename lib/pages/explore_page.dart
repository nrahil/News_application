import 'package:flutter/material.dart';
import 'package:news_app/data/dummy_data.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/widgets/custom_app_bar.dart';
import 'package:news_app/widgets/search_bar.dart' as custom_widgets;
import 'package:news_app/widgets/news_card.dart';

class ExplorePage extends StatefulWidget {
  final void Function(NewsArticle) onArticleSelect;

  const ExplorePage({super.key, required this.onArticleSelect});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<NewsArticle> searchResults = [];

  void onSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        searchResults = [];
      });
      return;
    }
    setState(() {
      searchResults = allNews.where((article) =>
          article.title.toLowerCase().contains(query.toLowerCase()) ||
          (article.subtitle != null && article.subtitle!.toLowerCase().contains(query.toLowerCase()))
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Explore News"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              custom_widgets.SearchBar(
                onSearch: onSearch,
                suggestions: allNews.map((e) => e.title).toList(),
              ),
              const SizedBox(height: 16),
              if (searchResults.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Text(
                    "Search for a news topic.",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              else
                ...searchResults.map((article) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: NewsCard(
                      article: article,
                      onTap: () => widget.onArticleSelect(article),
                    ),
                  );
                }),
            ],
          ),
        ),
      ),
    );
  }
}