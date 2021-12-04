import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:ndialog/ndialog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import 'config.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late double scrHeight, scrWidth, resWidth;
  final focus = FocusNode();
  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  final focus4 = FocusNode();
  final focus5 = FocusNode();

  final TextEditingController _nameEC = TextEditingController();
  final TextEditingController _emailEC = TextEditingController();
  final TextEditingController _phoneEC = TextEditingController();
  final TextEditingController _passEC = TextEditingController();
  final TextEditingController _confirmPassEC = TextEditingController();

  String eula = "";
  bool pwVal = false;
  bool _passVisible = true;
  bool _checked = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    scrHeight = MediaQuery.of(context).size.height;
    scrWidth = MediaQuery.of(context).size.width;

    if (scrWidth <= 600) {
      resWidth = scrWidth;
    } else {
      resWidth = scrWidth * 0.75;
    }

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.acmeTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: const Color(0xFFE1BEE7),
      ),
      title: 'DoughyGoodness Home Bakery',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Register'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: resWidth,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 10),
                    Image.asset('assets/images/register.png', scale: 7),
                    const SizedBox(height: 20),
                    Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                validator: (val) => val!.isEmpty ||
                                        (val.length < 5)
                                    ? "Name must be longer than 5 characters"
                                    : null,
                                focusNode: focus,
                                onFieldSubmitted: (v) {
                                  FocusScope.of(context).requestFocus(focus1);
                                },
                                controller: _nameEC,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                  labelStyle: TextStyle(),
                                  icon: Icon(
                                      Icons.supervised_user_circle_rounded),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                validator: (val) => val!.isEmpty ||
                                        !val.contains("@") ||
                                        !val.contains(".com")
                                    ? "Please enter a valid email"
                                    : null,
                                focusNode: focus1,
                                onFieldSubmitted: (v) {
                                  FocusScope.of(context).requestFocus(focus2);
                                },
                                controller: _emailEC,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'E-mail',
                                  labelStyle: TextStyle(),
                                  icon: Icon(Icons.email_rounded),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                validator: (val) =>
                                    (val!.isEmpty) || (val.length < 10)
                                        ? "Please enter a valid phone number"
                                        : null,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                focusNode: focus2,
                                onFieldSubmitted: (v) {
                                  FocusScope.of(context).requestFocus(focus3);
                                },
                                controller: _phoneEC,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Phone No.',
                                  labelStyle: TextStyle(),
                                  icon: Icon(Icons.phone_rounded),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                validator: (val) => val!.isEmpty
                                    ? "Please enter a password"
                                    : null,
                                focusNode: focus3,
                                onFieldSubmitted: (v) {
                                  FocusScope.of(context).requestFocus(focus4);
                                },
                                controller: _passEC,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(),
                                  icon: const Icon(Icons.lock_rounded),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passVisible
                                          ? Icons.visibility_rounded
                                          : Icons.visibility_off_rounded,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passVisible = !_passVisible;
                                      });
                                    },
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                obscureText: _passVisible,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: FlutterPwValidator(
                                  controller: _passEC,
                                  minLength: 8,
                                  uppercaseCharCount: 1,
                                  numericCharCount: 2,
                                  specialCharCount: 1,
                                  width: resWidth / 1.5,
                                  height: scrHeight / 6,
                                  successColor: Colors.deepPurpleAccent,
                                  onSuccess: () => {
                                    setState(() {
                                      pwVal == true;
                                    })
                                  },
                                ),
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                validator: (val) {
                                  if (val != _passEC.text) {
                                    return "Please make sure passwords match";
                                  } else if (val!.isEmpty) {
                                    return "Please enter a password";
                                  } else {
                                    return null;
                                  }
                                },
                                focusNode: focus4,
                                onFieldSubmitted: (v) {
                                  FocusScope.of(context).requestFocus(focus5);
                                },
                                controller: _confirmPassEC,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  labelStyle: const TextStyle(),
                                  icon: const Icon(Icons.lock_rounded),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passVisible
                                          ? Icons.visibility_rounded
                                          : Icons.visibility_off_rounded,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passVisible = !_passVisible;
                                      });
                                    },
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                obscureText: _passVisible,
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: _checked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _checked = value!;
                                          });
                                        },
                                      ),
                                      GestureDetector(
                                        onTap: _showEULA,
                                        child: const Text(
                                          "Accept Terms",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(scrWidth / 3, 50)),
                                child: const Text("Register"),
                                onPressed: _regAcc,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    GestureDetector(
                      onTap: _loginPage,
                      child: const Text(
                        "Tap here to Login",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A148C),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(true),
                      child: const Text(
                        "Back",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A148C),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showEULA() async {
    eula = await rootBundle.loadString('assets/eula.txt');
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("EULA"),
            content: SizedBox(
              height: scrHeight / 1.5,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: RichText(
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          text: eula,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _regAcc() {
    if (!_formKey.currentState!.validate()) {
      Fluttertoast.showToast(
        msg: "Please fill in the correct details",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 14,
      );
      return;
    } else if (pwVal != false) {
      Fluttertoast.showToast(
        msg: "Please make sure the password is correct",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 14,
      );
      return;
    } else if (!_checked) {
      Fluttertoast.showToast(
        msg: "Please accept the terms and conditions",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 14,
      );
      return;
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
      String _name = _nameEC.text;
      String _email = _emailEC.text;
      String _phone = _phoneEC.text;
      String _pass = _passEC.text;
      FocusScope.of(context).unfocus();

      ProgressDialog progress = ProgressDialog(
        context,
        title: const Text("Registration"),
        message: const Text("Registering your account..."),
      );

      progress.show();

      http.post(Uri.parse(Config.server + "/homebakery/php/register.php"),
          body: {
            "name": _name,
            "email": _email,
            "phone": _phone,
            "pass": _pass,
          }).then((response) {
        var data = jsonDecode(response.body);
        if (response.statusCode == 200 && data['status'] == 'success') {
          Fluttertoast.showToast(
            msg: "Your account has been successfully registered",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 14,
          );

          progress.dismiss();
          return;
        } else {
          Fluttertoast.showToast(
            msg: "Failed to register. Please try again",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 14,
          );

          progress.dismiss();
          return;
        }
      });
    }
  }

  void _loginPage() {
    setState(() {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => const Login()));
    });
  }
}
