import 'package:flutter/material.dart';
import 'package:orbital/models/cart_item_models.dart';
import 'package:orbital/models/food_item_models.dart';
import 'package:orbital/store/store.dart';
import 'package:orbital/widgets/food_cat.dart';
import 'package:orbital/widgets/small_texts.dart';

import 'cart.dart';

class CustomOrders extends StatefulWidget {
  const CustomOrders({Key? key}) : super(key: key);

  @override
  State<CustomOrders> createState() => _CustomOrdersState();
}

class _CustomOrdersState extends State<CustomOrders> {
  final List<bool> _expanded = [];
  List<CustomItem> addedItems = [];
  int total = 0;

  List<FoodCategoryModel> categories = [
    FoodCategoryModel("Rice", [
      CustomItem('Jellof Rice', 'images/1.jpeg', 500),
      CustomItem('White Rice', 'images/2.jpeg', 450)
    ]),
    FoodCategoryModel("Beans", [CustomItem('Beans', 'images/4.jpeg', 500)]),
    FoodCategoryModel("Yam", [CustomItem('Fried Yam', 'images/8.jpeg', 450)]),
  ];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < categories.length; i++) {
      _expanded.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 190, 9),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 2, 190, 9),
                  Color.fromARGB(255, 56, 221, 70)
                ], begin: Alignment.bottomCenter, end: Alignment.topRight),
              ),
              padding: const EdgeInsets.only(
                  // left: 20,
                  right: 20,
                  top: 15,
                  bottom: 15),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Custom Orders",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                        shadows: [Shadow(color: Colors.black, blurRadius: 3)]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("My Orders",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.6)),
                                ),
                                Expanded(child: Container()),
                                Container(
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.only(right: 5),
                                    color: const Color.fromARGB(
                                        255, 219, 219, 219),
                                    child: Text("Total: ₦$total",
                                        style: const TextStyle(
                                            color: Colors.black)))
                              ],
                            ),
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(
                              height: 50,
                              child: addedItems.isEmpty
                                  ? const Center(
                                      child: Text(
                                          'You can add items from the food category list below or you can search for food items and add them.'),
                                    )
                                  : ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: addedItems.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 219, 219, 219),
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Center(
                                            child: Text(
                                              addedItems[index].name,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        );
                                      })),
                          Container(
                            width: double.maxFinite,
                            height: 1,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  TempCart.cart.add(CartItem(
                                      addedItems, total.toString(), 1));
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const Cart())));
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 12),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 2, color: Colors.black)
                                      ],
                                      color:
                                          const Color.fromARGB(255, 2, 190, 9),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Center(
                                    child: Text(
                                      "Add to Cart",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(blurRadius: 3, color: Colors.black)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration.collapsed(
                                  hintText: "Search food items"),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Text("Food Category List",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.6)),
                        ),
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: ExpansionPanelList(
                          animationDuration: const Duration(milliseconds: 500),
                          children: foodCategories(categories),
                          dividerColor: Colors.grey,
                          expansionCallback: (panelIndex, isExpanded) {
                            _expanded[panelIndex] = !_expanded[panelIndex];
                            setState(() {});
                          },
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  foodCategories(List<FoodCategoryModel> foodCategoriesList) {
    List<ExpansionPanel> tempList = [];

    for (int i = 0; i < foodCategoriesList.length; i++) {
      tempList.add(expansionPanelWidget(foodCategoriesList[i], i));
    }
    return tempList;
  }

  expansionPanelWidget(FoodCategoryModel singleFoodCategory, int index) {
    return ExpansionPanel(
      headerBuilder: (context, isExpanded) {
        return ListTile(title: Text(singleFoodCategory.catName));
      },
      body: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: customItemsWidget(singleFoodCategory.items)),
      isExpanded: _expanded[index],
      canTapOnHeader: true,
    );
  }

  customItemsWidget(List<CustomItem> items) {
    List<Widget> tempList = [];
    for (int i = 0; i < items.length; i++) {
      tempList.add(foodItem(items[i]));
    }
    return tempList;
  }

  foodItem(CustomItem item) {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 5, bottom: 5),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 172, 172, 172).withAlpha(220),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  item.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 40,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    color: Color.fromARGB(255, 238, 235, 235)),
                child: Row(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: CatText(text: item.name)),
                      Container(
                        margin: const EdgeInsets.only(top: 2, left: 10),
                        child: SmallText(
                          text: "Cost: ₦" + item.cost.toString(),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () {
                      setState(() {
                        int temp = 0;
                        addedItems.add(item);
                        for (int i = 0; i < addedItems.length; i++) {
                          temp += addedItems[i].cost;
                        }
                        total = temp;
                      });
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 7, bottom: 7, right: 7),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(blurRadius: 1.2, color: Colors.black)
                          ],
                          color: const Color.fromARGB(255, 2, 190, 9),
                          borderRadius: BorderRadius.circular(25)),
                      child: const Center(
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            )
          ],
        ));
  }
}
