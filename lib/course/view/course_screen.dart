import 'package:flutter/material.dart';
import 'package:petpic/components/course_widgets.dart';
import 'package:petpic/constants/font_size.dart';
import 'package:petpic/course/view/course_add_form_screen.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '멍냥이와 함께하는\n여행코스',
              style: TextStyle(
                fontSize: DynamicFontSize.font18(context),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CourseMenuBtn(
              txt: '여행코스 추가하기',
              destinationScreen: (context) => const CourseAddFormScreen(), //예시
            ),
            SizedBox(
              height: 30,
            ),
            CourseMenuBtn(
              txt: '내 여행코스',
            ),
            SizedBox(
              height: 30,
            ),
            CourseMenuBtn(
              txt: '인기있는 여행코스',
            ),
          ],
        ),
      ),
    );
  }
}
