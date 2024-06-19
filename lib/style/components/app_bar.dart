import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar CustomAppbar() {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
      },
    ),
  );
}
