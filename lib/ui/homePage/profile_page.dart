import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:living_share_app/style/components/app_bar.dart';
import 'package:living_share_app/style/components/input_widget.dart';
import 'package:living_share_app/style/components/navigationBar.dart';
import 'package:living_share_app/style/components/profile_box.dart';
import 'package:living_share_app/style/theme/Colors.dart';
import 'package:living_share_app/style/theme/Text.dart';
import 'package:logger/web.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final dio = Dio();
  var logger = Logger();

  String userName = "김뽕찬"; // 초기값

  @override
  void initState() {
    super.initState();
    _getUserProfile();
  }

  void _getUserProfile() async {
    try {
      final response = await dio.get('http://localhost:3000/user/2');
      logger.d(response.data);

      // 상태 업데이트
      setState(() {
        userName = response.data['name'] ?? '김뽕찬'; // 기본값 설정
        nameController.text = response.data['email'] ?? '';
        phoneController.text = response.data['phone'] ?? '';
      });
    } catch (e) {
      logger.e(e);
      Get.snackbar(
        '오류',
        '사용자 정보를 가져오는 중에 중 오류가 발생했습니다.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void _updateUserProfile() async {
    final email = nameController.text;
    final phone = phoneController.text;

    try {
      final response = await dio.put(
        'http://localhost:3000/user/2',
        data: {
          'email': email,
          'phone': phone,
        },
      );
      logger.d(response.data);
      if (response.statusCode == 200) {
        Get.snackbar(
          '성공',
          '사용자 정보가 업데이트되었습니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          '오류',
          '사용자 정보 업데이트 중 오류가 발생했습니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      logger.e(e);
      Get.snackbar(
        '오류',
        '사용자 정보 업데이트 중 오류가 발생했습니다.',
        snackPosition: SnackPosition.BOTTOM,
      );
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
            Text(
              userName,
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
