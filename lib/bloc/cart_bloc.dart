import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_demo/model/entity/cart_item.dart';

class CartBloc extends ChangeNotifier{
  List<CartItem> _cartItems = [];

  Stream<List<CartItem>> get cartItemsStream => Stream.value(_cartItems);

  void addToCart(CartItem item) {
    CartItem? existingItem;
    for (var cartItem in _cartItems) {
      if (cartItem.id == item.id) {
        existingItem = cartItem;
        break;
      }
    }
    if (existingItem != null) {
      // Nếu sản phẩm đã tồn tại, chỉ cần tăng số lượng
      existingItem.quantity += item.quantity;
    } else {
      // Nếu sản phẩm chưa tồn tại, thêm sản phẩm mới vào giỏ hàng
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void removeFromCart(int itemId) {
    _cartItems.removeWhere((item) => item.id == itemId);
    notifyListeners();
  }

  double getTotalPrice() {
    return _cartItems.fold(0, (previousValue, element) => previousValue + (element.price * element.quantity));
  }

}
