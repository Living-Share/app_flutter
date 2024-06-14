import 'package:flutter/material.dart';
import 'package:living_share_app/style/components/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: const Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}
