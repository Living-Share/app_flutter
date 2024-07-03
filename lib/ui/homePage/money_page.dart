import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:living_share_app/Dto/constants.dart';
import 'package:living_share_app/style/components/app_bar.dart';
import 'package:living_share_app/style/components/navigationBar.dart';
import 'package:living_share_app/style/components/send_money_box.dart';
import 'package:living_share_app/style/theme/Text.dart';
import 'package:living_share_app/ui/moneyLending/lending.dart';
import 'package:logger/logger.dart';

class MoneyPage extends StatefulWidget {
  const MoneyPage({super.key});

  @override
  State<MoneyPage> createState() => _MoneyPageState();
}

class _MoneyPageState extends State<MoneyPage> {
  final NumberFormat currencyFormat = NumberFormat('#,###,##0');
  final dio = Dio();
  var logger = Logger();
  int monthlyExpense = 0; // 사용자 월 지출액 변수
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    _getUser();
    _getMoney();
  }

  void _getUser() async {
    try {
      final response = await dio.get('$serverIp/user');
      logger.d(response.data);

      setState(() {
        users = response.data; // 예시 응답 데이터 키
      });
    } catch (e) {
      logger.e(e);
      Get.snackbar(
        '오류',
        '사용자 정보를 가져오는 중에 오류가 발생했습니다.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void _getMoney() async {
    try {
      final response = await dio.get('$serverIp/getMoney');
      logger.d(response.data);

      num totalExpense = 0;
      for (var item in response.data) {
        totalExpense += (item['electricity'] ?? 0).toInt();
        totalExpense += (item['water'] ?? 0).toInt();
        totalExpense += (item['gas'] ?? 0).toInt();
        totalExpense += (item['heating'] ?? 0).toInt();
        totalExpense += (item['management_fee'] ?? 0).toInt();
      }

      setState(() {
        monthlyExpense = totalExpense.toInt();
      });
    } catch (e) {
      logger.e(e);
      Get.snackbar(
        "오류",
        "돈에 대한 정보에 문제가 있어요!",
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
              "이번달 지출액",
              style: YangjuTextStyles.month_money,
            ),
            Text(
              currencyFormat.format(monthlyExpense),
              style: YangjuTextStyles.month_money,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(const MoneyLendingPage());
                },
                child: Image.asset("assets/images/piggy-bank.png")),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: users
                      .map((user) => IsSendMoney(
                            id: user["id"],
                            isSend: user["money"] == 0 ? false : true,
                            userName: user['name'],
                            money: monthlyExpense / users.length,
                          ))
                      .toList(),
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
