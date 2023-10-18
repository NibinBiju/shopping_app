import 'package:flutter/material.dart';
import 'package:provider_practise/views/model/cart_model.dart';

class Myprovider with ChangeNotifier {
  int count = 1;
  int selectedIndex = 0;
  int appbarIndex = 0;
  int? favoriteIndex;
  int countcart = 0;
  int countfa = 1;

  late CartModel cartModel;

  List<CartModel> cart = [];
  void add2() {
    countfa++;
    notifyListeners();
  }

  void appbarIn(int index) {
    appbarIndex = index;
    notifyListeners();
  }

  void fav(int index) {
    favoriteIndex = index;
    notifyListeners();
  }

  void add() {
    count++;

    notifyListeners();
  }

  void sub() {
    if (count > 1) {
      count--;
    }
    notifyListeners();
  }

  void selectedicon(int value) {
    selectedIndex = value;
    notifyListeners();
  }

  void deleteAt(int index) {
    cart.removeAt(index);
    notifyListeners();
  }

  void addToCart({required CartModel cartModel}) {
    if (count > 0) {
      cart.add(cartModel);
      notifyListeners();
    }
  }

  void addcart(int value) {
    value++;
  }

  void subcart(int value) {
    value--;
  }
}
