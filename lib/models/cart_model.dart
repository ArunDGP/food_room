import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {

  final List _foods = [
    ['Briyani', '150', 'lib/pics/briyani.jpeg'],
    ['Burger', '40', 'lib/pics/burger.jpeg'],
    ['Fried Rice', '80', 'lib/pics/fried_rice.jpeg'],
    ['Fruit Salad', '50', 'lib/pics/fruit_salad.jpeg'],
    ['Ice Cream', '40', 'lib/pics/ice_cream.jpeg'],
    ['Milk Shake', '60', 'lib/pics/milk_shake.jpeg'],
    ['Parotta', '30', 'lib/pics/parotta.jpeg'],
    ['Pasta', '60', 'lib/pics/pasta.jpeg'],
    ['Pizza', '150', 'lib/pics/pizza.jpeg'],
    ['Veg. Salad', '50', 'lib/pics/veg_salad.jpeg'],
  ];

  final List _cartItems = [];

  get foods => _foods;

  get cartItems => _cartItems;

  void addItems(int index) {
    _cartItems.add(_foods[index]);
    notifyListeners();
  }

  void removeItems(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String totalPrice() {
    double totalPrice = 0;
    for(int i=0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toString();
  }

}