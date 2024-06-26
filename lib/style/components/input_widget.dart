import 'package:flutter/material.dart';
import 'package:living_share_app/style/theme/Colors.dart';

class InputBox extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const InputBox({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: ThemeColors.n_02), // labelText 색 변경
        filled: true,
        fillColor: ThemeColors.n_01,
        border: OutlineInputBorder(
          borderSide: BorderSide.none, // 테두리 제거
          borderRadius: BorderRadius.circular(5.0), // 둥근 모서리
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none, // 활성 상태 테두리 제거
          borderRadius: BorderRadius.circular(5.0), // 둥근 모서리
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none, // 포커스 상태 테두리 제거
          borderRadius: BorderRadius.circular(5.0), // 둥근 모서리
        ),
      ),
      obscureText: false,
      style: const TextStyle(color: ThemeColors.black), // 입력된 글자 색 변경
    );
  }
}
