import "package:flutter/material.dart";

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imgUrl;
  final Color backgroundColor;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imgUrl,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          Text("\$$price", style: Theme.of(context).textTheme.bodySmall),
          Center(child: Image.asset(imgUrl, height: 175)),
        ],
      ),
    );
  }
}
