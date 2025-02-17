import 'package:flutter/material.dart';
import 'package:petpic/components/my_screen_widgets.dart';
import 'package:petpic/constants/color.dart';
import 'package:petpic/constants/font_size.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.lightGreyBGColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 마이 박스 내정보
            Container(
              color: CustomColor.lightBlueBGColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 17,
                  vertical: 15,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                // 닉네임
                                myNickName(text: '수영'),
                                Text(
                                  '님 안녕하세요!',
                                  style: TextStyle(
                                    fontSize: DynamicFontSize.font20(context),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                myPetBtn(),
                                SizedBox(
                                  width: 10,
                                ),
                                myPetAddBtn(),
                              ],
                            )
                          ],
                        ),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              // 프로필사진
                              child: Image.asset(
                                'images/sample.png',
                                width: 70,
                                height: 70,
                              ),
                            ),
                            // 프로필사진 수정 버튼
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: DynamicFontSize.font20(context),
                                height: DynamicFontSize.font20(context),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        DynamicFontSize.font10(context))),
                                child: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.edit,
                                    size: DynamicFontSize.font15(context),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    myTraceBtn(
                      txt: '내 찜목록',
                      num: '100',
                    ),
                    myTraceBtn(
                      txt: '내 여행코스',
                      num: '90',
                    ),
                    myTraceBtn(
                      txt: '내 게시글',
                      num: '80',
                      last: true,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // 마이 박스 SNS
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Column(
                children: [
                  Text(
                    'SNS계정을 연동하여 간편하게 로그인할 수 있어요.',
                    style: TextStyle(
                      fontSize: DynamicFontSize.font10(context),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SnsLinkBtn(
                        linked: true,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SnsLinkBtn(),
                      SizedBox(
                        width: 10,
                      ),
                      SnsLinkBtn(),
                      SizedBox(
                        width: 10,
                      ),
                      SnsLinkBtn(),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // 마이 박스 고객센터
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 17,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Text(
                    '고객센터',
                    style: TextStyle(
                      fontSize: DynamicFontSize.font10(context),
                    ),
                  ),
                  myEtcBtn(
                    txt: 'FAQ',
                  ),
                  myEtcBtn(
                    txt: '공지사항',
                  ),
                  myEtcBtn(
                    txt: '문의하기',
                    last: true,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // 마이 박스 기타
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 17,
                vertical: 10,
              ),
              child: Column(
                children: [
                  myEtcBtn(txt: '버전', isVersion: true, version: '1.1.1'),
                  myEtcBtn(
                    txt: '닉네임 변경',
                  ),
                  myEtcBtn(
                    txt: '로그아웃',
                    last: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
