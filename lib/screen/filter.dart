import 'package:flutter/material.dart';
import 'package:food_ordering_system/screen/browser.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<Map> category = [
    {'label': 'Breakfast', 'selected': false},
    {'label': 'Lunch', 'selected': true},
    {'label': 'Dinner', 'selected': false},
  ];
  List<Map> cousine = [
    {'label': 'Continental', 'selected': false},
    {'label': 'Fast Food', 'selected': true},
    {'label': 'Chinese', 'selected': false},
  ];
  List<Map> sortList = [
    {'label': 'Picked for you', 'selected': false},
    {'label': 'Most popular', 'selected': false},
    {'label': 'Recommended', 'selected': false},
    {'label': 'Newest', 'selected': false},
  ];
  sorting(selectedSort) {
    setState(() {
      for (int i = 0; i < sortList.length; i++) {
        if (i == selectedSort) {
          sortList[i]['selected'] = true;
        } else {
          sortList[i]['selected'] = false;
        }
      }
    });
  }

  double selectedPriceRange = 150;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFFB6D3A),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.close,
                            size: 30,
                          ),
                        ),
                        Text(
                          'Sort and Filter',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          width: 30,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Categories',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Wrap(
                        // crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          for (int i = 0; i < category.length; i++)
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    primary: category[i]['selected']
                                        ? Color(0xFFFB6D3A)
                                        : Color(0xFFF5F5F5),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12)),
                                onPressed: () {
                                  setState(() {
                                    category[i]['selected'] =
                                        !category[i]['selected'];
                                  });
                                },
                                child: Text(
                                  category[i]['label'],
                                  style: TextStyle(
                                    color: category[i]['selected']
                                        ? Color(0xFFFFFFFF)
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Cousine',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Wrap(
                        children: [
                          for (int i = 0; i < cousine.length; i++)
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    primary: cousine[i]['selected']
                                        ? Color(0xFFFB6D3A)
                                        : Color(0xFFF5F5F5),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12)),
                                onPressed: () {
                                  setState(() {
                                    cousine[i]['selected'] =
                                        !cousine[i]['selected'];
                                  });
                                },
                                child: Text(
                                  cousine[i]['label'],
                                  style: TextStyle(
                                    color: cousine[i]['selected']
                                        ? Color(0xFFFFFFFF)
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Price',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Slider(
                      value: selectedPriceRange,
                      onChanged: (newprice) {
                        setState(() {
                          selectedPriceRange = newprice;
                        });
                      },
                      max: 500,
                      min: 0,
                      divisions: 10,
                      label: '\$' + selectedPriceRange.toString(),
                      thumbColor: Color(0xFFFB6D3A),
                      activeColor: Color(0xFFFB6D3A),
                      inactiveColor: Colors.grey,
                    ),
                    // Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         '\$0',
                    //         style: Theme.of(context).textTheme.headline3,
                    //       ),
                    //       Text(
                    //         '\$500',
                    //         style: Theme.of(context).textTheme.headline3,
                    //       )
                    //     ]),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sort by',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        for (int i = 0; i < sortList.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    sorting(i);
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: sortList[i]['selected']
                                            ? Color(0xFFFB6D3A)
                                            : null,
                                        border: Border.all(
                                            width: 1, color: Colors.grey)),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(sortList[i]['label']),
                              ],
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => Browser()));
                        },
                        child: Text(
                          'Apply',
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          primary: Color(0xFFFB6D3A),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
