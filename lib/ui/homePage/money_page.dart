import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:living_share_app/style/components/app_bar.dart';
import 'package:living_share_app/style/components/navigationBar.dart';
import 'package:living_share_app/style/components/send_money_box.dart';
import 'package:living_share_app/style/theme/Text.dart';

class MoneyPage extends StatelessWidget {
  const MoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat = NumberFormat('#,###,##0');
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
            Text(
              currencyFormat.format(72592945),
              style: YangjuTextStyles.month_money,
            ),
            Image.asset("images/piggy-bank.png"),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    IsSendMoney(
                      isSend: false,
                      userName: "인생씁다",
                      money: 25000,
                    ),
                    IsSendMoney(
                      isSend: false,
                      userName: "인생씁다",
                      money: 25000,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
