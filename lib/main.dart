import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/splash.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.acmeTextTheme(Theme.of(context).textTheme,),
        scaffoldBackgroundColor: const Color(0xFFE1BEE7),
      ),
      darkTheme: ThemeData.dark(),
      title: 'DoughyGoodness Home Bakery',
      home: const Scaffold(
        body: SplashPage(),
      ),
    );
  }
}