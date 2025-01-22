import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petpic/community/view/community_detail_screen.dart';
import 'package:petpic/components/community_widgets.dart';
import 'package:petpic/components/my_widgets.dart';
import 'package:petpic/constants/color.dart';
import 'package:petpic/constants/font_size.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 데이터 정의
    final reviewData = [
      {
        'bulletTit': '후기 제목1',
        'bulletCategory': '후기',
        'imgUrl': 'images/sample.png',
        'userName': '사용자3',
        'min': '15',
        'view': '150',
        'comment': '30',
        'onTap': '',
      },
    ];

    final freeData = [
      {
        'bulletTit': '자유 제목1',
        'bulletCategory': '자유',
        'imgUrl': 'images/sample.png',
        'userName': '사용자4',
        'min': '20',
        'view': '300',
        'comment': '50',
        'onTap': '',
      },
    ];

    final allData = [...reviewData, ...freeData];

    return DefaultTabController(
      length: 4, // 탭의 개수
      child: Scaffold(
        backgroundColor: CustomColor.appBGColor,
        body: Column(
          children: [
            Container(
              color: CustomColor.appBGColor,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: CustomColor.greyFontColor,
                    labelStyle: TextStyle(
                      fontSize: DynamicFontSize.font15(context),
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: DynamicFontSize.font15(context),
                      fontWeight: FontWeight.w700,
                    ),
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    indicatorColor: Colors.black,
                    tabs: const [
                      Tab(text: '전체'),
                      Tab(text: '후기'),
                      Tab(text: '자유'),
                      Tab(text: '코스'),
                    ],
                  ),
                  const Divider(height: 1, thickness: 1),
                ],
              ),
            ),
            // 탭 내용
            Expanded(
              child: TabBarView(
                children: [
                  CommunityPreviewTile(bulletPreView: allData),
                  CommunityPreviewTile(bulletPreView: reviewData),
                  CommunityPreviewTile(bulletPreView: freeData),
                  CommunityCoursePreviewTile(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CommunityDetailScreen(),
              ),
            );
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}

class CommentTile extends StatelessWidget {
  final String imgUrl;
  final String userName;
  final String userPets;
  final String min;
  const CommentTile(
      {super.key,
      required this.imgUrl,
      required this.userName,
      required this.userPets,
      required this.min});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserInfoInTile(
          imgUrl: imgUrl,
          userName: userName,
          userPets: userPets,
          min: min,
          course: false,
          isComment: true,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '댓글입니다. 댓글입니다.댓글입니다.댓글입니다.댓글입니다.댓글입니다.댓글입니다.',
          style: TextStyle(
            color: CustomColor.greyFontColor,
            fontSize: DynamicFontSize.font15(context),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
