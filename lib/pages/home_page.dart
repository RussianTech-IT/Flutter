import 'package:flutter/material.dart';
import 'package:rutech_mobile/models/languagesList.dart';
import 'package:rutech_mobile/pages/about_page.dart';
import '../utils/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // navigation
  // int _selectedIndex = 0;

  // List<Widget> _pages = [
  //   HomePage(),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // Add a TextEditingController for the search field
  final TextEditingController _searchController = TextEditingController();

  String resTest = ""; // for test

  // Add a list to store the search results
  List<Map<String, dynamic>> _searchResults = [];

  // Define your languages list here
  final List<Map<String, dynamic>> _languages = [
    {'name': 'JavaScript', 'icon': Icons.code},
    {'name': 'Python', 'icon': Icons.code},
    {'name': 'Java', 'icon': Icons.code},
    {'name': 'C++', 'icon': Icons.code},
    {'name': 'Swift', 'icon': Icons.code},
    {'name': 'Ruby', 'icon': Icons.code},
  ];

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

  // bottom el
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Books',
      style: optionStyle,
    ),
    Text(
      'Index 2: About',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // for test

    if (index == 0) {
      resTest = "Home";
    } else if (index == 1) {
      resTest = "Books";
    } else if (index == 2) {
      resTest = "About";
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutPage()));
    }
    print('Clicked Bottom Navigator ${resTest} element ✅');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Books'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
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

void test_search() {
  print("Text");
}

/*
  {'name': 'JavaScript', 'icon': Icons.code},
  {'name': 'Python', 'icon': Icons.code},
  {'name': 'Java', 'icon': Icons.code},
  {'name': 'C++', 'icon': Icons.code},
  {'name': 'Swift', 'icon': Icons.code},
  {'name': 'Ruby', 'icon': Icons.code},
*/