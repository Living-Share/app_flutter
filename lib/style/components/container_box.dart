import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:living_share_app/style/theme/Colors.dart';

Container DoWorkContainer({
  required String title,
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
          child: Center(
            child: Row(
              children: [
                Column(
                  children: [
                    Text(title),
                  ],
                ),
                const Text("호롱롱"),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
