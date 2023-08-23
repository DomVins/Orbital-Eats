import 'package:flutter/material.dart';
import 'package:orbital/pages/user_pages/home.dart';
import 'package:orbital/store/store.dart';

import 'signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 190, 9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 2, 190, 9),
                  Color.fromARGB(255, 56, 221, 70)
                ], begin: Alignment.bottomCenter, end: Alignment.topRight),
              ),
              padding: EdgeInsets.only(
                  right: 20,
                  top: MediaQuery.of(context).size.height * 0.02,
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
                ],
              ),
            ),
            const Text(
              "Login To Orbital",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                  shadows: [Shadow(color: Colors.black, blurRadius: 3)]),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey)),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
              child: TextFormField(
                decoration:
                    const InputDecoration.collapsed(hintText: "Email adress"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey)),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
              child: TextFormField(
                decoration:
                    const InputDecoration.collapsed(hintText: "Password"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                UserStore.isLoggedIn.value = true;
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(blurRadius: 3, color: Colors.black54)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: const Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("New to Orbital ?",
                style: TextStyle(
                  color: Colors.white,
                )),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Text("SIGNUP",
                    style:
                        TextStyle(color: Color.fromARGB(255, 253, 253, 253))))
          ]),
        ),
      ),
    );
  }
}
