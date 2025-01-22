import 'package:flutter/material.dart';
import 'package:petpic/components/my_widgets.dart';

class CommunityPreviewTile extends StatelessWidget {
  final List<Map<String, String>> bulletPreView;

  const CommunityPreviewTile({super.key, required this.bulletPreView});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      child: ListView.separated(
        itemCount: bulletPreView.length,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemBuilder: (context, index) {
          return BulletPreviewTile(
            bulletTit: bulletPreView[index]['bulletTit'] ?? '',
            bulletCategory: bulletPreView[index]['bulletCategory'] ?? '',
            imgUrl: bulletPreView[index]['imgUrl'] ?? '',
            userName: bulletPreView[index]['userName'] ?? '',
            min: bulletPreView[index]['min'] ?? '',
            view: bulletPreView[index]['view'] ?? '',
            comment: bulletPreView[index]['comment'] ?? '',
            onTap: () {
              bulletPreView[index]['comment'] ?? '';
            },
          );
        },
      ),
    );
  }
}

class CommunityCoursePreviewTile extends StatelessWidget {
  const CommunityCoursePreviewTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      child: CoursePreviewTile(),
    );
  }
}
