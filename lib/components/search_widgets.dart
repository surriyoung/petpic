import 'package:flutter/material.dart';
import 'package:petpic/constants/color.dart';
import 'package:petpic/constants/font_size.dart';

class FavoriteAddTile extends StatefulWidget {
  final String imgUrl;
  final String addTit;
  final String addCont;

  const FavoriteAddTile({
    super.key,
    required this.imgUrl,
    required this.addTit,
    required this.addCont,
  });

  @override
  State<FavoriteAddTile> createState() => _FavoriteAddTileState();
}

class _FavoriteAddTileState extends State<FavoriteAddTile> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    // course가 true일 때만 selectedValue를 초기화
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          SizedBox(width: 40, height: 40, child: Image.asset(widget.imgUrl)),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.addTit,
                  style: TextStyle(
                    fontSize: DynamicFontSize.font15(context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.addCont,
                  style: TextStyle(
                    fontSize: DynamicFontSize.font12(context),
                    fontWeight: FontWeight.w500,
                    color: CustomColor.greyFontColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
