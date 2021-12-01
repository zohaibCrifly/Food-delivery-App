import 'package:flutter/material.dart';
import 'package:food_ordering_system/screen/filter.dart';
import 'package:food_ordering_system/screen/widgets/featuredcategorylist.dart';
import 'package:food_ordering_system/screen/widgets/featureproduct.dart';
import 'package:food_ordering_system/data/productdata.dart';

class HomeSceena extends StatefulWidget {
  const HomeSceena({Key? key}) : super(key: key);

  @override
  _HomeSceenaState createState() => _HomeSceenaState();
}

class _HomeSceenaState extends State<HomeSceena> {
  List<Map> taptitles = [
    {
      'tabTitle': 'Recomended',
      'selected': true,
      'content': 'a',
    },
    {
      'tabTitle': 'Newest Item',
      'selected': false,
      'content': 'b',
    },
    {
      'tabTitle': 'Popular',
      'selected': false,
      'content': 'c',
    },
    {
      'tabTitle': 'Best Seller',
      'selected': false,
      'content': 'd',
    },
  ];
  List<Tab> tabs = <Tab>[
    Tab(text: 'Recomended'),
    Tab(text: 'Newest Item'),
    Tab(text: 'Popular'),
    Tab(text: 'Best Seller'),
  ];
  int tabselected = 0;
  String selectedOption = 'Recomended';
  selectedTab(b) {
    setState(() {
      for (int i = 0; i < taptitles.length; i++) {
        if (i == b) {
          taptitles[i]['selected'] = true;
          selectedOption = taptitles[i]['tabTitle'];
        } else {
          taptitles[i]['selected'] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
              child: Column(
                children: [
                  Text(
                    'Dilver Now',
                    style: TextStyle(
                      color: Color(0xFF409452),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '1226 University Dr',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 22,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      fillColor: Color(0xFFF2F2F2),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Resturants, cuisines, dishes',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      width: 1, color: Colors.grey))),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => Filter()));
                            },
                            child: Icon(
                              Icons.tune,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Featuredcategorylist(),
                ],
              ),
            ),
            Divider(
              thickness: 6,
              color: Color(0xFFF2F2F2),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Offers for you',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'images/banner-1.jpg',
                            height: 152,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'images/banner-2.jpg',
                            height: 152,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < taptitles.length; i++)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  selectedTab(i);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Text(
                                    taptitles[i]['tabTitle'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: taptitles[i]['selected']
                                        ? Color(
                                            0xFFFB6D3A,
                                          )
                                        : null,
                                  ),
                                  height: 2,
                                  width: 50,
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                      children: productList
                          .map((e) => FeaturedProductList(data: e))
                          .toList())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
