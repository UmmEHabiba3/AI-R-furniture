import '../models/products.dart';

List<Map<String, dynamic>> products = [
  {
    "name": "Wooden Chair",
    "price": 120,
    "image": "assets/images/chair.jpg",
  },
  {
    "name": "Dining Table",
    "price": 350,
    "image": "assets/images/table.jpg",
  },
  {
    "name": "Sofa Set",
    "price": 500,
    "image": "assets/images/sofa.jpg",
  },
  {
    "name": "Wardrobe",
    "price": 280,
    "image": "assets/images/wardrobe.jpg",
  },
];

List<Product> productObjects = products
    .map((map) => Product.fromMap(map))
    .toList();

// Helper: Search karo products mein
List<Map<String, dynamic>> searchProducts(String query) {
  return products
      .where((p) => p["name"].toLowerCase().contains(query.toLowerCase()))
      .toList();
}

// Helper: Category ke basis pe filter karo
List<Map<String, dynamic>> filterByCategory(String category) {
  return products
      .where((p) => p["category"] == category)
      .toList();
}