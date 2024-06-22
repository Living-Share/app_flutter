import 'package:flutter/material.dart';

BottomNavigationBar BottomBar() {
  return BottomNavigationBar(
    selectedItemColor: Colors.black, // 선택된 아이템 색상
    unselectedItemColor: Colors.black, // 선택되지 않은 아이템 색상
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.attach_money),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: "",
      ),
    ],
  );
}
