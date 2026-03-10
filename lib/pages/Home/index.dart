import 'package:e_commerce/api/home.dart';
import 'package:e_commerce/components/Home/Category.dart';
import 'package:e_commerce/components/Home/Hot.dart';
import 'package:e_commerce/components/Home/MoreList.dart';
import 'package:e_commerce/components/Home/Suggestion.dart';
import 'package:e_commerce/utils/ToastUtils.dart';
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

  // 推荐列表
  List<GoodDetailItem> _recommendList = [];

  //页码
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getBannerList();
    // _getCategoryList();
    // _getSpecialRecommendList();
    // _getInVogueList();
    // _getOneStopList();
    //_getRecommendList();
    _registerEvent();
    Future.microtask(() {
      _paddingTop = 100;
      setState(() {});
      _refreshIndicatorKey.currentState?.show();
    });
  }
  // initState > build => 下来刷新组件 =>show()
  //Future.microtask

  // 获取推荐列表
  Future<void> _getRecommendList() async {
    if (_isLoading || !_hasMore) {
      return;
    }
    _isLoading = true;
    int requestLimit = _page * 8;
    final list = await getRecommendListAPI({"limit": requestLimit});
    _recommendList.addAll(list);
    _page++;

    _isLoading = false;
    _hasMore = _recommendList.length >= requestLimit;
  }

  // 获取热榜推荐列表
  Future<void> _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
  }

  // 获取一站式推荐列表
  Future<void> _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
  }

  //获取特惠推荐列表
  Future<void> _getSpecialRecommendList() async {
    try {
      _specialRecommendResult = await getSpecialRecommendListAPI();
    } catch (e) {
      print('获取特惠推荐列表失败: $e');
    }
  }

  //获取轮播图列表
  Future<void> _getBannerList() async {
    try {
      _bannerList = await getBannerListAPI();
    } catch (e) {
      print('获取轮播图失败: $e');
    }
  }

  //获取分类列表
  Future<void> _getCategoryList() async {
    try {
      _categoryList = await getCategoryListAPI();
    } catch (e) {
      print('获取分类列表失败: $e');
    }
  }

  //监听滚动到底部的事件
  void _registerEvent() {
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent - _controller.position.pixels <=
          50) {
        // 当滚动到距离底部 50 像素时，加载更多
        _getRecommendList();
      }
    });
  }

  Future<void> _onRefresh() async {
    _page = 1;
    _isLoading = false;
    _hasMore = true;
    await _getBannerList();
    await _getCategoryList();
    await _getSpecialRecommendList();
    await _getInVogueList();
    await _getOneStopList();
    await _getRecommendList();
    // 数据获取成功
    ToastUtils.showToast(context, msg: '刷新成功');
    setState(() {});
    _paddingTop = 0;
  }

  final ScrollController _controller = ScrollController();

  // GlobalKey是一个方法可以创建一个key绑定到widget上，
  // 可以通过key来获取widget的状态
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  double _paddingTop = 0;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _onRefresh,
      child: AnimatedContainer(
        padding: EdgeInsets.only(top: _paddingTop),
        duration: Duration(milliseconds: 300),
        child: CustomScrollView(
          controller: _controller,
          slivers: _getScrollChildren(),
        ),
      ),
    );
  }
}
//动画组件