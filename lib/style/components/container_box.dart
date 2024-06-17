import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:living_share_app/style/theme/Colors.dart';
import 'package:living_share_app/style/theme/Text.dart';

Container DoWorkContainer({
  required String title,
  required String user_name,
  required bool isDoWork,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: Get.width, // 100%
          padding: const EdgeInsets.fromLTRB(24, 25, 0, 25),
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isDoWork ? ThemeColors.primary : ThemeColors.falseRed,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // 그림자 색상
                spreadRadius: 2, // 그림자 확산 정도
                blurRadius: 5, // 그림자 흐림 정도
                offset: const Offset(0, 3), // 그림자 위치 (x, y)
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.doWorkContainer_title,
              ),
              Row(
                children: [
                  ClipOval(
                    child: Container(
                      width: 23, // 원의 지름과 같은 값으로 설정
                      height: 23, // 원의 지름과 같은 값으로 설정
                      color: Colors.blue, // 프로필 박스의 배경색
                      child: Image.network(
                        'https://item.kakaocdn.net/do/58119590d6204ebd70e97763ca933baf9f5287469802eca457586a25a096fd31', // 이미지 URL
                        width: 25, // 이미지의 너비
                        height: 25, // 이미지의 높이
                        fit: BoxFit.cover, // 이미지를 박스에 맞추기 위해 cover 사용
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Text(
                    user_name,
                    style: TextStyles.doWorkContainer_name.copyWith(
                      color: Colors.white, // 텍스트의 색상
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
