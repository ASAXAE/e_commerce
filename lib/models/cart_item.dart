class CartItem {
  final String id;
  final String name;
  final double price;
  int quantity;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      imageUrl: json['imageUrl'],
    );
  }
}
