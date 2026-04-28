// ignore_for_file: avoid_print, unused_field, prefer_final_fields

class FurnitureItem {
  // Private fields (encapsulation)
  String _name;
  double _price;
  String _category;

  // Constructor
  FurnitureItem(this._name, this._price, this._category);

  String get name => _name;
  double get price => _price;
  String get category => _category;

  // Setter — validation ke saath
  set price(double newPrice) {
    if (newPrice > 0) {
      _price = newPrice;
    } else {
      print("Price 0 se zyada honi chahiye!");
    }
  }

  // Method
  void display() {
    print("[$_category] $_name — \$$_price");
  }

  // 29% discount calculate karna
  double get discountedPrice => _price * 0.71;
}

class Chair extends FurnitureItem {
  String material;

  Chair(String name, double price, this.material)
      : super(name, price, "Chairs");

  // Override parent method
  @override
  void display() {
    print("[Chair] $name — Material: $material — \$$price");
  }
}

class Sofa extends FurnitureItem {
  int seatingCapacity;

  Sofa(String name, double price, this.seatingCapacity)
      : super(name, price, "Sofas");

  @override
  void display() {
    print("[Sofa] $name — Seats: $seatingCapacity people — \$$price");
  }
}

class Table extends FurnitureItem {
  String shape; // Round, Square, Rectangle

  Table(String name, double price, this.shape)
      : super(name, price, "Tables");

  @override
  void display() {
    print("[Table] $name — Shape: $shape — \$$price");
  }
}

void showAllItems(List<FurnitureItem> items) {
  for (var item in items) {
    item.display();
  }
}
abstract class Discountable {
  double applyDiscount(double percentage);
}

class Wardrobe extends FurnitureItem implements Discountable {
  int numberOfDoors;

  Wardrobe(String name, double price, this.numberOfDoors)
      : super(name, price, "Storage");

  @override
  double applyDiscount(double percentage) {
    return price - (price * percentage / 100);
  }

  @override
  void display() {
    print("[Wardrobe] $name — Doors: $numberOfDoors — \$$price");
  }
}

void main() {
  // Objects banao
  Chair chair = Chair("Wooden Chair", 120, "Oak Wood");
  Sofa sofa = Sofa("Sofa Set", 500, 5);
  Table table = Table("Dining Table", 350, "Round");
  Wardrobe wardrobe = Wardrobe("Wardrobe", 280, 3);

  print("═══ AL-R Furniture — All Products ═══");

  List<FurnitureItem> allItems = [chair, sofa, table, wardrobe];
  showAllItems(allItems);

  print("\n═══ Discounted Prices (29% OFF) ═══");
  for (var item in allItems) {
    print("${item.name}: \$${item.discountedPrice.toStringAsFixed(0)}");
  }
}
