import 'package:flutter/material.dart';
import 'package:food_ordering_system/data/productdata.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Cart extends StatefulWidget {
  final ProductData data;
  final double price;
  final int quantity;
  const Cart(
      {Key? key,
      required this.price,
      required this.quantity,
      required this.data})
      : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int quantity = 1;
  double thisprice = 0;
  initState() {
    quantity = widget.quantity;
    thisprice = widget.price;
  }

  // int quantity = 1;
  increaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
        thisprice = thisprice - widget.data.price;
      }
    });
  }

  decreaseQuantity() {
    setState(() {
      quantity++;
      thisprice = thisprice + widget.data.price;
    });
  }

  LatLng currentPosition = LatLng(33.688592146671425, 73.04865280603227);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                      ),
                      Text(
                        'My Cart',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                  // onTap: () {
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (_) => ProductPage(data: widget.data)));
                  // },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 3, color: Color(0XFFF2F2F2))),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            widget.data.image,
                            height: 95,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 176,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.data.title,
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.data.description,
                                  style: TextStyle(
                                    color: Color(0xFF64748B),
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$$thisprice',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 26,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Color(0xFFF2F2F2),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Text(
                                              quantity.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3,
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
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        primary: Color(0xFFF2F2F2),
                        padding: EdgeInsets.all(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            Icons.confirmation_number_outlined,
                            color: Color(0xFFFB6D3A),
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: Colors.grey, width: 1))),
                        ),
                        Text(
                          'Add Voucher / Promocode',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFFFB6D3A),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          '\$$thisprice',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          '\$0.0',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dilevery Fee',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          '\$3.0',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.black, width: 1),
                    bottom: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      '\$' + (thisprice + 3.0).toString(),
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Color(0xFFFB6D3A),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Deliver to',
                    style: Theme.of(context).textTheme.headline3,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    'XYZ house , Main street , Islamabad',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                child: GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: currentPosition, zoom: 15),
                  // onCameraMove: (position) {
                  //   position.target;
                  // },
                  // zoomControlsEnabled: true,
                  markers: {
                    Marker(
                      draggable: true,
                      markerId: MarkerId('1'),
                      position: currentPosition,
                    ),
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Checkout'),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        '\$' + ((thisprice + 3).toString()),
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
        ),
      ),
    );
  }
}
