// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practise/my_provider/my_provider.dart';
import 'package:provider_practise/views/detail_Page.dart';

class Homepage extends StatelessWidget {
  Homepage({
    super.key,
  });

  final List category = [
    'All',
    'Kids',
    'Men',
    'Women',
  ];

  final List image = [
    ['assets/images/pngwing.com (2).png', 500, 'White t-shirt', 0],
    ['assets/images/pngwing.com (3).png', 1000, 'Check Shirt', 0],
    ['assets/images/pngwing.com (1).png', 800, 'Black Hoodie', 0],
    ['assets/images/pngwing.com (7).png', 1200, 'Blue Check Shirt', 0],
    ['assets/images/pngwing.com (5).png', 900, 'Sweet Shirt', 0],
    ['assets/images/pngwing.com (6).png', 930, 'Orange Hoodie', 0],
  ];

  bool selectedBool = false;

  @override
  Widget build(BuildContext context) {
    final myprvid = Provider.of<Myprovider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Discover',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 28,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notification_add,
              color: Colors.black,
              size: 29,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(166, 206, 200, 200),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: const Center(
                    child: TextField(
                      cursorColor: Colors.transparent,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 30,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.vertical_distribute_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: category.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(3.0),
                child: GestureDetector(
                  onTap: () {
                    myprvid.appbarIn(index);
                  },
                  child: Container(
                    width: 100,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: myprvid.appbarIndex == index
                          ? Colors.black
                          : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        category[index],
                        style: TextStyle(
                          color: myprvid.appbarIndex == index
                              ? Colors.white
                              : Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: image.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return DeatilsPage(
                            image: image[index][0],
                            price: image[index][1],
                            name: image[index][2],
                            quntity: image[index][3],
                            index: index,
                          );
                        },
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 224, 222, 222),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 125,
                                    child: Image.asset(
                                      image[index][0],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        image[index][2],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Price:-${image[index][1]}',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: index == myprvid.favoriteIndex
                                      ? const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                      : const Icon(Icons.favorite_border),
                                  onPressed: () {
                                    myprvid.fav(index);
                                  },
                                ),
                              ],
                            )
                          ],
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
