import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 左侧抽屉组件
class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("Pinger",
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold)),
              accountEmail: Text(
                "xmpinger@gmail.com",
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://c-ssl.duitang.com/uploads/item/201510/08/20151008214601_zWGtF.thumb.1000_0.jpeg"),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590410459242&di=38daa6c19f241e632b88b25529f91630&imgtype=0&src=http%3A%2F%2Fku.90sjimg.com%2Fback_pic%2F00%2F02%2F81%2F89561b4c6180010.png"),
                      fit: BoxFit.cover))),
          ListTile(
            title: Text(
              "消息",
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.message,
              size: 24,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              "设置",
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.settings,
              size: 24,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
