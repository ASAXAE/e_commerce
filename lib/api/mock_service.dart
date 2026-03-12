import 'package:e_commerce/models/cart_item.dart';

class MockApiService {
  // 模拟网络延迟
  static Future<void> _delay() => Future.delayed(Duration(milliseconds: 500));

  // 获取所有分类
  static Future<List<Map<String, String>>> getCategories() async {
    await _delay();
    return [
      {'id': '1', 'name': '数码电子'},
      {'id': '2', 'name': '时尚服饰'},
      {'id': '3', 'name': '居家生活'},
      {'id': '4', 'name': '户外运动'},
      {'id': '5', 'name': '美妆护肤'},
      {'id': '6', 'name': '图书文具'},
    ];
  }

  // 根据分类ID获取商品列表
  static Future<List<CartItem>> getProductsByCategory(String categoryId) async {
    await _delay();
    Map<String, List<CartItem>> mockData = {
      '1': [
        CartItem(id: '101', name: '旗舰智能手机', price: 5999.0, imageUrl: ''),
        CartItem(id: '102', name: '降噪蓝牙耳机', price: 1299.0, imageUrl: ''),
        CartItem(id: '103', name: '超薄笔记本电脑', price: 8999.0, imageUrl: ''),
      ],
      '2': [
        CartItem(id: '201', name: '经典白色T恤', price: 129.0, imageUrl: ''),
        CartItem(id: '202', name: '修身牛仔裤', price: 299.0, imageUrl: ''),
        CartItem(id: '203', name: '时尚运动鞋', price: 499.0, imageUrl: ''),
      ],
      '3': [
        CartItem(id: '301', name: '记忆棉枕头', price: 159.0, imageUrl: ''),
        CartItem(id: '302', name: '不锈钢保温杯', price: 89.0, imageUrl: ''),
        CartItem(id: '303', name: '香薰机', price: 199.0, imageUrl: ''),
      ],
      '4': [
        CartItem(id: '401', name: '专业登山杖', price: 259.0, imageUrl: ''),
        CartItem(id: '402', name: '便携式帐篷', price: 599.0, imageUrl: ''),
        CartItem(id: '403', name: '多功能背包', price: 399.0, imageUrl: ''),
      ],
      '5': [
        CartItem(id: '501', name: '保湿面霜', price: 189.0, imageUrl: ''),
        CartItem(id: '502', name: '哑光口红', price: 129.0, imageUrl: ''),
        CartItem(id: '503', name: '防晒霜SPF50+', price: 159.0, imageUrl: ''),
      ],
      '6': [
        CartItem(id: '601', name: '精装世界地图册', price: 99.0, imageUrl: ''),
        CartItem(id: '602', name: '钢笔墨水套装', price: 259.0, imageUrl: ''),
        CartItem(id: '603', name: '极简笔记本', price: 39.0, imageUrl: ''),
      ],
    };
    return mockData[categoryId] ?? [];
  }

  // 获取商品详情 (这里简单复用 CartItem，未来可以扩展为更详细的 Product 模型)
  static Future<CartItem> getProductDetail(String productId) async {
    await _delay();
    // 简单查找示例
    return CartItem(
      id: productId,
      name: '商品 $productId',
      price: 99.0,
      imageUrl: '',
    );
  }
}
