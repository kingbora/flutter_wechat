import "package:flutter/material.dart";
import 'pages/home_screen.dart' show HomeScreen;
import 'constants/constants.dart' show AppColors;

void main() => runApp(MaterialApp(
      title: '微信',
      theme: ThemeData.light().copyWith(
        primaryColor: Color(AppColors.AppBarColor),
        cardColor: Color(AppColors.PopupMenuBackgroundColor),
        dividerColor: Color(AppColors.BorderColor),
      ),
      home: HomeScreen(),
    ));
