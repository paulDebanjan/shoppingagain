import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingagain/components/my_button.dart';
import 'package:shoppingagain/components/my_drawer.dart';
import 'package:shoppingagain/modes/product.dart';
import 'package:shoppingagain/modes/shop.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: Text('Add this item to your cart?'),
            actions: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context); 
                  context.read<Shop>().removeItemFromCart(product);
                },
                child: Text('Yes'),
              ),
            ],
          ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: Text(
              'User want to pay! connect this app to your payment backend.',
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart Page'),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty? Center(child: Text('Cart is empty..')): ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    onPressed: () {
                      removeItemFromCart(context, item);
                    },
                    icon: Icon(Icons.remove),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Text('PAY NOW'),
            ),
          ),
        ],
      ),
    );
  }
}
