import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:shoes_shopping_app/providers/cart_provider.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;

    return Scaffold(
      appBar: AppBar(title: Center(child: const Text("Cart"))),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 30,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      "Delete Product",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    content: const Text(
                      "Are you sure you want to remove the product from the cart?",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Cancel / Dismiss
                        },
                        style: ButtonStyle(
                          textStyle: WidgetStateProperty.all(
                            Theme.of(context).textTheme.labelLarge,
                          ),
                          foregroundColor: WidgetStateProperty.all(
                            Colors.grey[700],
                          ),
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                        ),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Provider.of<CartProvider>(
                            context,
                            listen: false,
                          ).removeProduct(cartItem);
                          Navigator.of(context).pop(); // Close dialog
                        },
                        style: ButtonStyle(
                          textStyle: WidgetStateProperty.all(
                            Theme.of(context).textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          foregroundColor: WidgetStateProperty.all(Colors.red),
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                        ),
                        child: const Text("Yes"),
                      ),
                    ],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
            title: Text(
              cartItem['title'] as String,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text("Size: ${cartItem['size'].toString()}"),
          );
        },
      ),
    );
  }
}
