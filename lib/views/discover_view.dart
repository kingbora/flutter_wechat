import 'package:flutter/material.dart';
import '../constants/constants.dart' show AppColors;

class DiscoverView extends StatefulWidget {
  _DiscoverViewState createState() => _DiscoverViewState();
}

class _GroupList {
  _GroupList({Key key, List<_GroupListItem> listItem}) : _listItem = listItem;

  final List<_GroupListItem> _listItem;

  get item {
    int index = 0;
    List<Widget> tempList = [];
    _listItem.forEach((_GroupListItem listItem) {
      index++;
      tempList.add(listItem.getItem(_listItem.length, index));
    });
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(AppColors.BorderColor),
            style: BorderStyle.solid,
          ),
          bottom: BorderSide(
            color: Color(AppColors.BorderColor),
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: tempList,
      ),
    );
  }
}

class _GroupListItem {
  _GroupListItem({Key key, String iconPath, String title})
      : _iconPath = iconPath,
        _title = title;

  final String _iconPath;
  final String _title;

  Widget getItem(int groupLength, int index) {
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              _iconPath,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                border: groupLength == index
                    ? null
                    : Border(
                        bottom: BorderSide(
                          color: Color(AppColors.BorderColor),
                          style: BorderStyle.solid,
                        ),
                      ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _title,
                    style: TextStyle(
                      color: Color(AppColors.ListItemHeaderColor),
                      fontSize: 15.0,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Color(AppColors.BorderColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DiscoverViewState extends State<DiscoverView> {
  List<_GroupList> _groupList;

  void initState() {
    super.initState();
    _groupList = [
      _GroupList(listItem: [
        _GroupListItem(
          iconPath: "assets/images/discover/moments.png",
          title: "朋友圈",
        ),
      ]),
      _GroupList(listItem: [
        _GroupListItem(
          iconPath: "assets/images/discover/scan.png",
          title: "扫一扫",
        ),
        _GroupListItem(
          iconPath: "assets/images/discover/shake.png",
          title: "摇一摇",
        ),
      ]),
      _GroupList(listItem: [
        _GroupListItem(
          iconPath: "assets/images/discover/topStories.png",
          title: "看一看",
        ),
        _GroupListItem(
          iconPath: "assets/images/discover/search.png",
          title: "搜一搜",
        ),
      ]),
      _GroupList(listItem: [
        _GroupListItem(
          iconPath: "assets/images/discover/peopleNearby.png",
          title: "附近的人",
        ),
        _GroupListItem(
          iconPath: "assets/images/discover/messageInBottle.png",
          title: "漂流瓶",
        ),
      ]),
      _GroupList(listItem: [
        _GroupListItem(
          iconPath: "assets/images/discover/shopping.png",
          title: "购物",
        ),
        _GroupListItem(
          iconPath: "assets/images/discover/games.png",
          title: "游戏",
        ),
      ]),
      _GroupList(listItem: [
        _GroupListItem(
          iconPath: "assets/images/discover/miniPrograms.png",
          title: "小程序",
        ),
      ])
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color(AppColors.AppBarColor),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _groupList[index].item;
        },
        itemCount: _groupList.length,
      ),
    );
  }
}
