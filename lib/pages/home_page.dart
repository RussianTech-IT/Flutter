import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final List<Map<String, dynamic>> _languages = [
  //   {'name': 'JavaScript', 'icon': Icons.code},
  //   {'name': 'Python', 'icon': Icons.code},
  //   {'name': 'Java', 'icon': Icons.code},
  //   {'name': 'C++', 'icon': Icons.code},
  //   {'name': 'Swift', 'icon': Icons.code},
  //   {'name': 'Ruby', 'icon': Icons.code},
  // ]; // test array for list languages

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: ''),
        ]),
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // Logo Text
                    children: [
                      Text(
                        "Russian Tech",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () => print('Test: Click favorite icon ✅'),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(12)),
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  // search
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Row(children: [
                      Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Поиск'),
                    ]),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  // Text Language Programming like
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Russian Tech - new features!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
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
                                color: Colors.white),
                          ),
                          Icon(Icons.more_horiz, color: Colors.white),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      // list languages
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.javascript, size: 50,),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // title
                                Text(
                                  'JavaScript',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                // subtitle
                                Text('Введение в JavaScript')
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
