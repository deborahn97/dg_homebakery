import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  late double scrHeight, scrWidth, resWidth;
  late int gridCount;

  @override
  Widget build(BuildContext context) {
    scrHeight = MediaQuery.of(context).size.height;
    scrWidth = MediaQuery.of(context).size.width;

    if (scrWidth <= 600) {
      resWidth = scrWidth;
      gridCount = 2;
    } else {
      resWidth = scrWidth * 0.75;
      gridCount = 3;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: resWidth,
            height: scrHeight,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Latest Goods",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: resWidth * 0.07,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF4527A0),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Flexible(
                    child: GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: gridCount,
                      children: [
                        GestureDetector(
                          onTap: (() => {print("Pumpkin Cake")}),
                          child: Container(
                            padding: const EdgeInsets.all(7.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    SimpleShadow(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                            'assets/images/products/pumpkin_cake.jpg'),
                                      ),
                                      opacity: 0.6,
                                      color: Colors.black,
                                      offset: const Offset(4, 4),
                                      sigma: 2,
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 7.5,
                                      child: Container(
                                        width: resWidth / 4,
                                        color: Colors.black45,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Pumpkin Cake",
                                          style: TextStyle(
                                            fontSize: resWidth * 0.035,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() => {print("Chocolate Cupcake")}),
                          child: Container(
                            padding: const EdgeInsets.all(7.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    SimpleShadow(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                            'assets/images/products/chocolate_cupcake.jpg'),
                                      ),
                                      opacity: 0.6,
                                      color: Colors.black,
                                      offset: const Offset(4, 4),
                                      sigma: 2,
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 7.5,
                                      child: Container(
                                        width: resWidth / 4,
                                        color: Colors.black45,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Chocolate Cupcake",
                                          style: TextStyle(
                                            fontSize: resWidth * 0.035,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() => {print("Coconut Balls")}),
                          child: Container(
                            padding: const EdgeInsets.all(7.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    SimpleShadow(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                            'assets/images/products/coconut_balls.jpg'),
                                      ),
                                      opacity: 0.6,
                                      color: Colors.black,
                                      offset: const Offset(4, 4),
                                      sigma: 2,
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 7.5,
                                      child: Container(
                                        width: resWidth / 4,
                                        color: Colors.black45,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Coconut Balls",
                                          style: TextStyle(
                                            fontSize: resWidth * 0.035,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() => {print("Choco Pandan Rolls")}),
                          child: Container(
                            padding: const EdgeInsets.all(7.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    SimpleShadow(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                            'assets/images/products/choco_pandan_rolls.jpg'),
                                      ),
                                      opacity: 0.6,
                                      color: Colors.black,
                                      offset: const Offset(4, 4),
                                      sigma: 2,
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 7.5,
                                      child: Container(
                                        width: resWidth / 4,
                                        color: Colors.black45,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Choco Pandan Rolls",
                                          style: TextStyle(
                                            fontSize: resWidth * 0.035,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Popular Choices",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: resWidth * 0.07,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF4527A0),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Flexible(
                    child: GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: gridCount,
                      children: [
                        GestureDetector(
                          onTap: (() => {print("Mini Cheesecake")}),
                          child: Container(
                            padding: const EdgeInsets.all(7.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    SimpleShadow(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                            'assets/images/products/mini_cheesecake.jpg'),
                                      ),
                                      opacity: 0.6,
                                      color: Colors.black,
                                      offset: const Offset(4, 4),
                                      sigma: 2,
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 7.5,
                                      child: Container(
                                        width: resWidth / 4,
                                        color: Colors.black45,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Mini Cheesecake",
                                          style: TextStyle(
                                            fontSize: resWidth * 0.035,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() => {print("Macarons")}),
                          child: Container(
                            padding: const EdgeInsets.all(7.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    SimpleShadow(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                            'assets/images/products/macarons.jpg'),
                                      ),
                                      opacity: 0.6,
                                      color: Colors.black,
                                      offset: const Offset(4, 4),
                                      sigma: 2,
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 7.5,
                                      child: Container(
                                        width: resWidth / 4,
                                        color: Colors.black45,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Macarons",
                                          style: TextStyle(
                                            fontSize: resWidth * 0.035,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() => {print("Apple Pie")}),
                          child: Container(
                            padding: const EdgeInsets.all(7.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    SimpleShadow(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                            'assets/images/products/apple_pie.jpg'),
                                      ),
                                      opacity: 0.6,
                                      color: Colors.black,
                                      offset: const Offset(4, 4),
                                      sigma: 2,
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 7.5,
                                      child: Container(
                                        width: resWidth / 4,
                                        color: Colors.black45,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Apple Pie",
                                          style: TextStyle(
                                            fontSize: resWidth * 0.035,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() => {print("Fruit Tart")}),
                          child: Container(
                            padding: const EdgeInsets.all(7.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    SimpleShadow(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                            'assets/images/products/fruit_tart.jpg'),
                                      ),
                                      opacity: 0.6,
                                      color: Colors.black,
                                      offset: const Offset(4, 4),
                                      sigma: 2,
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 7.5,
                                      child: Container(
                                        width: resWidth / 4,
                                        color: Colors.black45,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Fruit Tart",
                                          style: TextStyle(
                                            fontSize: resWidth * 0.035,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
    );
  }
}
