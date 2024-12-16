import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  // Original list of items
  final List<String> allItems = [
    'Apple',
    'Banana',
    'Orange',
    'Grapes',
    'Pineapple',
    'Strawberry',
    'Mango',
    'Watermelon',
    'Peach',
    'Kiwi',
  ];

  // Filtered list to display in the UI
  List<String> filteredItems = [];

  // Controller for the search field
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = allItems; // Initialize with all items
    _searchController.addListener(_filterItems); // Add listener to controller
  }

  @override
  void dispose() {
    _searchController.dispose(); // Dispose of the controller
    super.dispose();
  }

  // Function to filter items based on search query
  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredItems =
          allItems.where((item) => item.toLowerCase().contains(query)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: filteredItems.isNotEmpty
          ? ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.search),
                  title: Text(filteredItems[index]),
                );
              },
            )
          : const Center(
              child: Text(
                'No results found',
                style: TextStyle(fontSize: 18),
              ),
            ),
    );
  }
}
