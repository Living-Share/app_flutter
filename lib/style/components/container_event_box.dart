import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:living_share_app/style/components/home_event_type.dart';
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
    decoration: BoxDecoration(
      color: ThemeColors.primary,
      borderRadius: BorderRadius.circular(15.0),
    ),
    padding: const EdgeInsets.fromLTRB(20, 26, 20, 26),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EventTypeBox(child: "방문"),
            EventTypeBox(child: "수정하기"),
          ],
        ),
        Text(whatEvent),
      ],
    ),
  ));
}
