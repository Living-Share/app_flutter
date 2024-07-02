import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Container Profile_box({required double size}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50.0),
    ),
    child: SvgPicture.asset(
      "assets/images/default.svg",
    ),
  );
}
