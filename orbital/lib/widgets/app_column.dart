import 'package:flutter/material.dart';
import 'package:orbital/models/food_item_models.dart';

import 'big_texts.dart';
import 'icon_and_text_widget.dart';
import 'small_texts.dart';

class AppColumn extends StatelessWidget {
  final FoodItem item;
  const AppColumn({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BigText(
          text: item.categoryName.toString(),
          size: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Cost: ₦${item.cost}',
              style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 22, 33, 243),
                  fontWeight: FontWeight.w600),
            ),
            SmallText(
              text: "Available in ${item.restaurants} Restaurants",
              color: Colors.black,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndTextWidget(
                icon: Icons.location_on,
                text: "Makurdi",
                iconColor: Colors.redAccent),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "45 mins or less",
                iconColor: Colors.blue)
          ],
        )
      ],
    );
  }
}
