import 'package:flutter/material.dart';
import '../constants/constants.dart' show AppColors, CustomTextStyle;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key key,
    this.title,
    this.actions,
    this.backgroundColor = AppColors.AppBarColor,
  })  : assert(title != null),
        preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String title;
  final List<Widget> actions;
  final int backgroundColor;
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left,
          color: Color(AppColors.AppBarTextColor),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Color(backgroundColor),
      title: Text(
        title,
        style: CustomTextStyle.AppBarTitleStyle,
      ),
      centerTitle: true,
      elevation: 0,
      actions: actions,
    );
  }
}
