import 'package:orbital/models/food_item_models.dart';

class CartItem {
  List<CustomItem> items = [];
  String cost;
  int qty;

  CartItem(this.items, this.cost, this.qty);
}
