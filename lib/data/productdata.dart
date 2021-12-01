class ProductData {
  int id;
  String image;
  String title;
  String description;
  double price;
  double rating;
  String category;
  ProductData({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    required this.category,
  });
}

List<ProductData> productList = [
  ProductData(
    id: 1,
    title: 'Beef Burger with fries',
    description: 'Beef Burger loaded with Cheese',
    image: 'images/product/burgar-1.jpg',
    price: 4.00,
    rating: 4.5,
    category: 'burgar',
  ),
  ProductData(
    id: 2,
    title: 'Beef Burger with fries',
    description: 'Beef Burger loaded with Cheese',
    image: 'images/product/sandwitch-1.jpg',
    price: 5.00,
    rating: 4.3,
    category: 'sandwitch',
  ),
  ProductData(
    id: 3,
    title: 'Bar-Be-Que Pizza Slice',
    description: 'Pizza slice loaded with chicken',
    image: 'images/product/pizza-1.jpg',
    price: 2.00,
    rating: 4.6,
    category: 'pizza',
  ),
  ProductData(
    id: 4,
    title: 'Beef Burger with fries',
    description: 'Beef Burger loaded with Cheese',
    image: 'images/product/burgar-1.jpg',
    price: 4.00,
    rating: 4.5,
    category: 'burgar',
  ),
  ProductData(
    id: 5,
    title: 'Fajita Cheesy Pizza',
    description: 'Spicy Pizza loaded with Cheese',
    image: 'images/product/pizza-2.jpg',
    price: 5.00,
    rating: 4.7,
    category: 'pizza',
  ),
  ProductData(
    id: 6,
    title: 'Beef Burger with fries',
    description: 'Beef Burger loaded with Cheese',
    image: 'images/product/sandwitch-1.jpg',
    price: 5.00,
    rating: 4.3,
    category: 'sandwitch',
  ),
  ProductData(
    id: 7,
    title: 'Sandwich with fries',
    description: 'Sandwich loaded with Cheese',
    image: 'images/product/burgar-1.jpg',
    price: 4.00,
    rating: 4.5,
    category: 'burgar',
  ),
];
