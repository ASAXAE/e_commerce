import 'package:e_commerce/models/cart_item.dart';
import 'package:e_commerce/stores/cartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('购物车')),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (cartController.cartItems.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 100,
                        color: Colors.grey[300],
                      ),
                      SizedBox(height: 16),
                      Text(
                        '购物车是空的',
                        style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            color: Colors.grey[300],
                            child: Icon(
                              Icons.image,
                              size: 40,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '￥${item.price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () =>
                                    cartController.decrementQuantity(item),
                              ),
                              Text(
                                item.quantity.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () =>
                                    cartController.incrementQuantity(item),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () =>
                                cartController.removeFromCart(item),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          // Bottom summary and checkout button
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '合计: ￥${cartController.totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('结算'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
