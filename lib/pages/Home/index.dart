import 'package:e_commerce/components/Home/Category.dart';
import 'package:e_commerce/components/Home/Hot.dart';
import 'package:e_commerce/components/Home/MoreList.dart';
import 'package:e_commerce/components/Home/Suggestion.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/components/Home/Silder.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: Silder()),
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
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
