import 'package:e_commerce/viewmodels/Home.dart';
import 'package:flutter/material.dart';

class Suggestion extends StatefulWidget {
  //特惠推荐
  final SpecialRecommendResult specialRecommendResult;
  Suggestion({Key? key, required this.specialRecommendResult})
    : super(key: key);

  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  //取前三条
  List<GoodsItem> _getDisplayItems() {
    if (widget.specialRecommendResult.subTypes.isEmpty) {
      return [];
    }
    return widget.specialRecommendResult.subTypes.first.goodsItems.items
        .take(3)
        .toList();
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          '特惠推荐',
          style: TextStyle(
            color: const Color.fromARGB(255, 118, 23, 23),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Text(
          '省选攻略',
          style: TextStyle(
            color: const Color.fromARGB(255, 134, 26, 26),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  //左侧结构
  Widget _buildLeft() {
    return Container(
      width: 100,
      height: 140,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('lib/assets/home_cmd_inner.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  List<Widget> _getChilderList() {
    List<GoodsItem> list = _getDisplayItems();
    return List.generate(list.length, (index) {
      return Column(
        children: [
          //ClipRRect 可以包裹子元素，实现圆角效果
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              //如果图片加载失败，显示默认图片
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'lib/assets/home_cmd_inner.png',
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover,
                );
              },

              list[index].picture,
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 223, 176, 36),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "￥${list[index].price}",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      );
    });
  }

  //完成渲染
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(12),
        //height: 300,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          //color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage('lib/assets/home_cmd_sm.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            //顶部内容
            _buildHeader(),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLeft(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _getChilderList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
