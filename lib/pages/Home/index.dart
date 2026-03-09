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
  //分类列表
  List<CategoryItem> _categoryList = [];
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

  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: HomeSlider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      //SilverGrid SilverList只能纵向排列
      SliverToBoxAdapter(child: Category(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Suggestion(specialRecommendResult: _specialRecommendResult),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Hot(result: _inVogueResult, type: "hot"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Hot(result: _oneStopResult, type: "step"),
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      MoreList(recommendList: _recommendList),
    ];
  }

  //特惠推荐
  SpecialRecommendResult _specialRecommendResult = SpecialRecommendResult(
    id: '',
    title: '',
    subTypes: [],
  );
  // 热榜推荐
  SpecialRecommendResult _inVogueResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );
  // 一站式推荐
  SpecialRecommendResult _oneStopResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );

  // 获取热榜推荐列表
  void _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  // 获取一站式推荐列表
  void _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }

  // 推荐列表
  List<GoodDetailItem> _recommendList = [];

  // 获取推荐列表
  void _getRecommendList() async {
    _recommendList = await getRecommendListAPI({"limit": 10});
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getSpecialRecommendList();
    _getInVogueList();
    _getOneStopList();
    _getRecommendList();
  }

  //获取特惠推荐列表
  void _getSpecialRecommendList() async {
    try {
      _specialRecommendResult = await getSpecialRecommendListAPI();
      setState(() {});
    } catch (e) {
      print('获取特惠推荐列表失败: $e');
    }
  }

  //获取轮播图列表
  void _getBannerList() async {
    try {
      _bannerList = await getBannerListAPI();
      setState(() {});
    } catch (e) {
      print('获取轮播图失败: $e');
    }
  }

  //获取分类列表
  void _getCategoryList() async {
    try {
      _categoryList = await getCategoryListAPI();
      setState(() {});
    } catch (e) {
      print('获取分类列表失败: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
