import 'package:flutter/material.dart';
import 'package:petpic/components/my_widgets.dart';
import 'package:petpic/constants/color.dart';

import 'package:flutter/material.dart';
import 'package:petpic/constants/color.dart';

class CourseAddSearchScreen extends StatelessWidget {
  const CourseAddSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    void _onSearchPressed() {
      print('검색어: ${_controller.text}');
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: CustomColor.appBGColor,
      appBar: AppBar(
        foregroundColor: CustomColor.iconColor,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          /// 지도(배경) 배치
          Positioned.fill(
            child: Container(
              color: Colors.pink,
              child: Center(
                  child: Text('지도 넣기', style: TextStyle(color: Colors.white))),
            ),
          ),

          /// 검색창 배치
          Positioned(
            top: kToolbarHeight + 20,
            left: 16,
            right: 16,
            child: CustomSearchBox(
              hintText: '검색할 내용을 입력하세요',
              controller: _controller,
              onSearchPressed: _onSearchPressed,
              height: 38,
            ),
          ),

          /// BottomSheet (드래그로 확장 가능)
          DraggableScrollableSheet(
            initialChildSize: 0.35, // 시작 높이 (화면의 35%)
            minChildSize: 0.35, // 최소 높이
            maxChildSize: 1.0, // 최대 높이 (풀스크린)
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    /// 상단에 드래그 핸들 추가
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    /// 내용 영역 (스크롤 없이 BottomSheet 크기만 변경)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
