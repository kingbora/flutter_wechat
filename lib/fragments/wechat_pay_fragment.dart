import 'package:flutter/material.dart';

class WeChatPayFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text("支付"),
      ),
      body: Center(
        child: Text("支付"),
      ),
    );
  }
}
