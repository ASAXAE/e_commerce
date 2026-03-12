import 'package:e_commerce/api/mock_service.dart';
import 'package:e_commerce/models/cart_item.dart';
import 'package:e_commerce/stores/cartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryView extends StatefulWidget {
  CategoryView({Key? key}) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final CartController cartController = Get.find();
  List<Map<String, String>> _categories = [];
  List<CartItem> _currentProducts = [];
  int _selectedCategoryIndex = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    setState(() => _isLoading = true);
    _categories = await MockApiService.getCategories();
    if (_categories.isNotEmpty) {
      await _loadProducts(_categories[0]['id']!);
    }
    setState(() => _isLoading = false);
  }

  Future<void> _loadProducts(String categoryId) async {
    _currentProducts = await MockApiService.getProductsByCategory(categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('分类浏览'), elevation: 0),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Row(
              children: [
                // 左侧分类列表
                Container(
                  width: 100,
                  color: Colors.grey[100],
                  child: ListView.builder(
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          if (_selectedCategoryIndex == index) return;
                          setState(() {
                            _selectedCategoryIndex = index;
                            _isLoading = true;
                          });
                          await _loadProducts(_categories[index]['id']!);
                          setState(() => _isLoading = false);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: _selectedCategoryIndex == index
                                ? Colors.white
                                : Colors.transparent,
                            border: Border(
                              left: BorderSide(
                                color: _selectedCategoryIndex == index
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                                width: 4,
                              ),
                            ),
                          ),
                          child: Text(
                            _categories[index]['name']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: _selectedCategoryIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: _selectedCategoryIndex == index
                                  ? Theme.of(context).primaryColor
                                  : Colors.black87,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // 右侧商品网格
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: GridView.builder(
                      padding: EdgeInsets.all(12),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: _currentProducts.length,
                      itemBuilder: (context, index) {
                        final product = _currentProducts[index];
                        return _buildProductCard(product);
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildProductCard(CartItem product) {
    return GestureDetector(
      onTap: () => Get.toNamed('/product-detail/${product.id}'),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey[200]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                ),
                child: Center(
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 40,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '¥${product.price.toStringAsFixed(0)}',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      IconButton(
                        constraints: BoxConstraints(),
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.add_circle,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          cartController.addToCart(product);
                          if (Get.isSnackbarOpen) {
                            Get.closeAllSnackbars();
                          }
                          Get.snackbar(
                            '成功',
                            '已将 ${product.name} 加入购物车',
                            snackPosition: SnackPosition.BOTTOM,
                            duration: Duration(seconds: 1),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
