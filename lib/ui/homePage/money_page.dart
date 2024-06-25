import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:living_share_app/style/components/app_bar.dart';
import 'package:living_share_app/style/components/navigationBar.dart';
import 'package:living_share_app/style/theme/Text.dart';

class MoneyPage extends StatelessWidget {
  const MoneyPage({super.key});

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
              "이번달 지출액",
              style: YangjuTextStyles.month_money,
            ),
            const Text(
              "100000",
              style: YangjuTextStyles.month_money,
            ),
            Image.asset("images/piggy-bank.png"),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
