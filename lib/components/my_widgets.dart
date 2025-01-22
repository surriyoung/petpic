import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:petpic/constants/color.dart';
import 'package:petpic/constants/font_size.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final double? width;
  final double? height;

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.width, // 기본값 설정 가능
    this.height = 40, // 기본값 설정 가능
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          '선택',
          style: TextStyle(
            fontSize: DynamicFontSize.font12(context),
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        items: items
            .map(
              (String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: DynamicFontSize.font12(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
            .toList(),
        value: selectedValue,
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.only(left: 10, right: 8),
          height: height,
          width: width ?? 77,
          decoration: BoxDecoration(
            border: Border.all(color: CustomColor.greyBGColor),
            color: CustomColor.appBGColor, // 배경색 설정
            borderRadius: BorderRadius.circular(20), // BorderRadius 설정
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          elevation: 0,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  width: 1, color: CustomColor.greyBGColor), // 배경색 설정
              borderRadius:
                  BorderRadius.circular(20) // 드롭다운 리스트의 BorderRadius 설정
              ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: height ?? 40,
        ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  final String btnTit;
  final double height;

  const SmallButton({
    super.key,
    required this.btnTit,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          backgroundColor: CustomColor.appBGColor,
          elevation: 0,
          minimumSize: Size.fromHeight(height),
        ),
        child: Text(
          btnTit,
          style: TextStyle(
            color: Colors.black,
            fontSize: DynamicFontSize.font15(context),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class CustomSearchBox extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onSearchPressed; // 검색 버튼 클릭 이벤트
  final double height;
  final double? width;

  const CustomSearchBox({
    Key? key,
    this.hintText = '검색어를 입력하세요',
    this.controller,
    this.onSearchPressed,
    this.height = 40,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: CustomColor.primaryColor, // 보더 색상 설정
          width: 1.5,
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
                border: InputBorder.none, // 기본 언더라인 제거
              ),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
          InkWell(
            onTap: onSearchPressed,
            child: Icon(
              Icons.search,
              color: CustomColor.iconColor, // 아이콘 색상
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTabButtons extends StatefulWidget {
  final List<String> tabLabels;
  final Function(int) onTabSelected;

  CustomTabButtons({required this.tabLabels, required this.onTabSelected});

  @override
  _CustomTabButtonsState createState() => _CustomTabButtonsState();
}

class _CustomTabButtonsState extends State<CustomTabButtons> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        widget.tabLabels.length,
        (index) {
          return Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                  widget.onTabSelected(index);
                },
                child: Container(
                  height: 32,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _selectedIndex == index
                        ? CustomColor.lightBlueBGColor
                        : CustomColor.lightGreyBGColor,
                  ),
                  child: Center(
                    child: Text(
                      widget.tabLabels[index],
                      style: TextStyle(
                        color: _selectedIndex == index
                            ? CustomColor.primaryColor
                            : Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: DynamicFontSize.font12(context),
                      ),
                    ),
                  ),
                ),
              ),
              // 탭 사이 간격 10
              if (index != widget.tabLabels.length - 1) SizedBox(width: 10),
            ],
          );
        },
      ),
    );
  }
}

class FavoriteBtn extends StatefulWidget {
  final bool isFavorite;
  final Function onTap;

  const FavoriteBtn({
    Key? key,
    required this.isFavorite,
    required this.onTap,
  }) : super(key: key);

  @override
  _FavoriteBtnState createState() => _FavoriteBtnState();
}

class _FavoriteBtnState extends State<FavoriteBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: CustomColor.greyLineColor,
            )),
        child: Icon(
          widget.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
          size: 18,
        ),
      ),
    );
  }
}

class ShareBtn extends StatefulWidget {
  final Function onTap;

  const ShareBtn({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  _ShareBtnState createState() => _ShareBtnState();
}

class _ShareBtnState extends State<ShareBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: CustomColor.greyLineColor,
          ),
        ),
        child: Icon(
          Icons.ios_share_rounded,
          color: CustomColor.iconColor,
          size: 15,
        ),
      ),
    );
  }
}

class ReportBtn extends StatefulWidget {
  final Function onTap;

  const ReportBtn({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  _ReportBtnState createState() => _ReportBtnState();
}

class _ReportBtnState extends State<ReportBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: CustomColor.greyLineColor,
          ),
        ),
        child: Icon(
          Icons.report,
          color: CustomColor.iconColor,
          size: 15,
        ),
      ),
    );
  }
}

class BulletPreviewTile extends StatelessWidget {
  final String bulletTit;
  final String bulletCategory;
  final String imgUrl;
  final String userName;
  final String min;
  final String view;
  final String comment;
  final VoidCallback onTap;
  const BulletPreviewTile(
      {super.key,
      required this.bulletTit,
      required this.bulletCategory,
      required this.imgUrl,
      required this.userName,
      required this.min,
      required this.view,
      required this.comment,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                bulletTit,
                style: TextStyle(
                    fontSize: DynamicFontSize.font15(context),
                    fontWeight: FontWeight.w500),
              ),
              Container(
                height: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: CustomColor.greyBGColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  bulletCategory,
                  style: TextStyle(
                      fontSize: DynamicFontSize.font10(context),
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: ClipOval(
                      child: Image.asset(
                        imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    userName,
                    style: TextStyle(
                        fontSize: DynamicFontSize.font12(context),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '${min}분 전',
                    style: TextStyle(
                        fontSize: DynamicFontSize.font10(context),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '조회 ${view}',
                    style: TextStyle(
                        fontSize: DynamicFontSize.font10(context),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '댓글 ${comment}',
                    style: TextStyle(
                        fontSize: DynamicFontSize.font10(context),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            height: 1,
            color: CustomColor.greyLineColor,
          ),
        ],
      ),
    );
  }
}

class UserInfoInTile extends StatelessWidget {
  final bool course;
  final bool isComment;
  final String imgUrl;
  final String userName;
  final String userPets;
  final String? category;
  final String? min;
  final String? view;
  final String? comment;
  const UserInfoInTile(
      {super.key,
      this.course = false,
      this.isComment = false,
      required this.imgUrl,
      required this.userName,
      required this.userPets,
      this.category,
      this.min,
      this.view,
      this.comment});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment:
          course ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: ClipOval(
                child: Image.asset(
                  imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                          fontSize: DynamicFontSize.font15(context),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      userPets,
                      style: TextStyle(
                        fontSize: DynamicFontSize.font12(context),
                        fontWeight: FontWeight.w500,
                        color: CustomColor.greyFontColor,
                      ),
                    ),
                  ],
                ),
                course
                    ? SizedBox.shrink()
                    : isComment
                        ? Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              '${min ?? '0'}분 전',
                              style: TextStyle(
                                  fontSize: DynamicFontSize.font10(context),
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                Text(
                                  '${min ?? '0'}분 전',
                                  style: TextStyle(
                                      fontSize: DynamicFontSize.font10(context),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '조회 ${view ?? '0'}',
                                  style: TextStyle(
                                      fontSize: DynamicFontSize.font10(context),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '댓글 ${comment ?? '0'}',
                                  style: TextStyle(
                                      fontSize: DynamicFontSize.font10(context),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
              ],
            ),
          ],
        ),
        course || isComment
            ? SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                  ),
                ),
              )
            : Container(
                height: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: CustomColor.greyBGColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Center(
                  child: Text(
                    category ?? 'null',
                    style: TextStyle(
                      fontSize: DynamicFontSize.font10(context),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}

class CoursePreviewTile extends StatelessWidget {
  const CoursePreviewTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserInfoInTile(
          imgUrl: 'images/sample.png',
          userName: '쑤리',
          userPets: '웰시코기 코코 외 1마리',
          course: true,
        ),
        SizedBox(
          height: 15,
        ),
        CoursePreviewBox(),
        Divider(
          color: CustomColor.greyLineColor,
        )
      ],
    );
  }
}

class CoursePreviewBox extends StatefulWidget {
  const CoursePreviewBox({super.key});

  @override
  State<CoursePreviewBox> createState() => _CoursePreviewBoxState();
}

class _CoursePreviewBoxState extends State<CoursePreviewBox> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;
    return Padding(
      padding: EdgeInsets.all(17),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            child: GridView.count(
              shrinkWrap: true, // 부모 위젯의 크기를 넘어가지 않도록 설정
              crossAxisCount: 2, // 한 행에 2개의 항목
              crossAxisSpacing: 2, // 항목 간의 가로 간격
              mainAxisSpacing: 2, // 항목 간의 세로 간격
              children: List.generate(
                4, // 총 4개의 항목 생성
                (index) => Container(
                  width: 39,
                  height: 39,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('images/sample.png'), // 이미지 경로
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '멍냥이랑 두번째 겨울여행',
                style: TextStyle(
                  fontSize: DynamicFontSize.font15(context),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '2024.12.01 ~ 2024.12.03 (2박 3일)',
                style: TextStyle(
                    fontSize: DynamicFontSize.font12(context),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  FavoriteBtn(
                    isFavorite: isFavorite,
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                        if (isFavorite) {}
                      });
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ShareBtn(
                    onTap: () {},
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
