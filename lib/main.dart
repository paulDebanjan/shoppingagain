import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingagain/modes/shop.dart';
import 'package:shoppingagain/pages/cart_page.dart';
import 'package:shoppingagain/pages/intro_page.dart';
import 'package:shoppingagain/pages/shop_page.dart';
import 'package:shoppingagain/themes/light_mode.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Shop(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => IntroPage(),
        '/shop_page': (context) => ShopPage(),
        '/cart_page': (context) => CartPage(),
      },
    );
  }
}
