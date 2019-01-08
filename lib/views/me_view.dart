import 'package:flutter/material.dart';
import '../constants/constants.dart' show AppColors;

class MeView extends StatefulWidget {
  _MeViewState createState() => _MeViewState();
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
            padding: const EdgeInsets.all(15.0),
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

class _MeViewState extends State<MeView> {
  List<_GroupList> _groupList;

  void initState() {
    super.initState();
    _groupList = [
      _GroupList(
        listItem: [
          _GroupListItem(
            iconPath: "assets/images/avatar/weChatPay.png",
            title: "支付",
          ),
        ],
      ),
      _GroupList(
        listItem: [
          _GroupListItem(
            iconPath: "assets/images/avatar/favorites.png",
            title: "收藏",
          ),
          _GroupListItem(
            iconPath: "assets/images/avatar/myPosts.png",
            title: "相册",
          ),
          _GroupListItem(
            iconPath: "assets/images/avatar/cardAndOffer.png",
            title: "卡包",
          ),
          _GroupListItem(
            iconPath: "assets/images/avatar/stickerGallery.png",
            title: "表情",
          ),
        ],
      ),
      _GroupList(
        listItem: [
          _GroupListItem(
            iconPath: "assets/images/avatar/settings.png",
            title: "设置",
          ),
        ],
      )
    ];
  }

  Widget _buildHeaderArea() {
    return Container(
      height: 100.0,
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 10.0,
        right: 10.0,
        bottom: 35.0,
      ),
      margin: const EdgeInsets.only(
        bottom: 10.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(AppColors.BorderColor),
            style: BorderStyle.solid,
          ),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  right: 15.0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Image.asset(
                    "assets/images/portrait/10.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "书生今天不吃饭",
                    style: TextStyle(
                      color: Color(AppColors.ListItemHeaderColor),
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    "微信号：superman",
                    style: TextStyle(
                      color: Color(AppColors.ListItemSecondColor),
                      fontSize: 13.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 15.0,
                width: 15.0,
                child: Image.asset(
                  "assets/images/avatar/payCode.png",
                  fit: BoxFit.fill,
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Color(AppColors.BorderColor),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return index == 0 ? _buildHeaderArea() : _groupList[index - 1].item;
        },
        itemCount: _groupList.length + 1,
      ),
    );
  }
}
