import 'package:e_commerce/api/home.dart';
import 'package:e_commerce/components/Home/Category.dart';
import 'package:e_commerce/components/Home/Hot.dart';
import 'package:e_commerce/components/Home/MoreList.dart';
import 'package:e_commerce/components/Home/Suggestion.dart';
import 'package:e_commerce/viewmodels/Home.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/components/Home/HomeSlider.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannerList = [
    // BannerItem(
    //   id: '1',
    //   imageUrl: 'https://www.w3schools.com/css/img_5terre.jpg',
    // ),
    // BannerItem(
    //   id: '2',
    //   imageUrl: 'https://www.w3schools.com/w3css/img_lights.jpg',
    // ),
    // BannerItem(
    //   id: '3',
    //   imageUrl:
    //       'https://t4.ftcdn.net/jpg/02/91/24/27/360_F_291242770_z3XC7rJB1Mvc5jVMsEY9Dx2xMrX4sxUi.jpg',
    // ),
  ];
  //https://www.w3schools.com/css/img_5terre.jpg
  //https://www.w3schools.com/w3css/img_lights.jpg
  //https://t4.ftcdn.net/jpg/02/91/24/27/360_F_291242770_z3XC7rJB1Mvc5jVMsEY9Dx2xMrX4sxUi.jpg

  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: HomeSlider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      //SilverGrid SilverList只能纵向排列
      SliverToBoxAdapter(child: Category()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Suggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: Hot()),
              SizedBox(width: 10),
              Expanded(child: Hot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      MoreList(),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannerList();
  }

  void _getBannerList() async {
    try {
      _bannerList = await getBannerListAPI();
      setState(() {});
    } catch (e) {
      print('获取轮播图失败: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
