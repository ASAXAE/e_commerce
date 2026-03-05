import 'package:flutter/material.dart';

class MoreList extends StatefulWidget {
  MoreList({Key? key}) : super(key: key);

  @override
  _MoreListState createState() => _MoreListState();
}

class _MoreListState extends State<MoreList> {
  @override
  Widget build(BuildContext context) {
    //必须是Sliver家族组件
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Container(
          child: Text(
            '商品',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          color: Colors.blue,
          alignment: Alignment.center,
        );
      },
    );
  }
}
