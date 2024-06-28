import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:living_share_app/style/components/app_bar.dart';
import 'package:living_share_app/style/components/input_widget.dart';
import 'package:living_share_app/style/components/navigationBar.dart';
import 'package:living_share_app/style/components/profile_box.dart';
import 'package:living_share_app/style/theme/Colors.dart';
import 'package:living_share_app/style/theme/Text.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void _updateUserProfile() async {
    final response = await http.put(
      Uri.parse('http://localhost:3000/user/2'), // 사용자 ID 2번을 수정
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': nameController.text,
        'phone': phoneController.text,
      }),
    );

    if (response.statusCode == 200) {
      // 성공적으로 업데이트됨
      Get.snackbar('성공', '사용자 정보가 성공적으로 수정되었습니다.');
    } else {
      // 업데이트 실패
      Get.snackbar('실패', '사용자 정보 수정 중 오류가 발생했습니다.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Container(
        width: Get.width,
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "개인 정보 수정",
              style: TextStyles.profile_main_title,
            ),
            SizedBox(
              height: Get.height * 0.07,
            ),
            Profile_box(size: 100.0),
            const Text(
              "김뽕찬",
              style: TextStyles.custom_profile_text,
            ),
            const Spacer(),
            InputBox(
              controller: nameController,
              labelText: '닉네임을 입력하세요.',
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            InputBox(
              controller: phoneController,
              labelText: "전화번호",
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            GestureDetector(
              onTap: _updateUserProfile,
              child: Container(
                width: Get.width * 0.7,
                height: 50.0,
                decoration: const BoxDecoration(
                  color: ThemeColors.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "등록하기",
                    style: TextStyle(
                      color: ThemeColors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
