import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:petpic/components/my_widgets.dart';
import 'package:petpic/constants/color.dart';
import 'package:petpic/constants/font_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> items = ['전정', '방재', '육묘'];
  String? selectedValue;
  final Set<int> _selectedIndices = {};

  @override
  Widget build(BuildContext context) {
    final double statusBarSize = MediaQuery.of(context).padding.top;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    // 하나라도 선택된 위젯이 있는지 확인
    bool isAnySelected = _selectedIndices.isNotEmpty;
    
    return Scaffold(
      backgroundColor: CustomColor.appBGColor,
      appBar: PreferredSize(
        // preferredSize: Size.fromHeight(kToolbarHeight),
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // toolbarHeight: kToolbarHeight + statusBarSize,
          flexibleSpace: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: statusBarSize,
              ),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white, // 원하는 회색으로 배경색 설정
                  borderRadius:
                      BorderRadius.circular(50), // 타원형 모양을 위한 borderRadius 설정
                ),
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // title과 actions를 양 끝으로 배치
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(5), // 내부 패딩 설정
                        child: Image.asset(
                          'images/logo/logo.png',
                          width: 59,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'images/button/menu_btn.png',
                        width: 24,
                        height: 24,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Text('뒤로가기를 한번 더 누르면 앱이 종료됩니다'),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
              children: [
                //리스트 대분류
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Text(
                            '한남리 161',
                            style: TextStyle(
                              fontSize: DynamicFontSize.font20(context),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            color: CustomColor.iconColor,
                          ),
                        ),
                      ],
                    ),
                    MainTileWidget(
                      environment: '가온',
                      images: 'images/icons/heated.png',
                      items: items,
                      selectedValue: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      isSelected: _selectedIndices.contains(0),
                      index: 0, // 인덱스 추가
                      onSelectionChanged: (bool isSelected) {
                        setState(() {
                          if (isSelected) {
                            _selectedIndices.add(0);
                          } else {
                            _selectedIndices.remove(0);
                          }
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MainTileWidget(
                      environment: '비가림',
                      images: 'images/icons/non_forested.png',
                      items: items,
                      selectedValue: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      isSelected: _selectedIndices.contains(1),
                      index: 1, // 인덱스 추가
                      onSelectionChanged: (bool isSelected) {
                        setState(() {
                          if (isSelected) {
                            _selectedIndices.add(1);
                          } else {
                            _selectedIndices.remove(1);
                          }
                        });
                      },
                    ),
                  ],
                ),
                //리스트 대분류
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Text(
                            '미남리 255-88',
                            style: TextStyle(
                              fontSize: DynamicFontSize.font20(context),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            color: CustomColor.iconColor,
                          ),
                        ),
                      ],
                    ),
                    MainTileWidget(
                      environment: '노지',
                      images: 'images/icons/open_field.png',
                      items: items,
                      selectedValue: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      isSelected: _selectedIndices.contains(2),
                      index: 2, // 인덱스 추가
                      onSelectionChanged: (bool isSelected) {
                        setState(() {
                          if (isSelected) {
                            _selectedIndices.add(2);
                          } else {
                            _selectedIndices.remove(2);
                          }
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MainTileWidget(
                      environment: '무가온',
                      images: 'images/icons/no_temperature.png',
                      items: items,
                      selectedValue: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      isSelected: _selectedIndices.contains(3),
                      index: 3, // 인덱스 추가
                      onSelectionChanged: (bool isSelected) {
                        setState(() {
                          if (isSelected) {
                            _selectedIndices.add(3);
                          } else {
                            _selectedIndices.remove(3);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      //일지쓰기버튼--MainTileWidget 선택시에만 출력
      bottomNavigationBar: isAnySelected
          ? Padding(
              padding: EdgeInsets.only(
                left: 60,
                right: 60,
                top: 10,
                bottom: 10 + bottomPadding,
              ),
              child: SizedBox(
                height: 59,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    backgroundColor: CustomColor.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          '일지쓰기',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: DynamicFontSize.font25(context),
                              color: Colors.white),
                        ),
                      ),
                      Image.asset('images/icons/mike_icon.png')
                    ],
                  ),
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }
}