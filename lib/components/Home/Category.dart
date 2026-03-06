import 'package:e_commerce/viewmodels/Home.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  //分类列表
  final List<CategoryItem> categoryList;
  Category({Key? key, required this.categoryList}) : super(key: key);

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
        itemCount: widget.categoryList.length,
        itemBuilder: (context, index) {
          //从分类列表中获取数据
          final item = widget.categoryList[index];
          return Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 226, 229, 232),
              borderRadius: BorderRadius.circular(40),
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(item.picture, width: 40, height: 40),
                Text(item.name, style: TextStyle(color: Colors.black)),
              ],
            ),
          );
        },
      ),
    );
  }
}
