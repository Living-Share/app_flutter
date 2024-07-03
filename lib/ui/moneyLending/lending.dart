import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:living_share_app/style/components/app_bar.dart';
import 'package:living_share_app/style/theme/Colors.dart';
import 'package:living_share_app/style/theme/Text.dart';
import 'package:living_share_app/ui/detailMoney/detail_money.dart';

class MoneyLendingPage extends StatelessWidget {
  const MoneyLendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: 290,
              child: Image.asset(
                "assets/images/money-lending.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "우리집 관리비 얼마나 나왔나?",
              style: TextStyles.lender_page_100,
            ),
            const Text(
              "확인해 보세요.",
              style: TextStyles.lender_page_100,
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                print("움직임");
                Get.to(
                  const DetailMoneyPage(),
                );
              },
              child: Container(
                width: Get.width * 0.85,
                height: 70,
                decoration: BoxDecoration(
                  color: ThemeColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "이번 달 관리비 보기",
                    style: TextStyles.lender_page_50,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
