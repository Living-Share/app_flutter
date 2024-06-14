import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:living_share_app/style/theme/Colors.dart';

Container DoWorkContainer() {
  return Container(
    padding: const EdgeInsets.fromLTRB(44, 0, 44, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: Get.width,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ThemeColors.primary,
          ),
          child: const Center(
            child: Text("엉덩이"),
          ),
        )
      ],
    ),
  );
}
