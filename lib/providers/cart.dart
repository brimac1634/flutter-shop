import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double _total = 0.0;
    _items.forEach((key, item) {
      _total += item.price * item.quantity;
    });
    return _total;
  }

  void addItem({String productId, double price, String title}) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (cartItem) => CartItem(
              id: cartItem.id,
              price: cartItem.price,
              title: cartItem.title,
              quantity: cartItem.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              price: price,
              title: title,
              quantity: 1));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) return;
    if (_items[productId].quantity > 1) {
      _items.update(productId, (value) {
        return CartItem(
            id: value.id,
            price: value.price,
            quantity: value.quantity - 1,
            title: value.title);
      });
      notifyListeners();
    } else {
      removeItem(productId);
    }
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
