import 'package:flutter/material.dart';

class CardOfferFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text("卡包"),
      ),
      body: Center(
        child: Text("卡包"),
      ),
    );
  }
}
