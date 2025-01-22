import 'package:flutter/material.dart';
import 'package:petpic/components/my_widgets.dart';
import 'package:petpic/components/search_widgets.dart';
import 'package:petpic/constants/color.dart';
import 'package:petpic/constants/font_size.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  // CustomDropdown에서 사용할 데이터
  final List<String> _dropdownItems = ['옵션1', '옵션2', '옵션3'];
  String? _selectedValue; // 선택된 값
  String? _selectedValue2; // 선택된 값

  // 찜하기 상태 관리 (초기 상태는 찜하지 않음)
  bool isFavorite = false;

  void _onSearchPressed() {
    print('검색어: ${_controller.text}');
    print('선택된 옵션: $_selectedValue');
  }

  // 하단 팝업을 띄우는 함수
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          height: 300, // 팝업 높이
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: CustomColor.greyBGColor),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '여행지 추가',
                style: TextStyle(
                  fontSize: DynamicFontSize.font15(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
              FavoriteAddTile(
                imgUrl: 'images/icons/favorite.png',
                addTit: '찜 목록에 추가',
                addCont: '가고싶은 여행지를 찜해보세요!',
              ),
              Divider(
                color: CustomColor.greyLineColor,
              ),
              FavoriteAddTile(
                imgUrl: 'images/icons/course.png',
                addTit: '여행코스에 추가',
                addCont: '내 여행코스에 여행지를 추가하세요!',
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width - 34; // 패딩 제외 화면 넓이

    return Scaffold(
      backgroundColor: CustomColor.appBGColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20), // 상단 여백
            CustomSearchBox(
              hintText: '검색할 내용을 입력하세요',
              controller: _controller,
              onSearchPressed: _onSearchPressed,
              height: 38,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 32,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: CustomColor.lightGreyBGColor,
                        ),
                        child: Center(
                          child: Text(
                            '내주변',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: DynamicFontSize.font12(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    CustomDropdown(
                      items: _dropdownItems,
                      selectedValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value;
                        });
                      },
                      width: 100,
                      height: 32,
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '필터초기화',
                    style: TextStyle(
                      fontSize: DynamicFontSize.font12(context),
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // 검색 결과 리스트
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 가로 아이템 개수
                  crossAxisSpacing: 10, // 가로 간격
                  mainAxisSpacing: 10, // 세로 간격
                  childAspectRatio:
                      (screenWidth / 2 - 10) / (screenWidth / 2 + 20), // 비율 설정
                ),
                itemCount: 10, // 아이템 개수
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: screenWidth / 2 - 10,
                              height: screenWidth / 2 - 60,
                              child: Image.asset(
                                'images/sample.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: FavoriteBtn(
                              isFavorite: isFavorite,
                              onTap: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                  if (isFavorite) {
                                    _showBottomSheet();
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      Text(
                        '대구시 수성구',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        '어쩌고저쩌고카페',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        '어쩌고저쩌고카페에 대한 설명',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
