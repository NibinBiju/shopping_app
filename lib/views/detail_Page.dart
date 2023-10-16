// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practise/my_provider/my_provider.dart';
import 'package:provider_practise/views/cart_page.dart';
import 'package:provider_practise/views/model/cart_model.dart';

class DeatilsPage extends StatelessWidget {
  const DeatilsPage(
      {super.key,
      required this.price,
      required this.image,
      required this.name,
      required this.quntity,
      required this.index});
  final String image;
  final String name;
  final int price;
  final int quntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    final myprvid = Provider.of<Myprovider>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: const Text(
            'Details',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.notification_add))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 500,
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
            ),

            //product name
            Text(
              name,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
            //qunatity and price
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price.toString(),
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {
                              myprvid.sub();
                            },
                            icon: const Icon(Icons.horizontal_rule_rounded)),
                        Text(
                          myprvid.count.toString(),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            myprvid.add();
                          },
                          icon: const Icon(Icons.add),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          height: 80,
          color: const Color.fromARGB(255, 212, 208, 208),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 138, 135, 135),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'price',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                        indent: 10,
                      ),
                      Text(
                        '${myprvid.count * price}',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                // myprvid.cart.contains(index)== index
                //     ? InkWell(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) {
                //                 return CartPage();
                //               },
                //             ),
                //           );
                //         },
                //         child: Container(
                //           width: 120,
                //           height: 50,
                //           decoration: BoxDecoration(
                //               color: Colors.black,
                //               borderRadius: BorderRadius.circular(12)),
                //           child: const Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text(
                //                 'Go to cart',
                //                 style: TextStyle(
                //                     fontSize: 16,
                //                     fontWeight: FontWeight.w600,
                //                     color: Colors.white),
                //               ),
                //             ],
                //           ),
                //         ))
                // :
                InkWell(
                    onTap: () {
                      myprvid.addToCart(
                          cartModel: CartModel(
                        name: name,
                        imagepath: image,
                        price: price * myprvid.count,
                        quntity: myprvid.count,
                        index: index,
                      ));
                    },
                    child: Container(
                      width: 120,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add to cart',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
