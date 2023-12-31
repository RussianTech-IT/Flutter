import 'package:flutter/material.dart';
import 'package:rutech_mobile/pages/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String main_text =
      "Russian Tech - это проект, который даёт возможность обучаться программированию новичкам бесплатно, у нас есть социальные сети, сайт, на котором вы можете изучить кучу материалов, а так же в социальных сетях мы делимся новыми фишками и технологиями!";
  String resTest = '';
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

    if (index == 0) {
      resTest = 'Home';
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    } else if (index == 1) {
      resTest = 'Books';
    } else if (index == 2) {
      resTest = 'About';
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AboutPage()));
    }
    print('Clicked Bottom Navigator $resTest element ✅');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 27, 57, 1),
      appBar: AppBar(
        title: Text(
          'About Russian Tech',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: Text(
                      main_text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
