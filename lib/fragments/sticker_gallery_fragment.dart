import 'package:flutter/material.dart';
import '../components/custom_app_bar.dart';

class StickerGalleryFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "表情",
      ),
      body: Center(
        child: Text("表情"),
      ),
    );
  }
}
