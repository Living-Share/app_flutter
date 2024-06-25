import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:living_share_app/style/theme/Colors.dart';

Container IsSendMoney({
  required bool isSend,
  required String userName,
  required int money,
}) {
  return Container(
    width: Get.width,
    height: 110.0,
    margin: const EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      color: isSend ? ThemeColors.primary : ThemeColors.falseRed,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Padding(
      padding: EdgeInsets.fromLTRB(12, 15, Get.width * 0.1, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(userName),
              Text("$money₩"),
            ],
          ),
          Text(isSend ? "완료" : "독촉"),
        ],
      ),
    ),
  );
}
