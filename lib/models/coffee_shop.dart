import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';


class CoffeeShop extends ChangeNotifier{
  final List<Coffee> _shop = [
    Coffee(name: "Long Black",imagePath: "img/black-tea.png",price: "4.10"),
    Coffee(name: "Esprsso",imagePath: "img/espresso.png",price: "5.00"),
    Coffee(name: "Ice Coffee",imagePath: "img/ice-coffee.png",price: "3.50"),
    Coffee(name: "Latte",imagePath: "img/latte.png",price: "6.48"),
  ];

  List<Coffee> _userCart =[];
  List<Coffee> get coffeeShop => _shop;
  List<Coffee> get userCart => _userCart;
  void addItemToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemFormCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }


}