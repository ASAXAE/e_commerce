import 'package:e_commerce/api/mock_service.dart';
import 'package:e_commerce/models/cart_item.dart';
import 'package:e_commerce/stores/cartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailView extends StatefulWidget {
  final String productId;

  ProductDetailView({Key? key, required this.productId}) : super(key: key);

  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  final CartController cartController = Get.find();
  late Future<CartItem> _productFuture;

  @override
  void initState() {
    super.initState();
    _productFuture = MockApiService.getProductDetail(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () => Get.toNamed('/cart'),
          ),
        ],
      ),
      body: FutureBuilder<CartItem>(
        future: _productFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('加载失败'));
          }
          final product = snapshot.data!;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 商品大图占位
                      Container(
                        width: double.infinity,
                        height: 300,
                        color: Colors.grey[100],
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          size: 100,
                          color: Colors.grey[300],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '¥${product.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              product.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            Divider(),
                            Text(
                              '商品详情描述',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '这是一段模拟的商品详细描述。在这里，你可以详细介绍商品的特点、材质、使用方法等。通过更丰富的文字描述和精美的图片，可以有效提升用户的购买欲望。',
                              style: TextStyle(
                                color: Colors.black87,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // 底部购买栏
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.storefront, color: Colors.grey[600]),
                          Text('店铺', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            color: Colors.grey[600],
                          ),
                          Text('客服', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(25),
                              ),
                            ),
                          ),
                          onPressed: () {
                            cartController.addToCart(product);
                            if (Get.isSnackbarOpen) {
                              Get.closeAllSnackbars();
                            }
                            Get.snackbar(
                              '提醒',
                              '已加入购物车',
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          },
                          child: Text(
                            '加入购物车',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(25),
                              ),
                            ),
                          ),
                          onPressed: () {
                            // 模拟立即购买逻辑
                            cartController.addToCart(product);
                            Get.toNamed('/cart');
                          },
                          child: Text(
                            '立即购买',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
