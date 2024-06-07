import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('images/logi.jpg'), fit: BoxFit.cover)),
        child: Center(
          child: Container(
            width: 500,
            height: 500,
            decoration: const BoxDecoration(
                color: Colors.white,
                image: const DecorationImage(
                    image: AssetImage('images/loginbox.jpg'),
                    fit: BoxFit.cover)),
            child: const Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
