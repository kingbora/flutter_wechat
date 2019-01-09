import 'package:flutter/material.dart';
import '../constants/constants.dart' show AppColors;
import '../fragments/wechat_pay_fragment.dart';
import '../fragments/card_offer_fragment.dart';
import '../fragments/favorites_fragment.dart';
import '../fragments/my_posts_fragment.dart';
import '../fragments/setting_fragment.dart';
import '../fragments/sticker_gallery_fragment.dart';

class MeView extends StatefulWidget {
  _MeViewState createState() => _MeViewState();
}

class _GroupList {
  _GroupList({Key key, List<_GroupListItem> listItem}) : _listItem = listItem;

  final List<_GroupListItem> _listItem;

  getItem(BuildContext context) {
    int index = 0;
    List<Widget> tempList = [];
    _listItem.forEach((_GroupListItem listItem) {
      index++;
      tempList.add(listItem.getItem(context, _listItem.length, index));
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
  _GroupListItem({Key key, String iconPath, String title, Widget component})
      : _iconPath = iconPath,
        _title = title,
        _component = component;

  final String _iconPath;
  final String _title;
  final Widget _component;

  _handleTap(BuildContext context) {
    return () => Navigator.push(
        context, MaterialPageRoute(builder: (context) => _component));
  }

  Widget getItem(BuildContext context, int groupLength, int index) {
    return Column(
      children: groupLength == index
          ? [
              Container(
                height: 50.0,
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      bottom: 15.0,
                    ),
                    child: Image.asset(
                      _iconPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    _title,
                    style: TextStyle(
                      color: Color(AppColors.ListItemHeaderColor),
                      fontSize: 15.0,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Color(AppColors.BorderColor),
                  ),
                  onTap: _handleTap(context),
                ),
              ),
            ]
          : [
              Container(
                height: 50.0,
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      bottom: 15.0,
                    ),
                    child: Image.asset(
                      _iconPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    _title,
                    style: TextStyle(
                      color: Color(AppColors.ListItemHeaderColor),
                      fontSize: 15.0,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Color(AppColors.BorderColor),
                  ),
                  onTap: _handleTap(context),
                ),
              ),
              Divider(
                height: 1.0,
                indent: 50.0,
                color: Color(AppColors.BorderColor),
              ),
            ],
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
            component: WeChatPayFragment(),
          ),
        ],
      ),
      _GroupList(
        listItem: [
          _GroupListItem(
            iconPath: "assets/images/avatar/favorites.png",
            title: "收藏",
            component: FavoritesFragment(),
          ),
          _GroupListItem(
            iconPath: "assets/images/avatar/myPosts.png",
            title: "相册",
            component: MyPostFragment(),
          ),
          _GroupListItem(
            iconPath: "assets/images/avatar/cardAndOffer.png",
            title: "卡包",
            component: CardOfferFragment(),
          ),
          _GroupListItem(
            iconPath: "assets/images/avatar/stickerGallery.png",
            title: "表情",
            component: StickerGalleryFragment(),
          ),
        ],
      ),
      _GroupList(
        listItem: [
          _GroupListItem(
            iconPath: "assets/images/avatar/settings.png",
            title: "设置",
            component: SettingFragment(),
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
          return index == 0
              ? _buildHeaderArea()
              : _groupList[index - 1].getItem(context);
        },
        itemCount: _groupList.length + 1,
      ),
    );
  }
}
