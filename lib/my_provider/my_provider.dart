import 'package:flutter/material.dart';
import 'package:provider_practise/views/model/cart_model.dart';

class Myprovider with ChangeNotifier {
  int count = 0;
  int selectedIndex = 0;
  int appbarIndex = 0;
  int? favoriteIndex;

  final List<CartModel> cart = [];

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
    if (count > 0) {
      count--;
    }
    notifyListeners();
  }

  void selectedicon(int value) {
    selectedIndex = value;
    notifyListeners();
  }

  int totalAt(int price) {
    int total = price * count;
    return total;
  }

  void deleteAt(int index) {
    cart.removeAt(index);
    notifyListeners();
  }

  void addToCart(
      {required String image,
      required String name,
      required int price,
      required String qunatity}) {
    if (count > 0) {
      cart.add(CartModel(
          name: name, imagepath: image, price: price * count, quntity: count));
    }
  }
}
