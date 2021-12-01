import 'package:flutter/material.dart';
import 'package:food_ordering_system/data/productdata.dart';
import 'package:food_ordering_system/screen/productpage.dart';

class FeaturedProductList extends StatefulWidget {
  final ProductData data;
  const FeaturedProductList({Key? key, required this.data}) : super(key: key);

  @override
  _FeaturedProductListState createState() => _FeaturedProductListState();
}

class _FeaturedProductListState extends State<FeaturedProductList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ProductPage(data: widget.data)));
        },
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${widget.data.price}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          SizedBox(
                            width: 26,
                            height: 26,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(Icons.add),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(1),
                                primary: Color(0xFFFB6D3A),
                                shape: CircleBorder(),
                              ),
                            ),
                          )
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
    );
  }
}
