import 'package:flutter/material.dart';
import '../components/custom_app_bar.dart';
import '../constants/constants.dart' show AppColors, AppFonts, AppSize;

class WeChatPayFragment extends StatefulWidget {
  _WeChatPayFragmentState createState() => _WeChatPayFragmentState();
}

class _Grid {
  _Grid({Key key, String title, int crossItemCount, List<_GridItem> gridItem})
      : _title = title,
        _crossItemCount = crossItemCount,
        _gridItem = gridItem;

  final String _title;
  final int _crossItemCount;
  final List<_GridItem> _gridItem;

  Widget getItem(bool isLast) {
    List<Widget> grid = [];
    List<Widget> gridTemp = [];
    grid.add(Container(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          Text(
            _title,
            style: TextStyle(
              color: Color(AppColors.ListItemSecondColor),
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    ));
    for (int i = 0; i < _gridItem.length; i++) {
      bool isEdge = (i + 1) % _crossItemCount == 0;
      gridTemp.add(_gridItem[i].getItem(isEdge));
      if ((i + 1) % _crossItemCount == 0 || i == _gridItem.length - 1) {
        if (gridTemp.length < 3) {
          for (int j = 0; j <= 3 - gridTemp.length; j++) {
            gridTemp.add(
              Expanded(
                child: Container(
                  height: AppSize.gridItemHeight,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color(AppColors.BorderColor),
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      right: BorderSide(
                        color: Colors.transparent,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                flex: 1,
              ),
            );
          }
        }
        grid.add(Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: gridTemp,
          ),
        ));
        gridTemp = [];
      }
    }

    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      child: Card(
        elevation: 0.2,
        color: Colors.white,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
              bottomRight: isLast ? Radius.zero : Radius.circular(8.0),
              bottomLeft: isLast ? Radius.zero : Radius.circular(8.0)),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: grid,
          ),
        ),
      ),
    );
  }
}

class _GridItem {
  _GridItem({Key key, int iconCode, String title, int color})
      : _iconCode = iconCode,
        _title = title,
        _color = color;

  final int _iconCode;
  final String _title;
  final int _color;

  Widget getItem(bool isEdge) {
    return Expanded(
      flex: 1,
      child: Container(
        height: AppSize.gridItemHeight,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(AppColors.BorderColor),
              style: BorderStyle.solid,
              width: 1.0,
            ),
            right: BorderSide(
              color: isEdge ? Colors.transparent : Color(AppColors.BorderColor),
              style: BorderStyle.solid,
              width: 1.0,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              IconData(
                _iconCode,
                fontFamily: AppFonts.FontFamily,
              ),
              color: Color(_color),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Text(
                _title,
                style: TextStyle(
                  color: Color(AppColors.ListItemHeaderColor),
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeChatPayFragmentState extends State<WeChatPayFragment> {
  List<_Grid> services;

  void initState() {
    super.initState();

    services = [
      _Grid(
        title: "城市服务",
        gridItem: [
          _GridItem(
            title: "信用卡还款",
            iconCode: 0xe62f,
            color: 0xFF00923F,
          ),
          _GridItem(
            title: "手机充值",
            iconCode: 0xe62a,
            color: 0xFF0093DD,
          ),
          _GridItem(
            title: "理财通",
            iconCode: 0xe62c,
            color: 0xFF0093DD,
          ),
          _GridItem(
            title: "生活缴费",
            iconCode: 0xe627,
            color: 0xFF00923F,
          ),
          _GridItem(
            title: "Q币充值",
            iconCode: 0xe620,
            color: 0xFF00CCFF,
          ),
          _GridItem(
            title: "城市服务",
            iconCode: 0xe621,
            color: 0xFF00923F,
          ),
          _GridItem(
            title: "游戏微商店",
            iconCode: 0xe630,
            color: 0xFFE75D58,
          ),
          _GridItem(
            title: "腾讯公益",
            iconCode: 0xe62b,
            color: 0xFFE75D58,
          ),
          _GridItem(
            title: "保险服务",
            iconCode: 0xe61f,
            color: 0xFFE77817,
          ),
        ],
        crossItemCount: 3,
      ),
      _Grid(
        title: "第三方服务",
        gridItem: [
          _GridItem(
            title: "火车票机票",
            iconCode: 0xe7e8,
            color: 0xFF00923F,
          ),
          _GridItem(
            title: "滴滴出行",
            iconCode: 0xe736,
            color: 0xFFF5AB16,
          ),
          _GridItem(
            title: "京东优选",
            iconCode: 0xe61e,
            color: 0xFFFA0000,
          ),
          _GridItem(
            title: "美团外卖",
            iconCode: 0xe62d,
            color: 0xFFD9874B,
          ),
          _GridItem(
            title: "电影演出赛事",
            iconCode: 0xe667,
            color: 0xFFF03D37,
          ),
          _GridItem(
            title: "吃喝玩乐",
            iconCode: 0xe7ac,
            color: 0xFFF3990F,
          ),
          _GridItem(
            title: "酒店",
            iconCode: 0xe61d,
            color: 0xFF00923F,
          ),
          _GridItem(
            title: "拼多多",
            iconCode: 0xe648,
            color: 0xFFE54B34,
          ),
          _GridItem(
            title: "蘑菇街女装",
            iconCode: 0xe667,
            color: 0xFFDD6867,
          ),
          _GridItem(
            title: "唯品会特卖",
            iconCode: 0xe60a,
            color: 0xFFD5618F,
          ),
          _GridItem(
            title: "转转二手",
            iconCode: 0xe636,
            color: 0xFFE5696A,
          ),
        ],
        crossItemCount: 3,
      )
    ];
  }

  _buildGrid() {
    List<Widget> grid = [];
    bool isLast = false;
    for (int i = 0; i < services.length; i++) {
      if (i == (services.length - 1)) {
        isLast = true;
      }
      grid.add(services[i].getItem(isLast));
    }

    return grid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "支付",
        backgroundColor: AppColors.AppBackgroundColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Color(AppColors.AppBarTextColor),
            ),
            onPressed: () {
              print("new page");
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Color(AppColors.AppBackgroundColor),
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 10.0,
              right: 10.0,
            ),
            child: Column(
              children: <Widget>[
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  margin: EdgeInsets.zero,
                  color: Color(AppColors.PayGreenColor),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      top: 30.0,
                      right: 15.0,
                      bottom: 30.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(
                              IconData(
                                0xe603,
                                fontFamily: AppFonts.FontFamily,
                              ),
                              color: Colors.white,
                              size: 35.0,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              child: const Text(
                                "收付款",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(
                              IconData(
                                0xe626,
                                fontFamily: AppFonts.FontFamily,
                              ),
                              color: Colors.white,
                              size: 35.0,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              child: const Text(
                                "钱包",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              child: const Text(
                                "¥40.3",
                                style: TextStyle(
                                  color: Color(0xFFA9D6B9),
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: _buildGrid(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
