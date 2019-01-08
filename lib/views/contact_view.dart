import 'package:flutter/material.dart';
import '../constants/constants.dart' show AppColors;

class ContactView extends StatefulWidget {
  _ContactViewState createState() => _ContactViewState();
}

class _ContactListGroup {
  _ContactListGroup(
      {Key key, List<_ContactListItem> contactGroup, String groupIndex})
      : _contactGroup = contactGroup,
        _groupIndex = groupIndex;

  final List<_ContactListItem> _contactGroup;
  final String _groupIndex;

  get item {
    List<Widget> contactGroup = [];
    if (_groupIndex.isNotEmpty) {
      contactGroup.add(Container(
        padding: const EdgeInsets.only(
          left: 15.0,
          top: 10.0,
          bottom: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              _groupIndex,
              style: TextStyle(
                color: Color(AppColors.ListItemSecondColor),
                fontSize: 13.0,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Color(AppColors.AppBarColor),
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
      ));
    }

    int groupLength = _contactGroup.length;
    int index = 0;

    _contactGroup.forEach((_ContactListItem item) {
      index++;
      contactGroup.add(item.getItem(groupLength, index));
    });

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: contactGroup,
      ),
      color: Colors.white,
    );
  }
}

class _ContactListItem {
  _ContactListItem({Key key, String avatarPath, String friendName})
      : _avatarPath = avatarPath,
        _friendName = friendName;

  final String _avatarPath;
  final String _friendName;

  Widget getItem(int groupLength, int index) {
    return Container(
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.asset(
                _avatarPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 60.0,
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(_friendName),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ContactViewState extends State<ContactView> {
  List<_ContactListGroup> _contactList;
  int len;

  initState() {
    super.initState();
    _contactList = [
      _ContactListGroup(
        contactGroup: [
          _ContactListItem(
            avatarPath: "assets/images/avatar/newFriends.png",
            friendName: "新的朋友",
          ),
          _ContactListItem(
            avatarPath: "assets/images/avatar/groupChats.png",
            friendName: "群聊",
          ),
          _ContactListItem(
            avatarPath: "assets/images/avatar/tagsIcon.png",
            friendName: "标签",
          ),
          _ContactListItem(
            avatarPath: "assets/images/avatar/officialAccounts.png",
            friendName: "公众号",
          ),
        ],
        groupIndex: "",
      ),
      _ContactListGroup(
        contactGroup: [
          _ContactListItem(
            avatarPath: "assets/images/portrait/8.jpg",
            friendName: "陈玉梅",
          ),
          _ContactListItem(
            avatarPath: "assets/images/portrait/9.jpg",
            friendName: "陈胜利",
          ),
          _ContactListItem(
            avatarPath: "assets/images/portrait/10.jpg",
            friendName: "车平台",
          ),
        ],
        groupIndex: "C",
      ),
      _ContactListGroup(
        contactGroup: [
          _ContactListItem(
            avatarPath: "assets/images/portrait/11.jpg",
            friendName: "方希",
          ),
          _ContactListItem(
            avatarPath: "assets/images/portrait/12.jpg",
            friendName: "费玉清",
          ),
          _ContactListItem(
            avatarPath: "assets/images/portrait/13.jpg",
            friendName: "符秋",
          ),
        ],
        groupIndex: "F",
      ),
      _ContactListGroup(
        contactGroup: [
          _ContactListItem(
            avatarPath: "assets/images/portrait/14.jpg",
            friendName: "沐舒坦",
          ),
          _ContactListItem(
            avatarPath: "assets/images/portrait/15.jpg",
            friendName: "明道",
          ),
        ],
        groupIndex: "M",
      ),
      _ContactListGroup(
        contactGroup: [
          _ContactListItem(
            avatarPath: "assets/images/portrait/16.jpg",
            friendName: "郑成功",
          ),
        ],
        groupIndex: "Z",
      ),
    ];
    len = _contactList.length;
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
          hintText: "搜索",
          hintStyle: TextStyle(
            color: Color(AppColors.ListItemSecondColor),
            fontSize: 12.0,
          ),
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

  Widget _buildTotalContact() {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(
              AppColors.BorderColor,
            ),
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: Center(
        child: Text(
          "8位联系人",
          style: TextStyle(
            color: Color(AppColors.ListItemSecondColor),
            fontSize: 13.0,
          ),
        ),
      ),
    );
  }

  Widget getListItem(int index) {
    if (index == 0) {
      return _buildSearchInput();
    } else if (index == _contactList.length) {
      return _buildTotalContact();
    } else {
      return _contactList[index - 1].item;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return getListItem(index);
        },
        itemCount: _contactList.length + 1,
      ),
    );
  }
}
