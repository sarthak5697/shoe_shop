import 'package:flutter/material.dart';
import 'package:flutter_shop/views/shared/app_style.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("This is the CartPage",style: appstyle(40,Colors.black,FontWeight.bold),),
      ),
    );
  }
}