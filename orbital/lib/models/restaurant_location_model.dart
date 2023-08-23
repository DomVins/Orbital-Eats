class RestaurantModel {
  String? restaurantName;
  List<String>? info;

  RestaurantModel(this.restaurantName, this.info);

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    restaurantName = json["restaurantName"];
    info = json["info"];
  }
}
