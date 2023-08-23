import 'package:flutter/material.dart';
import 'package:orbital/models/cart_item_models.dart';
import 'package:orbital/models/food_item_models.dart';
import 'package:orbital/store/store.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
                      "Cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                          shadows: [
                            Shadow(color: Colors.black, blurRadius: 3)
                          ]),
                    ),
                    Expanded(child: Container()),
                    const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: _cartWidgetList(TempCart.cart),
                ),
              )
            ],
          ),
        ));
  }

  _itemBox(CustomItem itemName) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 219, 219, 219),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(25)),
      child: Center(
        child: Text(
          itemName.name,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  _itemWidgetList(List<CustomItem> items) {
    List<Widget> temp = [];
    for (int i = 0; i < items.length; i++) {
      temp.add(_itemBox(items[i]));
    }
    return temp;
  }

  _cartBox(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
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
                  child: Text("Order ID: VS443",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6)),
                ),
                Expanded(child: Container()),
                Container(
                  width: 30,
                  height: 30,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 219, 219, 219),
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                      child: Icon(
                    Icons.clear,
                    size: 18,
                  )),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(right: 5),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  // width: MediaQuery.of(context).size.width * 0.6,
                  child: SizedBox(
                    height: 50,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: _itemWidgetList(TempCart.cart[index].items)),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(seconds: 7),
                    content: Text(
                        "Next screen will be to select user location from google map, then make payments via any of the selected payment methods. *(Coming soon)"),
                  ));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(blurRadius: 2, color: Colors.black)
                      ],
                      color: const Color.fromARGB(255, 2, 190, 9),
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Text(
                      "Place Order",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: const Text(
                  "Quantity: ",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              IconButton(
                padding: const EdgeInsets.all(5),
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    TempCart.cart[index].qty--;
                  });
                },
              ),
              const SizedBox(
                width: 5,
              ),
              Text(TempCart.cart[index].qty.toString()),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                padding: const EdgeInsets.all(5),
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    TempCart.cart[index].qty++;
                  });
                },
              ),
              Expanded(child: Container()),
              Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(right: 5),
                  color: const Color.fromARGB(255, 219, 219, 219),
                  child: Text(
                      "Total Cost: ${(int.parse(TempCart.cart[index].cost) * TempCart.cart[index].qty)}",
                      style: TextStyle(color: Colors.black)))
            ],
          )
        ],
      ),
    );
  }

  _cartWidgetList(List<CartItem> items) {
    List<Widget> temp = [];
    for (int i = 0; i < items.length; i++) {
      temp.add(_cartBox(i));
    }
    return temp;
  }
}
