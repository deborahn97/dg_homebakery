import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Customize extends StatefulWidget {
  const Customize({Key? key}) : super(key: key);

  @override
  State<Customize> createState() => _CustomizeState();
}

class _CustomizeState extends State<Customize> {
  late double scrHeight, scrWidth, resWidth;
  String bakedGoods = "Cakes";
  TextEditingController flavorEC = TextEditingController();
  TextEditingController remarksEC = TextEditingController();
  TextEditingController quantityEC = TextEditingController();
  List<String> bakedGoodsList = [
    "Cakes",
    "Breads",
    "Cupcakes",
    "Cookies",
    "Tarts",
    "Others (please specify in Remarks)"
  ];

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
            height: scrHeight / 1.25,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Customize Your Order",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: resWidth * 0.07,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF4527A0),
                    ),
                  ),
                  SizedBox(
                    height: scrHeight / 20,
                  ),
                  Flexible(
                    child: GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: resWidth / (scrHeight / 3),
                      children: [
                        Text(
                          "Select type: ",
                          style: TextStyle(
                            fontSize: resWidth * 0.05,
                          ),
                        ),
                        InputDecorator(
                          decoration: const InputDecoration(border: OutlineInputBorder()),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              style: GoogleFonts.acme(
                                textStyle: TextStyle(
                                  fontSize: resWidth * 0.035,
                                  color: Colors.black,
                                ),
                              ),
                              isExpanded: true,
                              itemHeight: 50,
                              value: bakedGoods,
                              onChanged: (newValue) {
                                setState(() {
                                  bakedGoods = newValue.toString();
                                });
                              },
                              items: bakedGoodsList.map(
                                (bakedGoods) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      bakedGoods,
                                    ),
                                    value: bakedGoods,
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                        Text(
                          "Flavor: ",
                          style: TextStyle(
                            fontSize: resWidth * 0.05,
                          ),
                        ),
                        TextField(
                          controller: flavorEC,
                          decoration: InputDecoration(
                            hintText: "Flavor",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Text(
                          "Remarks: ",
                          style: TextStyle(
                            fontSize: resWidth * 0.05,
                          ),
                        ),
                        TextField(
                          controller: remarksEC,
                          decoration: InputDecoration(
                            hintText: "Remarks",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Text(
                          "Quantity: ",
                          style: TextStyle(
                            fontSize: resWidth * 0.05,
                          ),
                        ),
                        TextField(
                          controller: quantityEC,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Quantity",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: scrHeight / 20,
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.shopping_cart_rounded,
                    ),
                    onPressed: (() => setState(() {
                          print("Place Order");
                        })),
                    label: Text(
                      "Place Order",
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
