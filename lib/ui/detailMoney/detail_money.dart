import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:living_share_app/Dto/constants.dart';
import 'package:living_share_app/style/components/app_bar.dart';
import 'package:living_share_app/style/theme/Colors.dart';
import 'package:living_share_app/style/theme/Text.dart';
import 'package:logger/logger.dart';

class DetailMoneyPage extends StatefulWidget {
  const DetailMoneyPage({super.key});

  @override
  State<DetailMoneyPage> createState() => _DetailMoneyPageState();
}

class _DetailMoneyPageState extends State<DetailMoneyPage> {
  final dio = Dio();
  var logger = Logger();
  List<dynamic> money = [];

  void _getMoney() async {
    try {
      final response = await dio.get('$serverIp/getMoney');
      logger.d(response.data);

      setState(() {
        money = response.data;
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
  void initState() {
    super.initState();
    _getMoney();
  }

  void _showSnackbar() {
    Get.snackbar(
      "개발중이에요",
      "",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: 300,
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadiusDirectional.circular(5),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '지출 내역',
                        style: YangjuTextStyles.detail_money_100,
                      ),
                      GestureDetector(
                        onTap: _showSnackbar,
                        child: Container(
                          width: 60,
                          height: 40,
                          decoration: BoxDecoration(
                            color: ThemeColors.primary,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(
                            child: Text(
                              "수정",
                              style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: ThemeColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35.0),
                  if (money.isNotEmpty) // money 리스트가 비어있지 않은 경우에만 접근
                    ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("가스", style: YangjuTextStyles.detail_money_50),
                        const SizedBox(width: 10),
                        Text(
                          "${money[0]['gas']}₩", // 리스트의 첫 번째 항목에서 gas 값 가져오기
                          style: YangjuTextStyles.detail_money_100,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("전기", style: YangjuTextStyles.detail_money_50),
                        const SizedBox(width: 10),
                        Text(
                          "${money[0]['electricity']}₩",
                          style: YangjuTextStyles.detail_money_100,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("물", style: YangjuTextStyles.detail_money_50),
                        const SizedBox(width: 10),
                        Text(
                          "${money[0]['water']}₩",
                          style: YangjuTextStyles.detail_money_100,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("난방", style: YangjuTextStyles.detail_money_50),
                        const SizedBox(width: 10),
                        Text(
                          "${money[0]['heating']}₩",
                          style: YangjuTextStyles.detail_money_100,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("관리비", style: YangjuTextStyles.detail_money_50),
                        const SizedBox(width: 10),
                        Text(
                          "${money[0]['management_fee']}₩",
                          style: YangjuTextStyles.detail_money_100,
                        ),
                      ],
                    ),
                  ] else
                    const Text("금액 정보를 불러오는 중입니다..."), // money 리스트가 비어있을 경우
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: Image.asset(
                "assets/images/receipt.png",
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
