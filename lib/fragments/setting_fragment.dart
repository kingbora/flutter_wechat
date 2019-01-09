import 'package:flutter/material.dart';
import '../components/custom_app_bar.dart';

class SettingFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "设置",
      ),
      body: Center(
        child: Text("设置"),
      ),
    );
  }
}
