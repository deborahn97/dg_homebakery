import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'main_page.dart';
import 'sub/config.dart';
import 'sub/user.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  late double scrHeight, scrWidth, resWidth;
  
  @override
  void initState() {
    super.initState();
    _checkAndLogin();
  }

  @override
  Widget build(BuildContext context) {
    scrHeight = MediaQuery.of(context).size.height;
    scrWidth = MediaQuery.of(context).size.width;

    if (scrWidth <= 600) {
      resWidth = scrWidth;
    } else {
      resWidth = scrWidth * 0.75;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/splash.png', scale: 2),
              Text(
                "DoughyGoodness Home Bakery",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: resWidth * 0.1,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF4A148C),
                ),
              ),
              const CircularProgressIndicator(),
              Text(
                "Version 0.1",
                style: TextStyle(
                  fontSize: resWidth * 0.05,
                  color: const Color(0xFF6A1B9A),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _checkAndLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String _email = (pref.getString('email')) ?? '';
    String _pass = (pref.getString('pass')) ?? '';
    late User user;

    if(_email.isNotEmpty && _pass.isNotEmpty) {
      http.post(
        Uri.parse(Config.server + "/homebakery/php/login.php"),
        body: {
          "email": _email,
          "pass": _pass,
        }).then((response) {
          if(response.statusCode == 200 && response.body != "failed") {
            final jsonResponse = json.decode(response.body);
            user = User.fromJson(jsonResponse);
            Timer(
              const Duration(seconds: 3),
              () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (content) => MainPage(user: user))));
          } else {
            user = User(
              id: "NA",
              name: "NA",
              email: "NA",
              phone: "NA",
              address: "NA",
            );
            Timer(
              const Duration(seconds: 3),
              () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (content) => MainPage(user: user))));
          }
        }).timeout(const Duration(seconds: 5));
    } else {
      user = User(
        id: "NA",
        name: "NA",
        email: "NA",
        phone: "NA",
        address: "NA",
      );
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (content) => MainPage(user: user))));
    }
  }
}
