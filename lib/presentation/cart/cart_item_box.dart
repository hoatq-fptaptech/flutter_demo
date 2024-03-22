import 'package:flutter/material.dart';
import 'package:flutter_demo/bloc/cart_bloc.dart';
import 'package:flutter_demo/model/entity/cart_item.dart';
import 'package:provider/provider.dart';

class CartItemBox extends StatelessWidget{
  final CartItem item;
  const CartItemBox({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0.0),
      padding: const EdgeInsets.all(12),
      child: Container(
        child: Row(
          children: [
            Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(item.thumbnail??""),
                    ))),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title??"",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text('\$${item.price}',
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                      ),),

                  ],
                )
            ),
            Container(
              padding: EdgeInsets.all(5),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black38,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(item.quantity.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}