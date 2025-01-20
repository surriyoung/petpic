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

class BulletPreviewTile extends StatelessWidget {
  final String bulletTit;
  final String bulletCategory;
  final String imgUrl;
  final String userName;
  final String min;
  final String view;
  final String comment;
  const BulletPreviewTile(
      {super.key,
      required this.bulletTit,
      required this.bulletCategory,
      required this.imgUrl,
      required this.userName,
      required this.min,
      required this.view,
      required this.comment});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
