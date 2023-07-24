import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rutech_mobile/pages/about_page.dart';
import 'package:rutech_mobile/pages/home_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      backgroundColor: Color.fromRGBO(32, 27, 57, 1),
      // index: _selectedIndex,
      animationDuration: Duration(milliseconds: 500),
      // onTap: (index) {
      //   setState(() {
      //     _selectedIndex = index;
      //   });

      //   // Выполняйте переход на другую страницу в зависимости от выбранного индекса
      //   switch (_selectedIndex) {
      //     case 0:
      //       Navigator.of(context)
      //           .push(MaterialPageRoute(builder: (context) => HomePage()));
      //       break;
      //     case 1:
      //       Navigator.of(context)
      //           .push(MaterialPageRoute(builder: (context) => HomePage()));
      //       break;
      //     case 2:
      //       Navigator.of(context)
      //           .push(MaterialPageRoute(builder: (context) => AboutPage()));
      //       break;
      //   }
      // },
      color: Colors.white,
      items: <Widget>[
        Icon(
          Icons.home,
          color: Colors.black,
        ),
        Icon(
          Icons.school,
          color: Colors.black,
        ),
        Icon(
          Icons.info,
          color: Colors.black,
        ),
      ],
      onTap: (index) {
        setState(() {
          _page = index;
        });
      },
    );
  }
}
