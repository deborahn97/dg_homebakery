import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/pages/categories.dart';
import '/pages/customize.dart';
import '/pages/order_list.dart';
import '/pages/products.dart';
import '/pages/profile.dart';
import '/pages/seller_contact.dart';
import 'sub/user.dart';

class MainPage extends StatefulWidget {
  final User user;
  const MainPage({Key? key, required this.user}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late double scrHeight, scrWidth, resWidth;
  late List<Widget> exp;
  late int _selectedIndex;

  @override
  initState() {
    super.initState();
    _selectedIndex = 0;
    exp = [
      const Products(),
      const Categories(),
      const Customize(),
      const OrderList(),
      Profile(user: widget.user),
      const SellerContact(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    scrHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.acmeTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: 'DoughyGoodness Home Bakery',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('DoughyGoodness Home Bakery'),
        ),
        body: Row(
          children: <Widget>[
            SingleChildScrollView(
              child: IntrinsicHeight(
                child: NavigationRail(
                  groupAlignment: 0.0, // set vertical alignment of NavigationRail, between -1.0 and 1.0
                  labelType: NavigationRailLabelType.all,
                  selectedIndex: _selectedIndex,
                  destinations: _destination(),
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Center(
                child: exp[_selectedIndex],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<NavigationRailDestination> _destination() {
    return [
      const NavigationRailDestination(
        icon: Icon(Icons.cake_rounded),
        label: Text('Products'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.category_rounded),
        label: Text('Categories'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.note_alt_rounded),
        label: Text('Customize'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.shopping_bag_rounded),
        label: Text('Order List'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.people_alt_rounded),
        label: Text('Profile'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.contacts_rounded),
        label: Text('Seller Contact'),
      ),
    ];
  }
}
