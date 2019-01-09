import 'package:flutter/material.dart';

class StickerGalleryFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text("表情"),
      ),
      body: Center(
        child: Text("表情"),
      ),
    );
  }
}
