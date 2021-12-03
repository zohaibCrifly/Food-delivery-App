import 'package:flutter/material.dart';
import 'package:food_ordering_system/screen/main_menu.dart';

class OrderBook extends StatefulWidget {
  const OrderBook({Key? key}) : super(key: key);

  @override
  _OrderBookState createState() => _OrderBookState();
}

class _OrderBookState extends State<OrderBook> {
  List<Map> orderTabs = [
    {
      'label': 'Active',
      'selected': true,
    },
    {
      'label': 'Delivered',
      'selected': false,
    },
    {
      'label': 'Cancelled',
      'selected': false,
    },
  ];
  selectTab(selected) {
    setState(() {
      for (int i = 0; i < orderTabs.length; i++) {
        if (selected == i) {
          orderTabs[i]['selected'] = true;
        } else {
          orderTabs[i]['selected'] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => MainMenu()));
                  },
                  child: Icon(
                    Icons.close,
                    size: 30,
                  ),
                ),
                Text(
                  'Your Orders',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  width: 30,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              for (int index = 0; index < orderTabs.length; index++)
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        selectTab(index);
                      },
                      child: Text(
                        orderTabs[index]['label'],
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 50,
                      height: 3,
                      decoration: BoxDecoration(
                          color: orderTabs[index]['selected']
                              ? Color(0xFFFB6D3A)
                              : null),
                    )
                  ],
                )
            ])
          ],
        ),
      ),
    );
  }
}
