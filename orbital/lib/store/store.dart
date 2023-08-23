import 'package:flutter/material.dart';
import 'package:orbital/models/cart_item_models.dart';

class UserStore {
  static ValueNotifier<bool> isLoggedIn = ValueNotifier(false);
}

class TempCart {
  static List<CartItem> cart = [];
}
