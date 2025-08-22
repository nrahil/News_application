import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final void Function(String) onSearch;
  final List<String> suggestions;

  const SearchBar({
    super.key,
    required this.onSearch,
    required this.suggestions,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  List<String> filteredSuggestions = [];

  void _onChanged(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredSuggestions = widget.suggestions
            .where((s) => s.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        filteredSuggestions = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          onChanged: _onChanged,
          onSubmitted: (query) => widget.onSearch(query),
          decoration: InputDecoration(
            hintText: "Search for news...",
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(10),
          ),
        ),
        if (_controller.text.isNotEmpty && filteredSuggestions.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredSuggestions.length,
                itemBuilder: (context, index) {
                  final suggestion = filteredSuggestions[index];
                  return ListTile(
                    title: Text(suggestion),
                    onTap: () {
                      _controller.text = suggestion;
                      widget.onSearch(suggestion);
                      setState(() {
                        filteredSuggestions = [];
                      });
                    },
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}