import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../my_provider/my_provider.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myprvid = Provider.of<Myprovider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 28,
          ),
        ),
        actions: const [
          Icon(
            Icons.notification_add,
            color: Colors.black,
            size: 29,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: myprvid.cart.isEmpty
          ? Container(
              padding: const EdgeInsets.only(top: 160),
              width: double.infinity,
              height: double.infinity,
              child: Center(
                  child: Column(
                children: [
                  Image.asset(
                    'assets/images/pngwing.com (8).png',
                    height: 350,
                  ),
                ],
              )),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: myprvid.cart.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(9),
                          child: Slidable(
                            direction: Axis.horizontal,
                            //scroll buttons
                            startActionPane: ActionPane(
                              motion: const StretchMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    myprvid.deleteAt(index);
                                  },
                                  icon: Icons.delete,
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    //edit quantity
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return SimpleDialog(
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                myprvid.cart[index].imagepath,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      myprvid.subcart(myprvid
                                                          .cart[index].quntity);
                                                    },
                                                    child:
                                                        const Icon(Icons.add)),
                                                Text(
                                                  myprvid.cart[index].quntity
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontSize: 27,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      myprvid.addcart(myprvid
                                                          .cart[index]
                                                          .quntity--);
                                                    },
                                                    child: const Icon(Icons
                                                        .horizontal_rule_rounded))
                                              ],
                                            ),
                                            Text(
                                              myprvid.cart[index].price
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: Icons.edit,
                                  backgroundColor: Colors.blueGrey,
                                  foregroundColor: Colors.white,
                                )
                              ],
                            ),
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: const Color.fromARGB(255, 199, 199, 199),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 90,
                                          height: 90,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                              color: Colors.white,
                                              image: DecorationImage(
                                                  image: AssetImage(myprvid
                                                      .cart[index].imagepath))),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              myprvid.cart[index].name
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              'Quantity:- ${myprvid.cart[index].quntity}',
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Price:- ${myprvid.cart[index].price.toString()}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }
}
