import 'package:flutter/material.dart';
import '../components/custom_app_bar.dart';

class MyPostFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "相册",
      ),
      body: Center(
        child: Text("相册"),
      ),
    );
  }
}
