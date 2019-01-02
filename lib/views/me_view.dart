import 'package:flutter/material.dart';

class MeView extends StatefulWidget {
  _MeViewState createState() => _MeViewState();
}

class _MeViewState extends State<MeView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: Text("Me"),
        color: Colors.lightBlue,
      ),
    );
  }
}
