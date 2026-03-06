class BannerItem {
  String id;
  String imageUrl;
  BannerItem({required this.id, required this.imageUrl});
  //扩展一个工厂函数 一般用factory声明 一般用来创建实例对象
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    //调用 BannerItem.fromJson(data) ，将 Map 里的值填入对象属性。
    return BannerItem(id: json['id'] ?? '', imageUrl: json['imgUrl'] ?? '');
  }
}

//每一个轮播图的具体类型

//flutter必须强制转换 没有隐式转换
