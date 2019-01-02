import 'package:flutter/material.dart';
import '../constants/constants.dart' show AppColors, AppFonts;

class WeChatView extends StatefulWidget {
  _WeChatViewState createState() => _WeChatViewState();
}

class ListItem {
  ListItem(
      {Key key,
      String portrait,
      String nickname,
      int datetime,
      String content,
      int messages,
      bool isSticky,
      bool isMute})
      : portrait = portrait,
        nickname = nickname,
        datetime = datetime,
        content = content,
        messages = messages,
        isSticky = isSticky,
        isMute = isMute;

  final String portrait;
  final String nickname;
  final int datetime;
  final String content;
  final int messages;
  final bool isSticky;
  final bool isMute;
}

class _WeChatViewState extends State<WeChatView> {
  List<ListItem> _list;

  void initState() {
    super.initState();
    _list = [
      ListItem(
        portrait: "assets/images/portrait/1.jpg",
        nickname: "戓汻、冭兲浈",
        datetime: 1546412370541,
        content: "你好",
        messages: 0,
        isSticky: true,
        isMute: false,
      ),
      ListItem(
        portrait: "assets/images/portrait/2.jpg",
        nickname: "一生承诺",
        datetime: 1546428978032,
        content: "在一个充满仇恨的世界，我们仍然要满怀希望；在一个充满绝望的世界，我们仍然要敢于梦想。",
        messages: 1,
        isSticky: false,
        isMute: true,
      ),
      ListItem(
        portrait: "assets/images/portrait/3.png",
        nickname: "纯真ブ已不复存在",
        datetime: 1546428978167,
        content: "世界上其实根本没有感同身受这回事，针不刺到别人身上，他们就不知道有多痛。",
        messages: 3,
        isSticky: false,
        isMute: false,
      ),
      ListItem(
        portrait: "assets/images/portrait/4.png",
        nickname: "戓汻、冭兲浈",
        datetime: 1546412371987,
        content: "你好",
        messages: 15,
        isSticky: false,
        isMute: false,
      ),
      ListItem(
        portrait: "assets/images/portrait/5.jpg",
        nickname: "戓汻、冭兲浈",
        datetime: 1546412370541,
        content: "在一个充满仇恨的世界，我们仍然要满怀希望；在一个充满绝望的世界，我们仍然要敢于梦想。",
        messages: 3,
        isSticky: false,
        isMute: false,
      ),
      ListItem(
        portrait: "assets/images/portrait/6.jpeg",
        nickname: "戓汻、冭兲浈",
        datetime: 1546412370541,
        content: "你好",
        messages: 105,
        isSticky: false,
        isMute: false,
      ),
      ListItem(
        portrait: "assets/images/portrait/7.jpg",
        nickname: "戓汻、冭兲浈",
        datetime: 1546412370541,
        content: "世界上其实根本没有感同身受这回事，针不刺到别人身上，他们就不知道有多痛。",
        messages: 3,
        isSticky: false,
        isMute: true,
      ),
      ListItem(
        portrait: "assets/images/portrait/8.jpg",
        nickname: "戓汻、冭兲浈",
        datetime: 1546412370541,
        content: "你好",
        messages: 3,
        isSticky: false,
        isMute: false,
      ),
      ListItem(
        portrait: "assets/images/portrait/9.jpg",
        nickname: "戓汻、冭兲浈",
        datetime: 1546412370541,
        content: "你好",
        messages: 3,
        isSticky: false,
        isMute: false,
      ),
      ListItem(
        portrait: "assets/images/portrait/10.jpg",
        nickname: "戓汻、冭兲浈",
        datetime: 1546412370541,
        content: "你好",
        messages: 3,
        isSticky: false,
        isMute: false,
      )
    ];
  }

  _buildSearchInput() {
    return Container(
      color: Color(AppColors.AppBarColor),
      padding: const EdgeInsets.only(
        left: 5.0,
        top: 10.0,
        right: 5.0,
        bottom: 10.0,
      ),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.all(10.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              style: BorderStyle.solid,
              color: Color(AppColors.BorderColor),
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              style: BorderStyle.solid,
              color: Color(AppColors.BorderColor),
            ),
            borderRadius: BorderRadius.circular(3.0),
          ),
        ),
      ),
    );
  }

  _formatTime(int datetime) {
    var date = new DateTime.fromMillisecondsSinceEpoch(datetime);
    var nowDate = new DateTime.now();
    var diff = nowDate.difference(date);
    if (diff.inDays == 1) {
      return "昨天";
    } else if (diff.inDays < 1) {
      return "${date.hour}:${date.minute}";
    } else if (nowDate.year != date.year || nowDate.month != date.month) {
      return "${date.year}/${date.month}/${date.day}";
    }
  }

  _buildListItem(int index) {
    ListItem item = _list[index - 1];
    return Container(
      height: 80.0,
      color: item.isSticky ? Color(AppColors.AppBarColor) : Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Stack(
              overflow: Overflow.visible,
              children: item.messages == 0
                  ? [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.asset(
                          item.portrait,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ]
                  : [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.asset(
                          item.portrait,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: item.messages == 1 ? -5.0 : -7.5,
                        right: item.messages == 1 ? -5.0 : -7.5,
                        child: Container(
                          width: item.messages == 1 ? 10.0 : 15.0,
                          height: item.messages == 1 ? 10.0 : 15.0,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(
                                item.messages == 1 ? 10.0 : 15.0),
                          ),
                          child: item.messages == 1
                              ? null
                              : Center(
                                  child: Text(
                                    "${item.messages > 99 ? 99 : item.messages}",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                        ),
                      )
                    ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 0,
                right: 25.0,
                bottom: 15.0,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Color(AppColors.BorderColor),
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        item.nickname,
                        style: TextStyle(
                          color: Color(AppColors.ListItemHeaderColor),
                          fontSize: 15.0,
                        ),
                      ),
                      Text(
                        _formatTime(item.datetime),
                        style: TextStyle(
                          color: Color(AppColors.ListItemThirdColor),
                          fontSize: 12.0,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: item.isMute
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.start,
                    children: item.isMute
                        ? [
                            Expanded(
                              flex: 1,
                              child: Text(
                                item.content,
                                style: TextStyle(
                                  color: Color(AppColors.ListItemSecondColor),
                                  fontSize: 13.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Icon(
                              IconData(
                                0xe6fe,
                                fontFamily: AppFonts.FontFamily,
                              ),
                              size: 14.0,
                              color: Color(AppColors.ListItemThirdColor),
                            )
                          ]
                        : [
                            Expanded(
                              child: Text(
                                item.content,
                                style: TextStyle(
                                  color: Color(AppColors.ListItemSecondColor),
                                  fontSize: 13.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      scrollDirection: Axis.vertical,
      reverse: false,
      shrinkWrap: true,
      itemCount: _list.length + 1,
      itemBuilder: (BuildContext context, int index) {
        return index == 0 ? _buildSearchInput() : _buildListItem(index);
      },
    );
  }
}
