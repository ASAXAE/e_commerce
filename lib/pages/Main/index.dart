import 'package:e_commerce/pages/Category/index.dart';
import 'package:e_commerce/pages/Home/index.dart';
import 'package:e_commerce/pages/Mine/index.dart';
import 'package:e_commerce/pages/cart/index.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //定义数据 根据数据进行渲染4个导航
  //一般程序的导航是固定的
  final List<Map<String, String>> _tabList = [
    {
      'icon': 'lib/assets/ic_public_home_normal.png', //正常图标
      'active_icon': 'lib/assets/ic_public_home_active.png', //激活图标
      'text': '首页',
    },
    {
      'icon': 'lib/assets/ic_public_pro_normal.png', //正常图标
      'active_icon': 'lib/assets/ic_public_pro_active.png', //激活图标
      'text': '分类',
    },
    {
      'icon': 'lib/assets/ic_public_cart_normal.png', //正常图标
      'active_icon': 'lib/assets/ic_public_cart_active.png', //激活图标
      'text': '购物车',
    },
    {
      'icon': 'lib/assets/ic_public_my_normal.png', //正常图标
      'active_icon': 'lib/assets/ic_public_my_active.png', //激活图标
      'text': '我的',
    },
  ];
  int _currentIndex = 0;

  //返回底部渲染的四个分类
  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_tabList.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]['icon']!, width: 24, height: 24),
        activeIcon: Image.asset(
          _tabList[index]['active_icon']!,
          width: 24,
          height: 24,
        ),
        label: _tabList[index]['text'],
      );
    });
  }

  List<Widget> _getChildern() {
    return [HomeView(), CategoryView(), CartView(), MineView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 安全区域
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getChildern()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _getTabBarWidget(),
      ),
    );
  }
}
