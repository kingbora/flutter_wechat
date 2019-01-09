import 'package:flutter/material.dart';
import '../components/custom_app_bar.dart';

class FavoritesFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "收藏",
      ),
      body: Center(
        child: Text("收藏"),
      ),
    );
  }
}
