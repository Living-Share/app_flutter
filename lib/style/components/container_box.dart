import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:living_share_app/style/theme/Colors.dart';
import 'package:living_share_app/style/theme/Text.dart';

GestureDetector DoWorkContainer({
  required String title,
  required String user_name,
  required bool isDoWork,
  required dynamic context,
}) {
  return GestureDetector(
    onTap: () {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: Get.width,
            height: 300, // 모달 높이 크기
            decoration: const BoxDecoration(
              color: Colors.white, // 모달 배경색
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0), // 모달 좌상단 라운딩 처리
                topRight: Radius.circular(0), // 모달 우상단 라운딩 처리
              ),
            ),
            child: Text("hi"), // 모달 내부 디자인 영역
          );
        },
      );
    },
    child: Container(
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
                          '', // 이미지 URL
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
    ),
  );
}
