class CartModel {
  final int index;
  final String imagepath;
  final String name;
  final int price;
  int quntity;

  CartModel({
    required this.name,
    required this.imagepath,
    required this.price,
    required this.quntity,
    required this.index,
  });
}
