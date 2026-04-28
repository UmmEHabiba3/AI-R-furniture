class Product {
  // Encapsulation: private-like final fields
  final String name;
  final double price;
  final String image;
  final String category;

  // Constructor
  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.category,
  });

  // OOP Concept: Getter methods
  double get discountedPrice => double.parse((price * 0.71).toStringAsFixed(0));
  double get originalPrice => price;
   double get savedAmount => double.parse((price * 0.29).toStringAsFixed(0));

  // OOP Concept: Factory Constructor (data conversion)
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map["name"],
      price: (map["price"] as num).toDouble(),
      image: map["image"],
      category: map["category"] ?? "Furniture",
    );
  }

  // OOP Concept: Instance Method
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "price": price,
      "image": image,
      "category": category,
       };
  }

  // OOP Concept: toString override
  @override
  String toString() {
    return 'Product(name: $name, price: \$$price, category: $category)';
  }
}