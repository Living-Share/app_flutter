import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar CustomAppbar() {
  return AppBar(
    scrolledUnderElevation: 0,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
      },
    ),
  );
}
