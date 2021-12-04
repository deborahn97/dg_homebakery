import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'user.dart';

class ViewProfile extends StatefulWidget {
  final User user;
  const ViewProfile({Key? key, required this.user}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
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

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.acmeTextTheme(
          Theme.of(context).textTheme,
        ),
        //scaffoldBackgroundColor: const Color(0xFFE1BEE7),
      ),
      title: 'DoughyGoodness Home Bakery',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('View Profile'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: resWidth,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "My Profile",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: resWidth * 0.07,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF4527A0),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          if(widget.user.name.toString() != "NA")
                            Row(
                              children: [
                                const Icon(Icons.account_box_rounded,
                                    color: Color(0xFF6A1B9A)),
                                SizedBox(width: resWidth / 20),
                                Flexible(
                                  child: Text(
                                    widget.user.name.toString(),
                                    style: TextStyle(
                                      fontSize: resWidth * 0.05,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                const Icon(Icons.phone_rounded,
                                    color: Color(0xFF6A1B9A)),
                                SizedBox(width: resWidth / 20),
                                Flexible(
                                  child: Text(
                                    widget.user.phone.toString(),
                                    style: TextStyle(
                                      fontSize: resWidth * 0.05,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                const Icon(Icons.email_rounded,
                                    color: Color(0xFF6A1B9A)),
                                SizedBox(width: resWidth / 20),
                                Flexible(
                                  child: Text(
                                    widget.user.email.toString(),
                                    style: TextStyle(
                                      fontSize: resWidth * 0.05,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                const Icon(Icons.house_rounded,
                                    color: Color(0xFF6A1B9A)),
                                SizedBox(width: resWidth / 20),
                                Flexible(
                                  child: Text(
                                    widget.user.address.toString(),
                                    style: TextStyle(
                                      fontSize: resWidth * 0.05,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: scrHeight / 7,
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.keyboard_backspace_rounded,
                      ),
                      onPressed: (() => Navigator.of(context).pop(true)),
                      label: Text(
                        "Back to Profile",
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
      ),
    );
  }
}
