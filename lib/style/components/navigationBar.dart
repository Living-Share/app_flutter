import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

BottomNavigationBar BottomBar() {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed, // 아이템 너비 균일하게 유지
    selectedItemColor: Colors.black, // 선택된 아이템 색상
    unselectedItemColor: Colors.black, // 선택되지 않은 아이템 색상
    selectedFontSize: 0, // 선택된 아이템의 폰트 크기
    unselectedFontSize: 0, // 선택되지 않은 아이템의 폰트 크기
    onTap: (index) {
      switch (index) {
        case 0:
          Get.to(A());
          break;
        case 1:
          Get.to(B());
          break;
        case 2:
          Get.to(C());
          break;
        case 3:
          Get.to(D());
          break;
      }
    },
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home, size: 30), // 아이콘 크기 설정
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today, size: 30), // 아이콘 크기 설정
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.attach_money, size: 30), // 아이콘 크기 설정
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person, size: 30), // 아이콘 크기 설정
        label: "",
      ),
    ],
  );
}
