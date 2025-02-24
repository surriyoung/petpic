import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petpic/constants/color.dart';
import 'package:petpic/constants/font_size.dart';

class CourseMenuBtn extends StatefulWidget {
  final String txt;
  final Widget Function(BuildContext)? destinationScreen;

  const CourseMenuBtn({
    super.key,
    required this.txt,
    this.destinationScreen,
  });

  @override
  _CourseMenuBtnState createState() => _CourseMenuBtnState();
}

class _CourseMenuBtnState extends State<CourseMenuBtn> {
  bool isSelected = false; // 테두리 변경 상태

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = true; // 클릭 시 테두리 빨간색으로 변경
        });

        if (widget.destinationScreen != null) {
          // destinationScreen이 null이 아닌 경우에만 이동
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: widget.destinationScreen!, // destinationScreen을 사용
            ),
          ).then((_) {
            setState(() {
              isSelected = false; // 다른 페이지에서 돌아오면 원래대로
            });
          });
        } else {
          setState(() {
            isSelected = false; // destinationScreen이 null일 때 테두리 복원
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        width: double.infinity,
        height: DynamicFontSize.font16(context) * 10,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('images/sample.png'), // 배경 이미지
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: isSelected
                ? CustomColor.primaryColor
                : Colors.transparent, // 클릭 시 테두리 빨간색
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10), // 둥근 테두리
        ),
        child: Text(
          widget.txt,
          style: TextStyle(
            fontSize: DynamicFontSize.font20(context),
            fontWeight: FontWeight.w700,
            color: Colors.white, // 글자 색상 (배경 대비 필요)
          ),
        ),
      ),
    );
  }
}

class CourseFormTit extends StatelessWidget {
  final String txt;
  const CourseFormTit({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Text(
        txt,
        style: TextStyle(
          fontSize: DynamicFontSize.font15(context),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class CourseFormSubTit extends StatelessWidget {
  final String txt;
  const CourseFormSubTit({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Text(
        txt,
        style: TextStyle(
          fontSize: DynamicFontSize.font15(context),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class CourseFormInput extends StatelessWidget {
  final String? hintTxt;

  const CourseFormInput({super.key, this.hintTxt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // 가로 100%
      height: 38, // 세로 38px
      decoration: BoxDecoration(
        color: CustomColor.lightGreyBGColor, // 배경색 회색
        borderRadius: BorderRadius.circular(19), // border-radius 19px
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16), // 안쪽 여백 (좌우 16px)
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none, // 기본 테두리 제거
            hintText: hintTxt ?? '내용을 입력해주세요', // 힌트 텍스트
            hintStyle: TextStyle(
              fontSize: DynamicFontSize.font15(context),
            ),
          ),
          style: TextStyle(
            fontSize: DynamicFontSize.font15(context),
          ),
        ),
      ),
    );
  }
}

class PickCourseDate extends StatefulWidget {
  @override
  _PickCourseDateState createState() => _PickCourseDateState();
}

class _PickCourseDateState extends State<PickCourseDate> {
  DateTime? startDate;
  DateTime? endDate;
  DateTime today = DateTime.now();

  // 시작날짜를 선택하고, 바로 마지막날짜를 선택하는 함수
  //CalendarDatePicker2 사용하는걸로 변경하기!
  // flutter pub add calendar_date_picker2
  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedStartDate = await showDatePicker(
      helpText: '여행 시작날짜',
      // cancelText: '캔슬',
      // confirmText: '컨펌',
      context: context,
      initialDate: today,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedStartDate != null) {
      setState(() {
        startDate = pickedStartDate; // 시작날짜 설정
      });

      // 시작날짜를 선택하면 바로 마지막날짜 선택 데이트피커를 띄운다.
      _selectEndDate(context);
      print('startDate:::${startDate}');
    }
  }

  // 마지막날짜를 선택하는 함수
  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? pickedEndDate = await showDatePicker(
      helpText: '여행 종료날짜',
      context: context,
      initialDate:
          startDate != null ? startDate!.add(Duration(days: 1)) : today,
      firstDate: startDate ?? DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedEndDate != null) {
      setState(() {
        endDate = pickedEndDate; // 마지막날짜 설정
      });
      print('endDate:::${endDate}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // 날짜 형식을 지정
    String formatDate(DateTime date) {
      return DateFormat('yyyy.MM.dd').format(date);
    }

    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
      width: double.infinity,
      height: 38,
      decoration: BoxDecoration(
        color: Colors.grey[200], // 회색 배경
        borderRadius: BorderRadius.circular(19),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${startDate != null ? '${formatDate(startDate!)}' : '${formatDate(today)}'}~${endDate != null ? '${formatDate(endDate!)}' : '${formatDate(today.add(Duration(days: 1)))}'}',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: DynamicFontSize.font15(context)),
          ),
          IconButton(
            onPressed: () => _selectStartDate(context),
            icon: Icon(
              Icons.calendar_today_rounded,
              color: CustomColor.primaryColor,
              size: DynamicFontSize.font15(context),
            ),
          )
        ],
      ),
    );
  }
}

class BottomDoubleBtn extends StatelessWidget {
  final String txt1;
  final String txt2;
  final Widget Function(BuildContext)? onTap1;
  final Widget Function(BuildContext)? onTap2;
  const BottomDoubleBtn(
      {super.key,
      required this.txt1,
      required this.txt2,
      required this.onTap1,
      required this.onTap2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              if (onTap1 != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: onTap1!, // destinationScreen을 사용
                  ),
                );
              }
            },
            child: Container(
              height: DynamicFontSize.font19(context) * 3,
              decoration: BoxDecoration(
                color: CustomColor.lightGreyBGColor,
                borderRadius: BorderRadius.circular(10), // 둥근 테두리
              ),
              child: Center(
                child: Text(
                  txt1,
                  style: TextStyle(
                    fontSize: DynamicFontSize.font15(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              if (onTap2 != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: onTap2!, // destinationScreen을 사용
                  ),
                );
              }
            },
            child: Container(
              height: DynamicFontSize.font19(context) * 3,
              decoration: BoxDecoration(
                color: CustomColor.lightGreyBGColor,
                borderRadius: BorderRadius.circular(10), // 둥근 테두리
              ),
              child: Center(
                child: Text(
                  txt2,
                  style: TextStyle(
                    fontSize: DynamicFontSize.font15(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
