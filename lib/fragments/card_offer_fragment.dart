import 'package:flutter/material.dart';
import '../components/custom_app_bar.dart';

class CardOfferFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "卡包",
      ),
      body: Center(
        child: Text("卡包"),
      ),
    );
  }
}
