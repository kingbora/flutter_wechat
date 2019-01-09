import 'package:flutter/material.dart';

class SettingFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text("设置"),
      ),
      body: Center(
        child: Text("设置"),
      ),
    );
  }
}
