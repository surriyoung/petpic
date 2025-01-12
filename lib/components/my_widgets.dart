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
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: items
            .map(
              (String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
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
            color: CustomColor.appBGColor, // 배경색 설정
            borderRadius: BorderRadius.circular(20), // BorderRadius 설정
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          elevation: 0,
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border.all(width: 1, color: CustomColor.appBGColor), // 배경색 설정
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

  const SmallButton({super.key, required this.btnTit,this.height = 40,});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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

class MainTileWidget extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final String environment;
  final String images;
  final bool isSelected; // 선택 상태를 받는 변수
  final ValueChanged<bool> onSelectionChanged; // 선택 상태 변화를 알리는 콜백
  final int index; // 인덱스 추가

  const MainTileWidget({
    Key? key,
    required this.items,
    this.selectedValue,
    this.onChanged,
    required this.environment,
    required this.images,
    required this.isSelected,
    required this.onSelectionChanged,
    required this.index,
  }) : super(key: key);

  @override
  State<MainTileWidget> createState() => _MainTileWidgetState();
}

class _MainTileWidgetState extends State<MainTileWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 선택 상태를 변경하고 부모에 알림
        widget.onSelectionChanged(!widget.isSelected);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          border: Border.all(
            color: widget.isSelected ? CustomColor.primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(26, 16, 26, 0),
                  child: Image.asset(widget.images),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.environment,
                            style: TextStyle(
                              fontSize: DynamicFontSize.font20(context),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            '1280 m²',
                            style: TextStyle(
                              fontSize: DynamicFontSize.font15(context),
                              fontWeight: FontWeight.w500,
                              color: CustomColor.greyFontColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              '만생귤',
                              style: TextStyle(
                                fontSize: DynamicFontSize.font15(context),
                                fontWeight: FontWeight.w500,
                                color: CustomColor.primaryColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              '한라향',
                              style: TextStyle(
                                fontSize: DynamicFontSize.font15(context),
                                fontWeight: FontWeight.w500,
                                color: CustomColor.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // CustomDropdown의 선택 동작을 처리
                    // 여기서는 CustomDropdown 선택과 MainTileWidget 선택이 충돌하지 않도록
                    // 따로 이벤트 처리를 하거나 상태 관리를 할 수 있습니다.
                  },
                  child: CustomDropdown(
                    items: widget.items,
                    selectedValue: widget.selectedValue,
                    onChanged: (String? value) {
                      if (widget.onChanged != null) {
                        widget.onChanged!(value); // CustomDropdown 선택 시 동작 처리
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Text(
                '제초 5일 전',
                style: TextStyle(
                  fontSize: DynamicFontSize.font20(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 22,),
            Row(
              children: [
                SmallButton(
                  btnTit: '일지',
                ),
                SizedBox(
                  width: DynamicFontSize.font12(context),
                ),
                SmallButton(
                  btnTit: '달력',
                ),
                SizedBox(
                  width: DynamicFontSize.font12(context),
                ),
                SmallButton(
                  btnTit: '정보',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}