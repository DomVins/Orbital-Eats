/* import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Upload2 extends StatefulWidget {
  const Upload2({Key? key}) : super(key: key);

  @override
  State<Upload2> createState() => _Upload2State();
}

class _Upload2State extends State<Upload2> {
  bool uploading = false;
  File? _photo;
  String foodNameController = "";
  String foodRestaurantNameController = "";
  String priceController = "";

  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
      } else {
        if (kDebugMode) {
          print('No image selected.');
        }
      }
    });
  }

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
                        "Add Popular Food",
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
              GestureDetector(
                onTap: () => imgFromGallery(),
                child: Container(
                    width: 200,
                    height: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: _photo == null
                        ? Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Choose Image")
                              ],
                            ),
                          )
                        : Image.file(
                            _photo!,
                            fit: BoxFit.cover,
                          )),
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
                    foodRestaurantNameController = value;
                  },
                  decoration:
                      const InputDecoration.collapsed(hintText: "Restaurants"),
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
                    priceController = value;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration.collapsed(
                      hintText: "Price in Naira"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => uploadImageAndFeaturedData(),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: const Text("Upload"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  uploadImageAndFeaturedData() async {
    setState(() {
      uploading = true;
    });

    String imageDownloadUrl = await uploadFoodImage(_photo!);

    saveItemInfo(imageDownloadUrl);
  }

  saveItemInfo(String downloadUrl) {
    final itemsRef = FirebaseFirestore.instance.collection("popular");
    itemsRef.doc().set({
      "categoryName": foodNameController.trim(),
      "cost": priceController.trim(),
      "restaurants": foodRestaurantNameController.trim(),
      "imageUrl": downloadUrl,
    });

    setState(() {
      _photo = null;
      uploading = false;
      foodNameController = "";
      foodRestaurantNameController = "";
      priceController = "";
    });
  }

  Future<String> uploadFoodImage(File image) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference featured = storage.ref("popular");
    final TaskSnapshot snapshot =
        await featured.child("product_${DateTime.now()}.jpg").putFile(image);
    final downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }
}
 */