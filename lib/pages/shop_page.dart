import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingagain/components/my_drawer.dart';
import 'package:shoppingagain/components/my_product_tile.dart';
import 'package:shoppingagain/modes/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  // access product in shop

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: Center(child: Text('Shop Page')),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          // shop subtitle
          Center(
            child: Text(
              'Pick from a selected list of premium products.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          // product list
          SizedBox(
            height: 550,
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                // get each individual product from shop
                final product = products[index];
                // return as a product tile UI
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
