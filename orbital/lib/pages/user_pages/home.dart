// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:orbital/models/food_item_models.dart';
import 'package:orbital/models/restaurant_location_model.dart';
import 'package:orbital/pages/user_pages/login.dart';
import 'package:orbital/store/store.dart';
import 'package:orbital/widgets/app_column.dart';
// import '../admin_pages/admin_login.dart';
import 'cart.dart';
import 'custom_order.dart';
import 'signup.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* final Stream<QuerySnapshot> featured_food =
      FirebaseFirestore.instance.collection('featured').snapshots(); */

/*   List<RestaurantLoationModel> restaurants = [
    RestaurantLoationModel(
        "Lady P", ["Located along Gboko road", "Opens from 8am to 10pm"]),
    RestaurantLoationModel(
        "Steam Fast", ["Located along Otukpo road", "Opens from 8am to 10pm"]),
    RestaurantLoationModel(
        "MS Lush", ["Located along Enugu road", "Opens from 8am to 10pm"]),
    RestaurantLoationModel(
        "Ostrich", ["Located along Uniagric road", "Opens from 8am to 10pm"]),
    RestaurantLoationModel(
        "Mr Biggs", ["Located along Wada road", "Opens from 8am to 10pm"]),
    RestaurantLoationModel(
        "Lady P", ["Located along Gboko road", "Opens from 8am to 10pm"]),
    RestaurantLoationModel(
        "Steam Fast", ["Located along Otukpo road", "Opens from 8am to 10pm"]),
    RestaurantLoationModel(
        "MS Lush", ["Located along Enugu road", "Opens from 8am to 10pm"]),
    RestaurantLoationModel(
        "Ostrich", ["Located along Uniagric road", "Opens from 8am to 10pm"]),
    RestaurantLoationModel(
        "Mr Biggs", ["Located along Wada road", "Opens from 8am to 10pm"])
  ]; */
  final List<bool> _expanded = [];

  List<FoodItem> fFood = [
    FoodItem("Fried Rice and Coke", "1000", "7", "images/1.jpeg"),
    FoodItem("Juice", "650", "11", "images/9.jpeg"),
    FoodItem("Fried Rice and Coke", "1000", "4", "images/20.jpeg"),
    FoodItem("Eba and Ogbono Soup", "950", "7", "images/4.jpeg")
  ];
  List<FoodItem> pFood = [
    FoodItem("Eba and Ogbono Soup", "950", "7", "images/4.jpeg"),
    FoodItem("Fried Rice and Coke", "1000", "7", "images/1.jpeg"),
    FoodItem("Juice", "650", "11", "images/9.jpeg"),
    FoodItem("Fried Rice and Coke", "1000", "4", "images/20.jpeg"),
  ];
  List<RestaurantModel> rests = [
    RestaurantModel(
        "Lady P", ["Located along Gboko road", "Opens from 8am to 10pm"]),
    RestaurantModel(
        "Steam Fast", ["Located along Otukpo road", "Opens from 8am to 10pm"]),
    RestaurantModel("Springs", ["Wurkum", "Benue State"]),
    RestaurantModel(
        "Ostrich", ["Located along Uniagric road", "Opens from 8am to 10pm"]),
    RestaurantModel(
        "MS Lush", ["Located along Enugu road", "Opens from 8am to 10pm"]),
    RestaurantModel(
        "Mr Biggs", ["Located along Wada road", "Opens from 8am to 10pm"])
  ];

  /* Stream<List<FoodItem>> readFeaturedFood() => FirebaseFirestore.instance
      .collection('featured')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => FoodItem.fromJson(doc.data())).toList());

  Stream<List<FoodItem>> readPopularFood() => FirebaseFirestore.instance
      .collection('popular')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => FoodItem.fromJson(doc.data())).toList());

  Stream<List<RestaurantModel>> readRestaurants() => FirebaseFirestore.instance
      .collection('restaurants')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => RestaurantModel.fromJson(doc.data()))
          .toList()); */

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < rests.length; i++) {
      _expanded.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: UserStore.isLoggedIn,
      builder: (context, value, child) {
        return Column(children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 3, 182, 9),
                Color.fromARGB(255, 56, 221, 70)
              ], begin: Alignment.bottomCenter, end: Alignment.topRight),
            ),
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: MediaQuery.of(context).size.height * 0.06,
                bottom: 15),
            child: Row(
              children: [
                InkWell(
                    onLongPress: () {
                      /*  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminLogin())); */
                    },
                    child: Image.asset(
                      'images/logo.png',
                      height: 40,
                    )
                    /*  const Text(
                    "Orbital",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.7,
                        shadows: [Shadow(color: Colors.black, blurRadius: 1)]),
                  ), */
                    ),
                Expanded(child: Container()),
                InkWell(
                  onTap: () {
                    if (UserStore.isLoggedIn.value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Cart()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    }
                  },
                  child: const Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: (() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  }),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 3, 170, 8),
                    radius: 20,
                    child: UserStore
                            .isLoggedIn.value // Username first letter  . . .
                        ? const Text(
                            "V",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          )
                        : const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 2, 190, 9),
                            Color.fromARGB(255, 56, 221, 70)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topRight),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.2,
                              right: MediaQuery.of(context).size.width * 0.2),
                          child: Column(
                            children: const [
                              Text(
                                "Welcome to Orbital",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                    shadows: [
                                      Shadow(color: Colors.black, blurRadius: 3)
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: UserStore.isLoggedIn.value
                              ? const SizedBox()
                              : Container(
                                  margin: EdgeInsets.only(top: 25),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 3,
                                            color: Colors.black54)
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Text(
                                    "Create Account",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "Explore our featured food list",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                shadows: [
                                  Shadow(color: Colors.black54, blurRadius: 0.2)
                                ]),
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                            height: 250,
                            child: /* StreamBuilder<List<FoodItem>>(
                              stream: readFeaturedFood(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return const Center(
                                      child: Text("Something went wrong"));
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(child: Text("Loading"));
                                }

                                final fFood = snapshot.data!;
                                return */
                                PageView.builder(
                                    itemCount: fFood.length,
                                    itemBuilder: (context, position) {
                                      return _buildPageItem1(
                                          position, fFood[position]);
                                    })
                            //   }),
                            ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 2, 190, 9),
                            Color.fromARGB(255, 56, 221, 70)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topRight),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "Make a Custom Order",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                shadows: [
                                  Shadow(color: Colors.black54, blurRadius: 2)
                                ]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10,
                              left: MediaQuery.of(context).size.width * 0.08,
                              right: MediaQuery.of(context).size.width * 0.08),
                          child: const Text(
                            "You can make flexible orders which can include one or more items from our collection of Restaurant menus as one package in this section. For example, you can order Rice + Beans + Pork Meat + Bottle Water e.t.c.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.3),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                if (UserStore.isLoggedIn.value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CustomOrders()));
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()));
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 3, color: Colors.black54)
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Row(
                                  children: const [
                                    Text(
                                      "Custom Order",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 18,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "Popular Food Combinations",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                shadows: [
                                  Shadow(color: Colors.black54, blurRadius: 0.2)
                                ]),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                            height: 250,
                            child: /* StreamBuilder<List<FoodItem>>(
                              stream: readPopularFood(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return const Center(
                                      child: Text("Something went wrong"));
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(child: Text("Loading"));
                                }

                                final fFood = snapshot.data!;
                                return */
                                PageView.builder(
                                    itemCount: pFood.length,
                                    itemBuilder: (context, position) {
                                      return _buildPageItem1(
                                          position, pFood[position]);
                                    })
                            // }),
                            ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 2, 190, 9),
                            Color.fromARGB(255, 56, 221, 70)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topRight),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "Registered Restaurants in Makurdi",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                shadows: [
                                  Shadow(color: Colors.black54, blurRadius: 2)
                                ]),
                          ),
                        ),
                        /*  StreamBuilder<List<RestaurantModel>>(
                            stream: readRestaurants(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Center(
                                    child: Text("Something went wrong"));
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(child: Text("Loading"));
                              }

                              final rests = snapshot.data!;
                              return */
                        Container(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3, color: Colors.black54)
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: ExpansionPanelList(
                              animationDuration:
                                  const Duration(milliseconds: 500),
                              children: restaurantLocations(rests),
                              dividerColor: Colors.grey,
                              expansionCallback: (panelIndex, isExpanded) {
                                _expanded[panelIndex] = !_expanded[panelIndex];
                                setState(() {});
                              },
                            ))
                        //  }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: const [
                              Text(
                                "About Us",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    shadows: [
                                      Shadow(
                                          color: Colors.black54,
                                          blurRadius: 0.5)
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.08),
                            child: const Text(
                                "Orbital is a food ordering app created to ease the process of food purchase from Restaurants. We have a huge list of registered Restaurants in Makurdi and our delivery service is as fast as possible. You can contact us through the following channels\n\nfacebook: Obital\nemail: orbital@gmail.com\nhotlines: +23410232324343/+234812944858")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]);
      },
    ));
  }

  Widget _buildPageItem1(int index, FoodItem item) {
    Matrix4 matrix = Matrix4.identity();
    /* if (index == _currPageValue1.floor()) {
      var currScale = 1 - (_currPageValue1 - index) * (1 - _scaleFactor);
      var curTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, curTrans, 1);
    } else if (index == _currPageValue1.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue1 - index + 1) * (1 - _scaleFactor);
      var curTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (index == _currPageValue1.floor() - 1) {
      var currScale = 1 - (_currPageValue1 - index) * (1 - _scaleFactor);
      var curTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - currScale) / 2, 0);
    } */

    return Transform(
      transform: matrix,
      child: InkWell(
        onTap: () {
          if (UserStore.isLoggedIn.value) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CustomOrders()));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Login()));
          }
        },
        child: Stack(children: [
          Container(
            height: 200,
            width: 200 * 2,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 190, 190, 190).withAlpha(220),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(item.imageUrl!, fit: BoxFit.cover)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            // HomePage Food item Labels . . .
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 90,
              width: 100 * 2.5,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                ],
                color: Colors.white,
              ),
              child: AppColumn(item: item),
            ),
          ),
        ]),
      ),
    );
  }

  restaurantLocations(List<RestaurantModel> restsList) {
    List<ExpansionPanel> tempList = [];

    for (int i = 0; i < restsList.length; i++) {
      tempList.add(expansionPanelWidget(restsList[i], i));
    }
    return tempList;
  }

  expansionPanelWidget(RestaurantModel singleLocationsItem, int index) {
    return ExpansionPanel(
      headerBuilder: (context, isExpanded) {
        return ListTile(title: Text(singleLocationsItem.restaurantName!));
      },
      body: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: restaurantInfoWidgetList(singleLocationsItem.info!)),
      isExpanded: _expanded[index],
      canTapOnHeader: true,
    );
  }

  restaurantInfoWidgetList(List<String> names) {
    List<Widget> tempList = [];
    for (int i = 0; i < names.length; i++) {
      tempList.add(restaurantInfoWidget(names[i]));
    }
    return tempList;
  }

  restaurantInfoWidget(String name) {
    return Container(
      padding: const EdgeInsets.only(left: 20, bottom: 30),
      alignment: Alignment.centerLeft,
      child: Text(name),
    );
  }
}
