import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:petpic/community/view/community_screen.dart';
import 'package:petpic/components/my_widgets.dart';
import 'package:petpic/constants/color.dart';
import 'package:petpic/course/view/course_screen.dart';
import 'package:petpic/home/view/home_screen.dart';
import 'package:petpic/my/view/my_screen.dart';
import 'package:petpic/search/view/search_screen.dart';

final List<Widget> _widgetOptions = <Widget>[
  HomeScreen(),
  SearchScreen(),
  CourseScreen(),
  CommunityScreen(),
  MyScreen(),
];

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({super.key});

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    void _onSearchPressed() {
      print('검색어: ${_controller.text}');
    }

    final screenWidth = MediaQuery.of(context).size.width - 34; // 화면넓이
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'images/logo.png',
              width: 115,
            ),
            _selectedIndex == 0
                ? CustomSearchBox(
                    hintText: '검색할 내용을 입력하세요',
                    controller: _controller,
                    onSearchPressed: _onSearchPressed,
                    height: 38,
                    width: screenWidth * 0.5,
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Text('뒤로가기를 한번 더 누르면 앱이 종료됩니다'),
        ),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Icon(
                Icons.home_filled,
                color: _selectedIndex == 0
                    ? CustomColor.primaryColor
                    : CustomColor.iconColor,
              ),
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Icon(
                Icons.search_rounded,
                color: _selectedIndex == 1
                    ? CustomColor.primaryColor
                    : CustomColor.iconColor,
              ),
            ),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Icon(
                Icons.location_on_rounded,
                color: _selectedIndex == 2
                    ? CustomColor.primaryColor
                    : CustomColor.iconColor,
              ),
            ),
            label: '여행코스',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Icon(
                Icons.chat_bubble_rounded,
                color: _selectedIndex == 3
                    ? CustomColor.primaryColor
                    : CustomColor.iconColor,
              ),
            ),
            label: '커뮤니티',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Icon(
                Icons.person,
                color: _selectedIndex == 4
                    ? CustomColor.primaryColor
                    : CustomColor.iconColor,
              ),
            ),
            label: '마이',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: CustomColor.greyFontColor,
        selectedItemColor: CustomColor.primaryColor,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        unselectedFontSize: 13,
        selectedFontSize: 13,
      ),
    );
  }
}
