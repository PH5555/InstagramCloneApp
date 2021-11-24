import 'package:flutter/material.dart';
import 'package:instagram_ex/pages/content_list_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = [
    ContentList(),
    Visibility(
      visible: false,
      child: Center(
        child: Text("검색화면"),
      ),
    ),
    Center(
      child: Text("영상화면"),
    ),
    Center(
      child: Text("쇼핑화면"),
    ),
    Center(
      child: Text("프로필화면"),
    ),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'imgs/home.png',
                  width: 20,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'imgs/search.png',
                  width: 20,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'imgs/video.png',
                  width: 20,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'imgs/bag.png',
                  width: 20,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'imgs/profile.png',
                  width: 20,
                ),
                label: ''),
          ],
        ));
  }
}
