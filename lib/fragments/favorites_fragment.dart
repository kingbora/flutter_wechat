import 'package:flutter/material.dart';

class FavoritesFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text("收藏"),
      ),
      body: Center(
        child: Text("收藏"),
      ),
    );
  }
}
