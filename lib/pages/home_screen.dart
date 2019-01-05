import 'package:flutter/material.dart';
import '../constants/constants.dart' show AppFonts, AppColors;
import '../views/wechat_view.dart' show WeChatView;
import '../views/discover_view.dart' show DiscoverView;
import '../views/contact_view.dart' show ContactView;
import '../views/me_view.dart' show MeView;

class NavigationIconView {
  NavigationIconView(
      {Key key, String title, int iconCode, int activeIconCode, int index})
      : title = title,
        iconCode = iconCode,
        activeIconCode = activeIconCode,
        index = index;

  final String title;
  final int iconCode;
  final int activeIconCode;
  final int index;
}

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

enum ActionItemsType {
  GROUP_CHAT,
  ADD_FRIEND,
  QR_SCAN,
  PAYMENT,
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  List<NavigationIconView> _navigationViews;
  List<Widget> pages;
  int _currentIndex = 0;

  void initState() {
    super.initState();
    _navigationViews = [
      NavigationIconView(
        title: '微信',
        iconCode: 0xe600,
        activeIconCode: 0xe61b,
        index: 0,
      ),
      NavigationIconView(
        title: '通讯录',
        iconCode: 0xe601,
        activeIconCode: 0xe606,
        index: 1,
      ),
      NavigationIconView(
        title: '发现',
        iconCode: 0xe602,
        activeIconCode: 0xe8c0,
        index: 2,
      ),
      NavigationIconView(
        title: '我',
        iconCode: 0xe67b,
        activeIconCode: 0xe67c,
        index: 3,
      ),
    ];

    _pageController = PageController(initialPage: _currentIndex);
    pages = [WeChatView(), ContactView(), DiscoverView(), MeView()];
  }

  _buildPopupMenuItem(int iconCode, String title) {
    return Row(
      children: <Widget>[
        Container(
          width: 16.0,
        ),
        Icon(
          IconData(
            iconCode,
            fontFamily: AppFonts.FontFamily,
          ),
          color: Colors.white,
        ),
        Container(
          width: 16.0,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBar = BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView viewItem) {
        return BottomNavigationBarItem(
          icon: Icon(
            IconData(
              viewItem.iconCode,
              fontFamily: AppFonts.FontFamily,
            ),
            color: Color(AppColors.TabNormalColor),
          ),
          title: Text(
            viewItem.title,
            style: TextStyle(
              fontSize: 13.0,
              color: Color(_currentIndex == viewItem.index
                  ? AppColors.TabActiveColor
                  : AppColors.TabNormalColor),
            ),
          ),
          activeIcon: Icon(
            IconData(
              viewItem.activeIconCode,
              fontFamily: AppFonts.FontFamily,
            ),
            color: Color(AppColors.TabActiveColor),
          ),
          backgroundColor: Colors.white,
        );
      }).toList(),
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
          );
        });
      },
      type: BottomNavigationBarType.fixed,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "微信",
          style: TextStyle(
            color: Color(AppColors.TabNormalColor),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<ActionItemsType>>[
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe61b, "发起群聊"),
                  value: ActionItemsType.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe629, "添加朋友"),
                  value: ActionItemsType.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe634, "扫一扫"),
                  value: ActionItemsType.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe603, "收付款"),
                  value: ActionItemsType.PAYMENT,
                ),
              ];
            },
            icon: Icon(
              IconData(
                0xe642,
                fontFamily: AppFonts.FontFamily,
              ),
              color: Color(AppColors.TabNormalColor),
            ),
            onSelected: (ActionItemsType type) {
              print(type);
            },
          )
        ],
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return pages[index];
        },
        controller: _pageController,
        itemCount: pages.length,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
