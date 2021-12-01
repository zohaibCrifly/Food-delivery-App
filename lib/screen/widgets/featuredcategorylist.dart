import 'package:flutter/material.dart';

class Featuredcategorylist extends StatefulWidget {
  const Featuredcategorylist({Key? key}) : super(key: key);

  @override
  _FeaturedcategorylistState createState() => _FeaturedcategorylistState();
}

class _FeaturedcategorylistState extends State<Featuredcategorylist> {
  List<Map> featuredcategorylist = [
    {'image': 'images/pizza-icon.png', 'title': 'Pizza'},
    {'image': 'images/burgar-icon.png', 'title': 'Burgar'},
    {'image': 'images/chicken-icon.png', 'title': 'Chicken'},
    {'image': 'images/sandwitch-icon.png', 'title': 'Sandwitch'},
    {'image': 'images/fries-icon.png', 'title': 'Fries'},
  ];
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (int i = 0; i < featuredcategorylist.length; i++)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.5),
          child: Column(
            children: [
              Image.asset(
                featuredcategorylist[i]['image'],
                height: 40,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                featuredcategorylist[i]['title'],
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
        ),
    ]);
  }
}
