import 'package:flutter/material.dart';
import 'package:rutech_mobile/models/languagesList.dart';
import 'package:rutech_mobile/pages/about_page.dart';
import '../utils/BottomNavBar.dart';
import '../utils/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Add a TextEditingController for the search field
  final TextEditingController _searchController = TextEditingController();

  String resTest = ""; // for test

  // Add a list to store the search results
  List<Map<String, dynamic>> _searchResults = [];

  LanguagesList ls = LanguagesList();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Method to filter the languages based on the search query
  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _searchResults = ls.languages
          .where((language) => language['name'].toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(124, 77, 255, 1),
      bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Russian Tech",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => print('Test: Click favorite icon ✅'),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  // search
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: SearchBarLang(
                            controller: _searchController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  // Text Language Programming like
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Russian Tech - new features!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                color: Color.fromRGBO(21, 21, 34, 0.9),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Выберите язык программирования',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Icon(Icons.computer, color: Colors.white),
                        ],
                      ),
                      SizedBox(height: 25),

                      // list languages
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemCount: _searchResults.length,
                            itemBuilder: (BuildContext context, int index) {
                              final language = _searchResults[index];
                              return Container(
                                // color: Colors.black,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  leading: Icon(language['icon'],
                                      size: 50, color: Colors.white),
                                  title: Text(
                                    language['name'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    'Введение в ${language['name']}',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}