import 'package:flutter/material.dart';
import 'package:living_share_app/style/components/app_bar.dart';
import 'package:living_share_app/style/components/navigationBar.dart';

class ScheduleRegistration extends StatelessWidget {
  const ScheduleRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: const Column(
          children: [
            Text("일정 등록"),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
