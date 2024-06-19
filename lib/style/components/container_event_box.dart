import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:living_share_app/style/theme/Colors.dart';

Container EventBox({
  required String whoEvent,
  required String whatEvent,
  required String whenEvent,
  required String time,
}) {
  return (Container(
    width: Get.width,
    height: 320.0,
    color: ThemeColors.primary,
    padding: const EdgeInsets.fromLTRB(20, 26, 20, 26),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(whatEvent),
      ],
    ),
  ));
}
