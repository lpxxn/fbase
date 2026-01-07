import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 一般应用程序的导航是固定的
  final List<Map<String, String>> _tabList = [
    {
      "icon": "lib/asset/images/ic_public_home_normal.png",
      "activi_icon": "lib/asset/images/ic_public_home_active.png",
      "title": "首页",
    },
    {
      "icon": "lib/asset/images/ic_public_pro_normal.png",
      "activi_icon": "lib/asset/images/ic_public_pro_active.png",
      "title": "分类",
    },
    {
      "icon": "lib/asset/images/ic_public_cart_normal.png",
      "activi_icon": "lib/asset/images/ic_public_cart_active.png",
      "title": "购物车",
    },
    {
      "icon": "lib/asset/images/ic_public_my_normal.png",
      "activi_icon": "lib/asset/images/ic_public_my_active.png",
      "title": "我的",
    },
  ];

  int _currentIndex = 0;
  final Logger _logger = Logger();
  List<BottomNavigationBarItem> _getTabBarWiget() {
    return List.generate(_tabList.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tabList[index]["activi_icon"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["title"] ?? "",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("主页面")),
      body: Container(child: const Text("主页面")),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          _logger.i("onTap index is $index");
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: _getTabBarWiget(),
      ),
    );
  }
}
