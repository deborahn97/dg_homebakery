import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
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
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "My Orders",
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
                  Row(
                    children: [
                      SimpleShadow(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                              'assets/images/products/mini_cheesecake_2.jpg',
                              scale: resWidth * 0.025),
                        ),
                        opacity: 0.6,
                        color: Colors.black,
                        offset: const Offset(4, 4),
                        sigma: 2,
                      ),
                      SizedBox(width: resWidth / 20),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mini Cheesecake",
                              style: TextStyle(
                                fontSize: resWidth * 0.05,
                                color: const Color(0xFF6A1B9A),
                              ),
                            ),
                            Text(
                              "Quantity: 2",
                              style: TextStyle(
                                fontSize: resWidth * 0.0425,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      SimpleShadow(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                              'assets/images/products/purple_macarons.jpg',
                              scale: resWidth * 0.025),
                        ),
                        opacity: 0.6,
                        color: Colors.black,
                        offset: const Offset(4, 4),
                        sigma: 2,
                      ),
                      SizedBox(width: resWidth / 20),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Purple Macarons",
                              style: TextStyle(
                                fontSize: resWidth * 0.05,
                                color: const Color(0xFF6A1B9A),
                              ),
                            ),
                            Text(
                              "Quantity: 10",
                              style: TextStyle(
                                fontSize: resWidth * 0.0425,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: scrHeight / 7,
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.shopping_cart_rounded,
                    ),
                    onPressed: (() => setState(() {
                      print("Checkout");
                    })),
                    label: Text(
                      "Checkout",
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
}
