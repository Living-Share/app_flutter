import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:living_share_app/style/components/profile_box.dart';
import 'package:living_share_app/style/theme/Colors.dart';
import 'package:living_share_app/style/theme/Text.dart';

Container IsSendMoney({
  required bool isSend,
  required String userName,
  required double money,
}) {
  final NumberFormat currencyFormat = NumberFormat('#,##0');
  return Container(
    width: Get.width,
    height: 110.0,
    margin: const EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      color: isSend ? ThemeColors.primary : ThemeColors.falseRed,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Padding(
      padding: EdgeInsets.fromLTRB(15, 15, Get.width * 0.1, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Profile_box(size: 30.0),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    userName,
                    style: TextStyles.custom_pretendart_font_white.copyWith(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                currencyFormat.format(money),
                style: YangjuTextStyles.isSend_box.copyWith(
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
          Text(
            isSend ? "완료" : "독촉",
            style: YangjuTextStyles.isSend_box.copyWith(
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    ),
  );
}
