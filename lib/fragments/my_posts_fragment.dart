import 'package:flutter/material.dart';

class MyPostFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text("相册"),
      ),
      body: Center(
        child: Text("相册"),
      ),
    );
  }
}
