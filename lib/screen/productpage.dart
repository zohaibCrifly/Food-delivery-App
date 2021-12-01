//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:food_ordering_system/data/productdata.dart';

class ProductPage extends StatefulWidget {
  final ProductData data;
  const ProductPage({Key? key, required this.data}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Map> size = [
    {'size': 'S', 'price': 3.00, 'selected': false},
    {'size': 'M', 'price': 6.00, 'selected': true},
    {'size': 'L', 'price': 9.00, 'selected': false},
  ];
  List<Map> extra = [
    {'option': 'More Veggies', 'price': 2.00, 'selected': false},
    {'option': 'More Capsicums', 'price': 3.00, 'selected': false},
  ];
  int quantity = 1;
  double totalPrice = 0.00, sizePrice = 0;
  int selectedSizePriceIndex = 1;
  increaseQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  // gettotalPrice() {
  //   setState(() {
  //     totalPrice = size[selectedSizePriceIndex]['price'];
  //   });
  //   return totalPrice;
  // }

  choseSize(selectedSize) {
    setState(() {
      for (int i = 0; i < size.length; i++) {
        if (i == selectedSize) {
          size[i]['selected'] = true;
          selectedSizePriceIndex = selectedSize;
        } else {
          size[i]['selected'] = false;
        }
      }
    });
  }

  double totalExtra = 0;
  selectopping(selectedTopping) {
    setState(() {
      if (extra[selectedTopping]['selected'] == false) {
        extra[selectedTopping]['selected'] = true;
        totalExtra = totalExtra + extra[selectedTopping]['price'];
      } else {
        extra[selectedTopping]['selected'] = false;
        totalExtra = totalExtra - extra[selectedTopping]['price'];
      }
    });
  }

  decreaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.data.image,
                      width: MediaQuery.of(context).size.width - 20,
                      height: 263,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            //  backgroundBlendMode: BlendMode.color
                          ),
                          child: Icon(Icons.arrow_back)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.title,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            for (int i = 0; i < 5; i++)
                              Icon(
                                i < widget.data.rating.toInt()
                                    ? Icons.star
                                    : Icons.star_border_rounded,
                                color: Color(0xFFFFC107),
                              )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          widget.data.rating.toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.data.description +
                          ' ' +
                          widget.data.description +
                          ' ' +
                          widget.data.description +
                          ' ' +
                          widget.data.description +
                          ' ' +
                          widget.data.description,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Size',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < size.length; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: size[i]['selected']
                                        ? Color(0xFFFB6D3A)
                                        : Color(0xFFF2F2F2),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15)),
                                onPressed: () {
                                  choseSize(i);
                                },
                                child: Text(
                                  size[i]['size'] + '  \$${size[i]['price']}',
                                  style: TextStyle(
                                      color: size[i]['selected']
                                          ? Color(0xFFFFFFFF)
                                          : Colors.black,
                                      fontWeight: FontWeight.normal),
                                )),
                          )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Toppings',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        for (int i = 0; i < extra.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        selectopping(i);
                                      },
                                      child: Icon(
                                        extra[i]['selected']
                                            ? Icons.check_box
                                            : Icons.check_box_outline_blank,
                                        color: extra[i]['selected']
                                            ? Color(0xFFFB6D3A)
                                            : Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(extra[i]['option']),
                                  ],
                                ),
                                Text('\$' + extra[i]['price'].toString())
                              ],
                            ),
                          )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 26,
                          height: 26,
                          child: ElevatedButton(
                            onPressed: () {
                              increaseQuantity();
                            },
                            child: Icon(Icons.remove),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(1),
                              primary: Color(0xFFFB6D3A),
                              shape: CircleBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Container(
                            alignment: Alignment.center,
                            height: 26,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Color(0xFFF2F2F2),
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              quantity.toString(),
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 26,
                          height: 26,
                          child: ElevatedButton(
                            onPressed: () {
                              decreaseQuantity();
                            },
                            child: Icon(Icons.add),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(1),
                              primary: Color(0xFFFB6D3A),
                              shape: CircleBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      child: ElevatedButton(
                        onPressed: () {
                          // decreaseQuantity();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('Add to Cart'),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              '\$' +
                                  ((widget.data.price +
                                              size[selectedSizePriceIndex]
                                                  ['price'] +
                                              totalExtra) *
                                          quantity)
                                      .toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
