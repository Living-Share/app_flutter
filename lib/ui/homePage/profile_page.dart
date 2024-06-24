import 'package:flutter/material.dart';
import 'package:living_share_app/style/components/app_bar.dart';
import 'package:living_share_app/style/components/navigationBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: const Column(
          children: [
            Text("프로필"),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
