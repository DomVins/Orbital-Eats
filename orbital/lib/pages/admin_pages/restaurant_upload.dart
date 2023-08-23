/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Upload3 extends StatefulWidget {
  const Upload3({Key? key}) : super(key: key);

  @override
  State<Upload3> createState() => _Upload3State();
}

class _Upload3State extends State<Upload3> {
  bool uploading = false;
  String foodNameController = "";
  String adressController = "";
  String workController = "";
  List<String> restInfo = ["", ""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 33, 243),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SafeArea(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Add Registered Restaurant",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                child: TextFormField(
                  onChanged: ((value) {
                    foodNameController = value;
                  }),
                  decoration: const InputDecoration.collapsed(hintText: "Name"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                child: TextFormField(
                  onChanged: (value) {
                    adressController = value;
                  },
                  decoration:
                      const InputDecoration.collapsed(hintText: "Address"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                child: TextFormField(
                  onChanged: (value) {
                    workController = value;
                  },
                  decoration: const InputDecoration.collapsed(
                      hintText: "Working Hours"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => uploadRegisteredRestaurantInfo(),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: const Text(
                    "Upload",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 1.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  uploadRegisteredRestaurantInfo() async {
    restInfo[0] = adressController;
    restInfo[1] = workController;

    setState(() {
      uploading = true;
    });
    final itemsRef = FirebaseFirestore.instance.collection("restaurants");
    itemsRef.doc().set({
      "restaurantName": foodNameController.trim(),
      "info": restInfo,
    });

    setState(() {
      uploading = false;
      foodNameController = "";
      adressController = "";
      workController = "";
    });
  }
}
 */