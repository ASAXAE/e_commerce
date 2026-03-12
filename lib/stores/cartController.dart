import 'dart:convert';
import 'package:get/get.dart';
import 'package:e_commerce/models/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;
  static const String _storageKey = 'cart_items';

  @override
  void onInit() {
    super.onInit();
    _loadCartFromStorage();
  }

  Future<void> _loadCartFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedItems = prefs.getString(_storageKey);
    if (storedItems != null) {
      final List<dynamic> decodedItems = jsonDecode(storedItems);
      cartItems.value = decodedItems
          .map((item) => CartItem.fromJson(item as Map<String, dynamic>))
          .toList();
    }
  }

  Future<void> _saveCartToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedItems = jsonEncode(
      cartItems.map((item) => item.toJson()).toList(),
    );
    await prefs.setString(_storageKey, encodedItems);
  }

  void addToCart(CartItem item) {
    final index = cartItems.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(item);
    }
    cartItems.refresh();
    _saveCartToStorage();
  }

  void removeFromCart(CartItem item) {
    cartItems.remove(item);
    _saveCartToStorage();
  }

  void incrementQuantity(CartItem item) {
    item.quantity++;
    cartItems.refresh();
    _saveCartToStorage();
  }

  void decrementQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      cartItems.refresh();
      _saveCartToStorage();
    }
  }

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
}
