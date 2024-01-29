import 'dart:convert';
import 'package:Netflixapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];

  final String apiKey = 'eabc32e2721074cf5e0211572bfab4b9';
  final String baseUrl = 'https://api.themoviedb.org/3/search/movie';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search for movies',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchMovies,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_searchResults[index]),
                );
              },
            ),
          ),
        ],
      ),
    );  }

  Future<void> _searchMovies() async {
    String query = _searchController.text;

    if (query.isNotEmpty) {
      String apiUrl = '$baseUrl?api_key=$apiKey&query=$query';

      try {
        var response = await http.get(Uri.parse(apiUrl));

        if (response.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(response.body);

          setState(() {
            _searchResults = List.generate(
              data['results'].length,
                  (index) => data['results'][index]['title'].toString(),
            );
          });
        } else {
          throw Exception('Failed to load data');
        }
      } catch (error) {
        print('Error: $error');
      }
    }
  }
}
