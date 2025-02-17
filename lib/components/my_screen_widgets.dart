import 'package:flutter/material.dart';
import 'package:petpic/constants/color.dart';
import 'package:petpic/constants/font_size.dart';

class myPetBtn extends StatelessWidget {
  const myPetBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DynamicFontSize.font16(context) * 2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(DynamicFontSize.font16(context))),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '웰시코기 코코',
            style: TextStyle(fontSize: DynamicFontSize.font12(context)),
          ),
          SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.close,
              size: DynamicFontSize.font15(context),
            ),
          )
        ],
      ),
    );
  }
}

class myPetAddBtn extends StatelessWidget {
  const myPetAddBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DynamicFontSize.font16(context) * 2,
      height: DynamicFontSize.font16(context) * 2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(DynamicFontSize.font16(context))),
      child: InkWell(
        onTap: () {},
        child: Icon(
          Icons.add,
          size: DynamicFontSize.font15(context),
        ),
      ),
    );
  }
}

class myTraceBtn extends StatelessWidget {
  final String txt;
  final String num;
  final bool last;
  const myTraceBtn(
      {super.key, required this.txt, required this.num, this.last = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: last ? Colors.transparent : CustomColor.greyLineColor,
              width: last ? 0 : 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: DynamicFontSize.font15(context),
                  height: DynamicFontSize.font15(context),
                  decoration: BoxDecoration(
                    color: CustomColor.greyBGColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  txt,
                  style: TextStyle(
                    fontSize: DynamicFontSize.font12(context),
                  ),
                ),
              ],
            ),
            Text(
              '${num}개',
              style: TextStyle(
                fontSize: DynamicFontSize.font15(context),
                fontWeight: FontWeight.w700,
                color: CustomColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SnsLinkBtn extends StatelessWidget {
  final bool linked;

  const SnsLinkBtn({super.key, this.linked = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            'images/sample.png',
            width: 30,
            height: 30,
          ),
        ),
        SizedBox(height: 5),
        Text(
          linked ? '연결완료' : '연결하기',
          style: TextStyle(
              color: linked ? Colors.black : CustomColor.greyFontColor,
              fontSize: DynamicFontSize.font8(context)),
        ),
      ],
    );
  }
}

class myEtcBtn extends StatelessWidget {
  final String txt;
  final bool last;
  final String? version;
  final bool isVersion;
  const myEtcBtn({
    super.key,
    required this.txt,
    this.last = false,
    this.version,
    this.isVersion = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: last ? Colors.transparent : CustomColor.greyLineColor,
              width: last ? 0 : 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              txt,
              style: TextStyle(
                fontSize: DynamicFontSize.font12(context),
              ),
            ),
            isVersion
                ? Text(
                    version ?? '',
                    style: TextStyle(
                      fontSize: DynamicFontSize.font12(context),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class myNickName extends StatelessWidget {
  final String text;

  const myNickName({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 텍스트 크기 측정
        final textPainter = TextPainter(
          text: TextSpan(
            text: text,
            style: TextStyle(
              fontSize: DynamicFontSize.font20(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();

        double textWidth = textPainter.width; // 텍스트의 실제 너비

        return Stack(
          children: [
            Positioned(
              bottom: 3, // 텍스트 하단에 위치하도록 설정
              child: Container(
                width: textWidth, // 텍스트 너비만큼 설정
                height: 5,
                color: CustomColor.primaryColor,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: DynamicFontSize.font20(context),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        );
      },
    );
  }
}
