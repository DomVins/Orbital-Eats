class FoodItem {
  String? categoryName;
  String? cost;
  String? restaurants;
  String? imageUrl;

  FoodItem(this.categoryName, this.cost, this.restaurants, this.imageUrl);

  FoodItem.fromJson(Map<String, dynamic> json) {
    categoryName = json["categoryName"];
    cost = json["cost"];
    restaurants = json["restaurants"];
    imageUrl = json["imageUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["categoryName"] = categoryName;
    data["cost"] = cost;
    data["restaurants"] = restaurants;
    data["imageUrl"] = imageUrl;
    return data;
  }
}

class CustomItem {
  final String name;
  final String imageUrl;
  final int cost;

  CustomItem(this.name, this.imageUrl, this.cost);
}

class FoodCategoryModel {
  final String catName;
  final List<CustomItem> items;

  FoodCategoryModel(this.catName, this.items);
}
