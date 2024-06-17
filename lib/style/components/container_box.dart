import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:living_share_app/style/theme/Colors.dart';
import 'package:living_share_app/style/theme/Text.dart';

Container DoWorkContainer({
  required String title,
  required String user_name,
  required bool isDoWork,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: Get.width, // 100%
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isDoWork ? ThemeColors.primary : ThemeColors.falseRed,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.doWorkContainer_title,
              ),
              Row(
                children: [
                  Text(
                    user_name,
                    style: TextStyles.doWorkContainer_name,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
