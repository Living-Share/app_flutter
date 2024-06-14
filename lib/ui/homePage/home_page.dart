import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:living_share_app/style/components/app_bar.dart';
import 'package:living_share_app/style/components/container_box.dart';
import 'package:living_share_app/style/theme/Colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(44, 0, 44, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DoWorkContainer(
              title: '홍홍홍',
              isDoWork: true,
            ),
            DoWorkContainer(
              title: '준푱',
              isDoWork: true,
            ),
          ],
        ),
      ),
    );
  }
}
