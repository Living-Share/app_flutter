import 'package:flutter/material.dart';
import 'package:living_share_app/style/theme/Colors.dart';
import 'package:living_share_app/style/theme/Text.dart';

Container EventTypeBox({required String child}) {
  return (Container(
    padding: const EdgeInsets.fromLTRB(13, 7, 13, 7),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: ThemeColors.white,
    ),
    child: Text(child, style: TextStyles.event_box_100,),
  ));
}
