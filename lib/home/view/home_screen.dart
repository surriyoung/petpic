import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:petpic/components/home_widgets.dart';
import 'package:petpic/components/my_widgets.dart';
import 'package:petpic/constants/color.dart';
import 'package:petpic/constants/font_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    void _onSearchPressed() {
      print('검색어: ${_controller.text}');
    }

    final screenWidth = MediaQuery.of(context).size.width; // 화면넓이
    final double statusBarSize = MediaQuery.of(context).padding.top;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    // 예시 데이터
    final List<Map<String, String>> travelData = [
      {
        'category': 'Category1',
        'name': '어쩌고 여행지 1',
        'explain': '여행지에 대한 설명',
        'imageUrl': 'images/sample.png'
      },
      {
        'category': 'Category1',
        'name': '어쩌고 여행지 2',
        'explain': '여행지에 대한 설명',
        'imageUrl': 'images/sample.png'
      },
      {
        'category': 'Category1',
        'name': '어쩌고 여행지 3',
        'explain': '여행지에 대한 설명',
        'imageUrl': 'images/sample.png'
      },
      {
        'category': 'Category1',
        'name': '어쩌고 여행지 4',
        'explain': '여행지에 대한 설명',
        'imageUrl': 'images/sample.png'
      },
      {
        'category': 'Category1',
        'name': '어쩌고 여행지 5',
        'explain': '여행지에 대한 설명',
        'imageUrl': 'images/sample.png'
      },
    ];

    final List<Map<String, String>> withData = [
      {
        'category': 'Category2',
        'place': '대구시 수성구',
        'name': '어쩌고저쩌고 카페 1',
        'explain': '여행지에 대한 설명',
        'imageUrl': 'images/sample.png'
      },
      {
        'category': 'Category2',
        'place': '대구시 수성구',
        'name': '어쩌고저쩌고 카페 2',
        'explain': '여행지에 대한 설명',
        'imageUrl': 'images/sample.png'
      },
      {
        'category': 'Category2',
        'place': '대구시 수성구',
        'name': '어쩌고저쩌고 카페 3',
        'explain': '여행지에 대한 설명',
        'imageUrl': 'images/sample.png'
      },
      {
        'category': 'Category2',
        'place': '대구시 수성구',
        'name': '어쩌고저쩌고 카페 4',
        'explain': '여행지에 대한 설명',
        'imageUrl': 'images/sample.png'
      },
      {
        'category': 'Category2',
        'place': '대구시 수성구',
        'name': '어쩌고저쩌고 카페 5',
        'explain': '여행지에 대한 설명',
        'imageUrl': 'images/sample.png'
      },
    ];

    return Scaffold(
      backgroundColor: CustomColor.appBGColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'images/logo.png',
              width: 115,
            ),
            CustomSearchBox(
              hintText: '검색할 내용을 입력하세요',
              controller: _controller,
              onSearchPressed: _onSearchPressed,
              height: 38,
              width: screenWidth * 0.5,
            ),
          ],
        ),
      ),
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Text('뒤로가기를 한번 더 누르면 앱이 종료됩니다'),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeShortcutWidget(
                      imageUrl: 'images/icons/home_icon1.png',
                      text: '여행코스',
                    ),
                    HomeShortcutWidget(
                      imageUrl: 'images/icons/home_icon2.png',
                      text: '즐길거리',
                    ),
                    HomeShortcutWidget(
                      imageUrl: 'images/icons/home_icon3.png',
                      text: '숙소',
                    ),
                    HomeShortcutWidget(
                      imageUrl: 'images/icons/home_icon4.png',
                      text: '쇼핑',
                    ),
                    HomeShortcutWidget(
                      imageUrl: 'images/icons/home_icon5.png',
                      text: '음식점',
                    ),
                  ],
                ),
                HomeCategoryTitle(
                  title: "내근처 여행지",
                  onTap: () {},
                ),
                // 내근처여행지
                Container(
                  height: 170, // 타일 높이 설정
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: travelData.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 143,
                        child: HomeListTile(
                          category: travelData[index]['category']!,
                          name: travelData[index]['name']!,
                          explain: travelData[index]['explain']!,
                          imageUrl: travelData[index]['imageUrl']!,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                HomeLocationTile(
                  locationText: "위치받아오기",
                  onRestart: () {
                    // 재실행 버튼 클릭 시 동작
                    print("재실행 버튼 클릭됨");
                  },
                ),
                HomeCategoryTitle(
                  title: "멍냥이와 함께!",
                  onTap: () {},
                ),
                CustomTabButtons(
                  tabLabels: ['맛있는 한끼', '즐거운 하룻밤'], // 유동적인 탭 버튼 개수
                  onTabSelected: (index) {
                    print('Selected Tab: $index');
                  },
                ),
                SizedBox(
                  height: 17,
                ),
                Container(
                  height: 83, // 타일 높이 설정
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: travelData.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 224,
                        child: HomeListTile(
                          category: withData[index]['category']!,
                          name: withData[index]['name']!,
                          explain: withData[index]['explain']!,
                          imageUrl: withData[index]['imageUrl']!,
                        ),
                      );
                    },
                  ),
                ),
                HomeCategoryTitle(
                  title: "도란도란 커뮤니티",
                  onTap: () {},
                ),
                CustomTabButtons(
                  tabLabels: ['전체', '후기', '자유'], // 유동적인 탭 버튼 개수
                  onTabSelected: (index) {
                    print('Selected Tab: $index');
                  },
                ),
                SizedBox(
                  height: 17,
                ),
                BulletPreviewTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
