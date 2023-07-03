import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeformcart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFormCart(coffee);
  }

  void payNow(){

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
                child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Text(
                    "Your Cart",
                    style: TextStyle(fontSize: 20),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: value.coffeeShop.length,
                          itemBuilder: (context, index) {
                            Coffee eachCoffee = value.coffeeShop[index];
                            return CoffeeTile(
                                coffee: eachCoffee,
                                onPressed: () => removeformcart(eachCoffee),
                                icon: Icon(Icons.delete));
                          })),
                  GestureDetector(
                    onTap: payNow,
                    child: Container(
                      padding: EdgeInsets.all(25),
                      width: double.infinity,
                      child: Center(
                        child: Text("Pay Now",style: TextStyle(color: Colors.white),),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  )

                ],
              ),
            )));
  }
}
