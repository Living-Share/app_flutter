import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:living_share_app/Dto/constants.dart';
import 'package:living_share_app/style/components/profile_box.dart';
import 'package:living_share_app/style/theme/Colors.dart';
import 'package:living_share_app/style/theme/Text.dart';
import 'package:logger/web.dart';

class IsSendMoney extends StatefulWidget {
  final int id;
  final bool isSend;
  final String userName;
  final double money;

  const IsSendMoney({
    Key? key,
    required this.id,
    required this.isSend,
    required this.userName,
    required this.money,
  }) : super(key: key);

  @override
  _IsSendMoneyState createState() => _IsSendMoneyState();
}

class _IsSendMoneyState extends State<IsSendMoney> {
  late bool isSendValue;
  final NumberFormat currencyFormat = NumberFormat('#,##0');
  final Dio dio = Dio();
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    isSendValue = widget.isSend;
  }

  void _putState(int id, bool currentIsSendValue) async {
    try {
      final response = await dio.put('$serverIp/user/$id/money');
      logger.d(response);
      setState(() {
        isSendValue = currentIsSendValue;
      });
    } catch (e) {
      logger.e('Error sending PUT request: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 110.0,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: isSendValue ? ThemeColors.primary : ThemeColors.falseRed,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 15, Get.width * 0.1, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Profile_box(size: 30.0),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      widget.userName,
                      style: TextStyles.custom_pretendart_font_white.copyWith(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  currencyFormat.format(widget.money),
                  style: YangjuTextStyles.isSend_box.copyWith(
                    fontSize: 22.0,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                _putState(widget.id, !isSendValue);
              },
              child: Text(
                isSendValue ? "완료" : "독촉",
                style: YangjuTextStyles.isSend_box.copyWith(
                  fontSize: 24.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
