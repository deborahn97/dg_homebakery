import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Categories",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: resWidth * 0.07,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF4527A0),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Flexible(
                    child: GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: gridCount,
                      children: [
                        GestureDetector(
                          onTap: (() => {print("Cakes")}),
                          child: Container(
                            padding: const EdgeInsets.all(7.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    SimpleShadow(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                            'assets/images/products/cakes.jpg'),
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
                                        color: Colors.black45,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Cakes",
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
                          onTap: (() => {print("Breads")}),
                          child: Container(
                            padding: const EdgeInsets.all(7.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    SimpleShadow(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                            'assets/images/products/breads.jpg'),
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
                                        color: Colors.black45,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Breads",
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
                          onTap: (() => {print("Cupcakes")}),
                          child: Container(
                            padding: const EdgeInsets.all(7.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    SimpleShadow(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                            'assets/images/products/cupcakes.jpg'),
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
                                        color: Colors.black45,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Cupcakes",
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
                          onTap: (() => {print("Cookies")}),
                          child: Container(
                            padding: const EdgeInsets.all(7.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    SimpleShadow(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                            'assets/images/products/cookies.jpg'),
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
                                        color: Colors.black45,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Cookies",
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
                          onTap: (() => {print("Tarts")}),
                          child: Container(
                            padding: const EdgeInsets.all(7.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    SimpleShadow(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                            'assets/images/products/tarts.jpg'),
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
                                        color: Colors.black45,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Tarts",
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
                          onTap: (() => {print("Others")}),
                          child: Container(
                            padding: const EdgeInsets.all(7.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    SimpleShadow(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                            'assets/images/products/others.jpg'),
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
                                        color: Colors.black45,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Others",
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
