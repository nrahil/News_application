import 'package:flutter/material.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/data/news_data.dart'; // Import your news service
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
  // Use a Future to hold the results of the API call
  Future<List<NewsArticle>>? _futureSearchResults;
  final List<String> _suggestions = ['SpaceX', 'Politics', 'Sports', 'AI', 'Business'];

  void onSearch(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _futureSearchResults = fetchNewsBySearch(query);
      });
    } else {
      // Clear results if the search query is empty
      setState(() {
        _futureSearchResults = null;
      });
    }
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
                suggestions: _suggestions,
              ),
              const SizedBox(height: 16),
              // Use FutureBuilder to display results from the API
              if (_futureSearchResults == null)
                const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Text(
                    "Search for a news topic.",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              else
                FutureBuilder<List<NewsArticle>>(
                  future: _futureSearchResults,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return Column(
                        children: snapshot.data!.map((article) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: NewsCard(
                              article: article,
                              onTap: () => widget.onArticleSelect(article),
                            ),
                          );
                        }).toList(),
                      );
                    } else {
                      return const Center(child: Text('No news found for your search.'));
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}