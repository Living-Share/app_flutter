import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:living_share_app/style/components/app_bar.dart';
import 'package:living_share_app/style/components/input_widget.dart';
import 'package:living_share_app/style/components/navigationBar.dart';
import 'package:living_share_app/style/theme/Colors.dart';
import 'package:living_share_app/style/theme/Text.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final TextEditingController wordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ThemeColors.black,
                  width: 1.0,
                ),
                color: ThemeColors.n_01,
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: const Center(
                child: Text("사진 추가하기"),
              ),
            ),
            const Text(
              "김뽕찬",
              style: TextStyles.custom_profile_text,
            ),
            const Spacer(),
            InputBox(
              controller: wordController,
              labelText: '나를 소개하는 단어를 적어주세요.',
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
              onTap: () {
                print('나를 소개하는 단어: ${wordController.text}');
                print('전화번호: ${phoneController.text}');
              },
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
