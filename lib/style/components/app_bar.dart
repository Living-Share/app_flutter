import 'package:flutter/material.dart';
import 'package:living_share_app/style/theme/Text.dart';

AppBar CustomAppbar() {
  return AppBar(
    title: const Text(
      "하이",
      style: TextStyles.bold_50,
    ),
  );
}
