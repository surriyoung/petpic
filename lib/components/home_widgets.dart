import 'package:flutter/material.dart';
import 'package:petpic/constants/color.dart';
import 'package:petpic/constants/font_size.dart';

class HomeShortcutWidget extends StatelessWidget {
  final String imageUrl;
  final String text;

  HomeShortcutWidget({required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25), // #000000 25% 투명도
                offset: Offset(0, 0), // x축 0, y축 0
                blurRadius: 2, // 퍼짐 정도 2
              ),
            ],
          ),
          padding: EdgeInsets.all(10),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: DynamicFontSize.font10(context),
          ),
        ),
      ],
    );
  }
}

class HomeCategoryTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const HomeCategoryTitle({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 17,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: DynamicFontSize.font18(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              "바로가기",
              style: TextStyle(
                fontSize: DynamicFontSize.font15(context),
                fontWeight: FontWeight.w500,
                color: CustomColor.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomeListTile extends StatelessWidget {
  final String category;
  final String? place;
  final String name;
  final String explain;
  final String imageUrl;

  // 생성자
  HomeListTile({
    required this.category,
    this.place,
    required this.name,
    required this.explain,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Category에 따른 크기 설정
    double width = category == 'Category1' ? 143 : 224;
    double height = category == 'Category1' ? 170 : 83;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 0),
              blurRadius: 2,
            ),
          ]),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: category == 'Category1'
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              category == 'Category1'
                  ? SizedBox.shrink()
                  : Text(
                      place ?? '위치',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: DynamicFontSize.font10(context),
                        fontWeight: FontWeight.w700,
                        color: CustomColor.lightGreyFontColor,
                      ),
                    ),
              Text(
                name,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: DynamicFontSize.font14(context),
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              category == 'Category1'
                  ? SizedBox(
                      height: 5,
                    )
                  : SizedBox.shrink(),
              Text(
                explain,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: DynamicFontSize.font10(context),
                  fontWeight: FontWeight.w700,
                  color: CustomColor.lightGreyFontColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeLocationTile extends StatelessWidget {
  final String locationText;
  final VoidCallback onRestart;

  const HomeLocationTile({
    Key? key,
    required this.locationText,
    required this.onRestart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: CustomColor.lightBlueBGColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.location_on_rounded,
            size: 15,
            color: CustomColor.iconColor,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                locationText,
                style: TextStyle(
                  fontSize: DynamicFontSize.font12(context),
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          InkWell(
            onTap: onRestart,
            child: Container(
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.restart_alt,
                size: 15,
                color: CustomColor.iconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
