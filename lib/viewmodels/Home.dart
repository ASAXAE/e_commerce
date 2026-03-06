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
//分类列表
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  List<dynamic>? goods;

  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
    this.goods,
  });

  // 工厂构造函数，用于从 JSON 转换
  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      picture: json['picture'] ?? '',
      children: json['children'] != null
          ? (json['children'] as List)
                .map((i) => CategoryItem.fromJson(i))
                .toList()
          : null,
      goods: json['goods'],
    );
  }
}
