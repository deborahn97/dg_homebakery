import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndialog/ndialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../main_page.dart';
import 'config.dart';
import 'register.dart';
import 'user.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late double scrHeight, scrWidth, resWidth;
  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  
  final TextEditingController emailEC = TextEditingController();
  final TextEditingController passEC = TextEditingController();

  bool passVisible = true;
  bool _saveCred = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadCred();
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

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.acmeTextTheme(Theme.of(context).textTheme,),
        scaffoldBackgroundColor: const Color(0xFFE1BEE7),
      ),
      title: 'DoughyGoodness Home Bakery',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Login'),
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
                    Image.asset('assets/images/login.png', scale: 4),
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
                                validator: 
                                  (val) => val!.isEmpty || !val.contains("@") || !val.contains(".com")
                                  ? "Please enter a valid email" : null,
                                focusNode: focus1,
                                onFieldSubmitted: (v) {
                                  FocusScope.of(context).requestFocus(focus2);
                                },
                                controller: emailEC,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'E-mail',
                                  labelStyle: TextStyle(),
                                  icon: Icon(Icons.email_rounded),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2.0,),),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                validator: 
                                  (val) => val!.isEmpty
                                  ? "Please enter a password" : null,
                                focusNode: focus2,
                                onFieldSubmitted: (v) {
                                  FocusScope.of(context).requestFocus(focus3);
                                },
                                controller: passEC,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(),
                                  icon: const Icon(Icons.lock_rounded),
                                  suffixIcon: IconButton(
                                  icon: Icon(
                                    passVisible 
                                    ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                                  ),
                                  onPressed: 
                                    () {
                                      setState(() {
                                        passVisible = !passVisible;
                                      });
                                    },
                                  ),
                                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(width: 2.0,),),
                                ),
                                obscureText: passVisible,
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: _saveCred,
                                    onChanged: 
                                      (bool? value) { 
                                        _storeCred(value!); 
                                      },
                                  ),
                                  const Text(
                                    "Remember Me",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(scrWidth / 3, 50)
                                ),
                                child: const Text("Login"),
                                onPressed: _login,
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: _registerPage,
                      child: 
                        const Text(
                          "Tap here to Register",
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
                      child: 
                        const Text(
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

  void _login() {
    FocusScope.of(context).requestFocus(FocusNode());
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      Fluttertoast.showToast(
          msg: "Please fill in the login credentials",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 14.0);
      _saveCred = false;
      return;
    }

    ProgressDialog progress = 
        ProgressDialog(
          context,
          title: const Text("Login"),
          message: const Text("Logging in to your account..."),
        );
    
    progress.show();

    String email = emailEC.text;
    String pass = passEC.text;

    http.post(
      Uri.parse(Config.server + "/homebakery/php/login.php"),
      body: {
        "email": email,
        "pass": pass,
      }).then((response) {
        if(response.statusCode == 200 && response.body != "failed") {
          final jsonResponse = json.decode(response.body);
          User user = User.fromJson(jsonResponse);
          Fluttertoast.showToast(
            msg: "Login successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 14.0);

            progress.dismiss();
            Navigator.push(
              context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                  MainPage(user: user)));
        } else {
          Fluttertoast.showToast(
            msg: "Login failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 14.0);
        }
        progress.dismiss();
      }
    );
  }

  void _storeCred(bool value) 
  => setState(() {
      _saveCred = value;
      if(_saveCred) {
        _rememberMe(true);
      } else {
        _rememberMe(false);
      }
  });

  void _rememberMe(bool value) async {
    if (!_formKey.currentState!.validate()) {
      Fluttertoast.showToast(
        msg: "Please fill in your login credentials",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 14.0);
      _saveCred = false;
      return;
    }

    FocusScope.of(context).requestFocus(FocusNode());
    FocusScope.of(context).unfocus();
      
    String email = emailEC.text;
    String pass = passEC.text;
        
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(value) { // save credentials
      await pref.setString('email', email);
      await pref.setString('pass', pass);
    } else { // remove credentials
      await pref.setString('email', '');
      await pref.setString('pass', '');
      setState(() {
        emailEC.text = '';
        passEC.text = '';
        _saveCred = false;
      });
    }
  }

  Future<void> _loadCred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String email = (pref.getString('email')) ?? '';
    String pass = (pref.getString('pass')) ?? '';
    
    if(email.isNotEmpty && pass.isNotEmpty) { // if(email.length > 1 && pass.length > 1) {
      setState(() {
        emailEC.text = email;
        passEC.text = pass;
        _saveCred = true;
      });
    }
  }

  void _registerPage() {
    setState(() {
      Navigator.push(
        context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
            const Register()));
    });
  }
}