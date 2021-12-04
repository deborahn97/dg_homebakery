import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class SellerContact extends StatefulWidget {
  const SellerContact({Key? key}) : super(key: key);

  @override
  State<SellerContact> createState() => _SellerContactState();
}

class _SellerContactState extends State<SellerContact> {
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
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Seller Contact",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: resWidth * 0.07,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF4527A0),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SimpleShadow(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset('assets/images/seller.jpg', scale: resWidth * 0.0025)),
                      opacity: 0.6,
                      color: Colors.black,
                      offset: const Offset(5, 5),
                      sigma: 2,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.account_box_rounded, color: Color(0xFF6A1B9A)),
                              SizedBox(width: resWidth / 20),
                              Flexible(
                                child: Text(
                                  "Janira Jani",
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
                              const Icon(Icons.phone_rounded, color: Color(0xFF6A1B9A)),
                              SizedBox(width: resWidth / 20),
                              Flexible(
                                child: Text(
                                  "011-17461288",
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
                              const Icon(Icons.email_rounded, color: Color(0xFF6A1B9A)),
                              SizedBox(width: resWidth / 20),
                              Flexible(
                                child: Text(
                                  "jani@gmail.com",
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
                              const Icon(Icons.house_rounded, color: Color(0xFF6A1B9A)),
                              SizedBox(width: resWidth / 20),
                              Flexible(
                                child: Text(
                                  "Lot 39, Laluan 3 Simpang 9, Ampang, 40300 Shah Alam, Selangor.",
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
