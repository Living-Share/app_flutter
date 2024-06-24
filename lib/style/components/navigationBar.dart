import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:living_share_app/ui/homePage/home_page.dart';
import 'package:living_share_app/ui/homePage/money_page.dart';
import 'package:living_share_app/ui/homePage/profile_page.dart';
import 'package:living_share_app/ui/homePage/schedule_registration.dart';

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
          Get.to(const HomePage());
          break;
        case 1:
          Get.to(const ScheduleRegistration());
          break;
        case 2:
          Get.to(const MoneyPage());
          break;
        case 3:
          Get.to(const ProfilePage());
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
