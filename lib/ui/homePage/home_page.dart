import 'package:flutter/material.dart';
import 'package:living_share_app/style/components/app_bar.dart';
import 'package:living_share_app/style/components/container_box.dart';
import 'package:living_share_app/style/components/container_event_box.dart';
import 'package:living_share_app/style/theme/Text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(44, 0, 44, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "오늘",
                textAlign: TextAlign.start,
                style: TextStyles.main_title_100,
              ),
              EventBox(
                whoEvent: "이희성",
                whatEvent: "이희성여자친구 배유정 올거임 아무튼 그럼",
                whenEvent: "2025.02.11",
                time: "05:12~04:12",
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "오늘 해야할 일이에요 ⏰",
                    style: TextStyles.main_title_50,
                  ),
                  Text(
                    "12/12(월)",
                    style: TextStyles.main_day_50,
                  )
                ],
              ),
              DoWorkContainer(
                title: '홍홍홍',
                user_name: "찢찢찢",
                isDoWork: true,
              ),
              DoWorkContainer(
                title: '퐁퐁퐁',
                user_name: "쥐피티",
                isDoWork: false,
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
