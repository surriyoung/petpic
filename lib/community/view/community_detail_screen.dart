import 'package:flutter/material.dart';
import 'package:petpic/community/view/community_screen.dart';
import 'package:petpic/components/my_widgets.dart';
import 'package:petpic/constants/color.dart';
import 'package:petpic/constants/font_size.dart';

class CommunityDetailScreen extends StatefulWidget {
  const CommunityDetailScreen({super.key});

  @override
  State<CommunityDetailScreen> createState() => _CommunityDetailScreenState();
}

class _CommunityDetailScreenState extends State<CommunityDetailScreen> {
  final TextEditingController _controller = TextEditingController();
  void _onSearchPressed() {
    print('검색어: ${_controller.text}');
  }

  @override
  Widget build(BuildContext context) {
    // 댓글 데이터 (예시)
    List<Map<String, String>> comments = [
      {
        'imgUrl': 'images/sample.png',
        'userName': '쑤리',
        'userPets': '웰시코기 코코 외 1마리',
        'min': '100',
      },
      {
        'imgUrl': 'images/sample.png',
        'userName': '하늘',
        'userPets': '푸들 뭉치 외 2마리',
        'min': '150',
      },
      {
        'imgUrl': 'images/sample.png',
        'userName': '루비',
        'userPets': '고양이 로미 외 1마리',
        'min': '200',
      },
    ];

    return Scaffold(
      resizeToAvoidBottomInset: true, //키보드가 올라올때 화면 자동 크기 조절
      backgroundColor: CustomColor.greyBGColor,
      appBar: AppBar(
        backgroundColor: CustomColor.appBGColor,
        foregroundColor: CustomColor.iconColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 게시글 내용
            Container(
              padding: EdgeInsets.all(17),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserInfoInTile(
                    imgUrl: 'images/sample.png',
                    userName: '쑤리',
                    userPets: '웰시코기 코코 외 1마리',
                    course: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '게시글 제목입니다',
                    style: TextStyle(
                      fontSize: DynamicFontSize.font15(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.게시글 내용입니다.',
                    style: TextStyle(
                      color: CustomColor.greyFontColor,
                      fontSize: DynamicFontSize.font15(context),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ShareBtn(
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ReportBtn(
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // 댓글
            Container(
              padding: EdgeInsets.all(17),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '댓글 ${comments.length}',
                    style: TextStyle(
                      color: CustomColor.greyFontColor,
                      fontSize: DynamicFontSize.font12(context),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // 댓글 리스트
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: comments.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemBuilder: (context, index) {
                      var comment = comments[index];
                      return CommentTile(
                        imgUrl: comment['imgUrl']!,
                        userName: comment['userName']!,
                        userPets: comment['userPets']!,
                        min: comment['min']!,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(17),
        color: Colors.white,
        child: CustomSearchBox(
          hintText: '검색할 내용을 입력하세요',
          controller: _controller,
          onSearchPressed: _onSearchPressed,
          height: 38,
        ),
      ),
    );
  }
}
