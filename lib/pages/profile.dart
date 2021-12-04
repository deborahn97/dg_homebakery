import 'package:doughygoodness_home_bakery/pages/sub/user.dart';
import 'package:flutter/material.dart';
import '../pages/sub/login.dart';
import '../pages/sub/register.dart';
import 'sub/view_profile.dart';

class Profile extends StatefulWidget {
  final User user;
  const Profile({Key? key, required this.user}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late double scrHeight, scrWidth, resWidth;

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
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: resWidth,
              height: scrHeight / 1.5,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Profile",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: resWidth * 0.07,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF4527A0),
                        ),
                      ),

                      ElevatedButton.icon(
                        icon: const Icon(
                        Icons.supervisor_account_rounded,
                        ),
                        onPressed: _viewProfile,
                        label: Text(
                          "View Profile",
                          style: TextStyle(fontSize: resWidth * 0.035),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(scrWidth / 2, scrHeight / 15),
                        ),
                      ),

                      ElevatedButton.icon(
                        icon: const Icon(
                        Icons.login_rounded,
                        ),
                        onPressed: _login,
                        label: Text(
                          "Login",
                          style: TextStyle(fontSize: resWidth * 0.035),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(scrWidth / 2, scrHeight / 15),
                        ),
                      ),

                      ElevatedButton.icon(
                        icon: const Icon(
                        Icons.border_color_rounded,
                        ),
                        onPressed: _register,
                        label: Text(
                          "Register",
                          style: TextStyle(fontSize: resWidth * 0.035),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(scrWidth / 2, scrHeight / 15),
                        ),
                      ),
                    ],
                  ),
              ),
            ),
          ),
        ),
    );
  }

  void _viewProfile() {
    if(widget.user.email.toString() != "NA") {
      setState(() {
        Navigator.push(
          context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
              ViewProfile(user: widget.user)));
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20,),
              ),
            ),
            title: const Text(
              "Please Login First",
              style: TextStyle(),
              ),
              content: const Text(
                "Sorry, you need to login to view this page.",
                style: TextStyle(),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    "OK",
                    style: TextStyle(),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }
                ),
              ],
          );
        },
      );
    }
  }

  void _login() {
    setState(() {
      Navigator.push(
        context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
            const Login()));
    });
  }

  void _register() {
    setState(() {
      Navigator.push(
        context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
            const Register()));
    });
  }
}