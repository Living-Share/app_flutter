import 'package:flutter/material.dart';
import 'package:living_share_app/style/components/app_bar.dart';
import 'package:living_share_app/style/components/navigationBar.dart';

class MoneyPage extends StatelessWidget {
  const MoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: const Column(
          children: [
            Text("공금"),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
