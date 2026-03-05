import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    //返回横向滚动组件 而ListView不能设高度
    //return ListView();
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            height: 100,
            color: Colors.blue,
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(
              '分类${index + 1}',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
