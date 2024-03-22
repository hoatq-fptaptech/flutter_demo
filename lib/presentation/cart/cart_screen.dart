import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/model/entity/cart_item.dart';
import 'package:flutter_demo/presentation/cart/cart_item_box.dart';
import 'package:provider/provider.dart';

import '../../bloc/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping Cart')),
      body: StreamBuilder<List<CartItem>>(
        stream: Provider.of<CartBloc>(context,listen: false).cartItemsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData ) {
            final cartItems = snapshot.data!;
            return ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Column(
                  children: [
                    Dismissible(
                        key: Key(item.id.toString()),
                        onDismissed: (direction) {
                          Provider.of<CartBloc>(context, listen: false).removeFromCart(item.id);
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.delete_outlined, color: Colors.white),
                        ),
                        child: CartItemBox(item: item)
                    ),
                    const Divider(
                      color: Colors.black12, // Màu sắc của đường kẻ
                      height: 1, // Chiều cao của đường kẻ
                      thickness: 1, // Độ dày của đường kẻ
                      indent: 16, // Khoảng cách từ lề trái
                      endIndent: 16, // Khoảng cách từ lề phải
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(
              child: Text('Your cart is empty'),
            );
          }
        },
      ),
    );
  }
}

