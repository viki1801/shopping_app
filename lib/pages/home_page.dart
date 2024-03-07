import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_app/pages/cart_page.dart';
import 'package:shopping_app/widgets/product_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage =0;

  List<Widget> pages = const [ProductList(),CartPage()];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
            onTap: (value){
              setState(() {
                currentPage = value;
              });
            },
          currentIndex: currentPage,
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
          items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
      ],
    ),
    );
  }
}
