import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/viewmodels/Home.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  HomeSlider({Key? key, required this.bannerList}) : super(key: key);

  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  CarouselSliderController _controller = CarouselSliderController(); //轮播图跳转控制器
  int _currentIndex = 0; //当前轮播图索引

  Widget _getSlider() {
    //在flutter里获取屏幕宽度的方法
    final double screenWidth = MediaQuery.of(context).size.width;
    return CarouselSlider(
      carouselController: _controller, //绑定Controler
      items: List.generate(widget.bannerList.length, (index) {
        return Image.network(
          widget.bannerList[index].imageUrl,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        height: 300,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
        //autoPlayAnimationDuration: Duration(seconds: 5),
        viewportFraction: 1.0,
        autoPlay: true,
      ),
    );
  }

  //搜索框部件
  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 10,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: ' 搜索...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  //指示灯导航部件
  Widget _getDot() {
    return Positioned(
      right: 0,
      left: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (index) {
            return GestureDetector(
              onTap: () {
                _controller.jumpToPage(index);
              },
              child: AnimatedContainer(
                duration: Duration(microseconds: 300),
                height: 6,
                width: index == _currentIndex ? 40 : 10,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: index == _currentIndex
                      ? Colors.white
                      : Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // stack 轮播图 搜索框 指示灯导航
    return Stack(children: [_getSlider(), _getSearch(), _getDot()]);
    // return Container(
    //   height: 300,
    //   color: Colors.blue,
    //   alignment: Alignment.center,
    //   child: Text('轮播图', style: TextStyle(fontSize: 20, color: Colors.white)),
    // );
  }
}
