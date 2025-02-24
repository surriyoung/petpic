import 'package:flutter/material.dart';
import 'package:petpic/components/course_widgets.dart';
import 'package:petpic/components/my_widgets.dart';
import 'package:petpic/constants/color.dart';
import 'package:petpic/course/view/course_add_search_screen.dart';

class CourseAddFormScreen extends StatelessWidget {
  const CourseAddFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, //키보드가 올라올때 화면 자동 크기 조절
      backgroundColor: CustomColor.appBGColor,
      appBar: AppBar(
        backgroundColor: CustomColor.appBGColor,
        foregroundColor: CustomColor.iconColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CourseFormTit(
                txt: '여행코스 이름',
              ),
              CourseFormInput(),
              SizedBox(
                height: 30,
              ),
              CourseFormTit(
                txt: '언제 갈까요?',
              ),
              PickCourseDate(),
              SizedBox(
                height: 30,
              ),
              CourseFormTit(
                txt: '누구랑 갈까요?',
              ),
              CustomTabButtons(
                tabLabels: ['멍냥이랑 단둘이', '다같이 그룹여행'], // 유동적인 탭 버튼 개수
                onTabSelected: (index) {
                  print('Selected Tab: $index');
                },
              ),
              SizedBox(
                height: 30,
              ),
              CourseFormTit(
                txt: '여행일정',
              ),
              CourseFormSubTit(
                txt: '1일차',
              ),
              CourseFormInput(),
              SizedBox(
                height: 15,
              ),
              CourseFormSubTit(
                txt: '2일차',
              ),
              CourseFormInput(),
              SizedBox(
                height: 15,
              ),
              CourseFormSubTit(
                txt: '3일차',
              ),
              CourseFormInput(),
              SizedBox(
                height: 30,
              ),
              CourseFormTit(
                txt: '공개여부',
              ),
              CustomTabButtons(
                tabLabels: ['나만보기', '팔로워만', '일부공개', '전체공개'], // 유동적인 탭 버튼 개수
                onTabSelected: (index) {
                  print('Selected Tab: $index');
                },
              ),
              SizedBox(
                height: 30,
              ),
              BottomDoubleBtn(
                txt1: '저장하기',
                onTap1: (context) => const CourseAddSearchScreen(), //예시
                txt2: '저장하고 여행코스 추가하기',
                onTap2: (context) => const CourseAddSearchScreen(), //예시
              )
            ],
          ),
        ),
      ),
    );
  }
}
