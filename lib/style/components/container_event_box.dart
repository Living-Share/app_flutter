import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:living_share_app/style/components/home_event_type.dart';
import 'package:living_share_app/style/components/profile_box.dart';
import 'package:living_share_app/style/theme/Colors.dart';
import 'package:living_share_app/style/theme/Text.dart';

Container EventBox({
  required String whoEvent,
  required String whatEvent,
  required String whenEvent,
  required String time,
  required String type,
}) {
  return Container(
    width: Get.width * 0.8,
    height: 320.0,
    decoration: BoxDecoration(
      color: ThemeColors.primary,
      borderRadius: BorderRadius.circular(15.0),
    ),
    padding: const EdgeInsets.fromLTRB(20, 26, 20, 26),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EventTypeBox(child: type),
            EventTypeBox(child: "수정하기"),
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Profile_box(
              size: 45.0,
            ),
            const SizedBox(
              width: 15.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "사랑꾼",
                  style: TextStyles.event_box_custom.copyWith(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  whoEvent,
                  style: TextStyles.event_box_custom.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )
          ],
        ),
        const Spacer(),
        Text(
          whatEvent,
          style: TextStyles.event_box_500_white,
        ),
        const Padding(
          padding:
              EdgeInsets.fromLTRB(0, 10, 10, 0), // Margin top and bottom 12
          child: Divider(),
        ),
        Text(
          whenEvent,
          style: TextStyles.event_box_300_white,
        ),
        Row(
          children: [
            SvgPicture.asset(
              "images/clock-icon.svg",
            ),
            const SizedBox(
              width: 5.0,
            ),
            Text(
              time,
              style: TextStyles.event_box_300_white,
            ),
          ],
        ),
      ],
    ),
  );
}
