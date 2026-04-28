import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart_manager.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;

  String _getDescription(String name) {
    final n = name.toLowerCase();
    if (n.contains('sofa') || n.contains('couch')) {
      return "Premium quality sofa crafted with durable fabric and solid wood frame. Designed for maximum comfort and long-lasting use. Perfect for modern living rooms.";
    } else if (n.contains('table') || n.contains('coffee')) {
      return "Elegant table with a smooth finish and sturdy build. Ideal for living rooms, offices, or dining spaces. Easy to clean and maintain.";
    } else if (n.contains('chair')) {
      return "Ergonomically designed chair with cushioned seating. Suitable for home and office use. Available in multiple colors.";
    } else if (n.contains('bed')) {
      return "Spacious and comfortable bed with a strong wooden frame. Supports restful sleep with its premium design. Available in multiple sizes.";
    } else if (n.contains('wardrobe') || n.contains('cabinet')) {
      return "Spacious wardrobe with multiple compartments for organized storage. Built with high-quality wood and smooth sliding doors.";
    } else {
      return "High-quality furniture piece designed for modern homes. Built with premium materials to ensure durability, style, and everyday comfort.";
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final double price = (product["price"] as num).toDouble();
    final double originalPrice = price * 1.29;
    final String description = _getDescription(product["name"]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          product["name"],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Georgia',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, '/cart'),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shopping_cart_outlined,
                        color: Colors.white, size: 22),
                    SizedBox(height: 2),
                    Text("Cart",
                        style:
                            TextStyle(color: Colors.white70, fontSize: 9)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LEFT: Fixed Image
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.42,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Image.asset(
                  product["image"],
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.chair,
                        size: 80, color: Colors.brown),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      "Sale 29%",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // RIGHT: Scrollable Details
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product["name"],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),

                  _infoRow("SKU:", "ALR-${product["name"].hashCode.abs() % 99999}"),
                  _infoRow("Availability:", "In Stock"),
                  _infoRow("Product Type:", "Furniture"),

                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 8),

                  const Text("Product Description",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(description,
                      style: const TextStyle(
                          fontSize: 13, color: Colors.black54, height: 1.6)),

                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 8),

                  const Text("Key Features",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  _featureRow(Icons.check_circle_outline, "Premium Quality Material"),
                  _featureRow(Icons.check_circle_outline, "Easy Assembly"),
                  _featureRow(Icons.check_circle_outline, "Modern Design"),
                  _featureRow(Icons.check_circle_outline, "1 Year Warranty"),
                  _featureRow(Icons.check_circle_outline, "Free Delivery Available"),

                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 8),

                  // Price — FIXED (no quantity multiplication)
Row(
  children: [
    Text(
      "\$${originalPrice.toStringAsFixed(0)}",
      style: const TextStyle(
        fontSize: 13,
        color: Colors.grey,
        decoration: TextDecoration.lineThrough,
      ),
    ),
    const SizedBox(width: 8),
    Text(
      "\$${price.toStringAsFixed(0)}",
      style: const TextStyle(
        fontSize: 22,
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),
                  const SizedBox(height: 14),

                  const Text("Quantity:",
                      style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, size: 14),
                          onPressed: () {
                            if (quantity > 1) setState(() => quantity--);
                          },
                        ),
                        Text('$quantity',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        IconButton(
                          icon: const Icon(Icons.add, size: 14),
                          onPressed: () => setState(() => quantity++),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ADD TO CART
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
  context.read<CartManager>().addToCart(product, quantity: quantity);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("${product["name"]} x$quantity added!"),
      backgroundColor: Colors.orange,
    ),
  );
},
                      child: const Text(
                        "ADD TO CART",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // BUY IT NOW — FIXED
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A1A1A),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                       context.read<CartManager>().addToCart(product, quantity: quantity);
                        Navigator.pushNamed(context, '/cart');
                        },
                      child: const Text(
                        "BUY IT NOW",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500)),
          const SizedBox(width: 4),
          Text(value,
              style: const TextStyle(fontSize: 12, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _featureRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange, size: 16),
          const SizedBox(width: 6),
          Text(text,
              style: const TextStyle(fontSize: 12, color: Colors.black87)),
        ],
      ),
    );
  }
}