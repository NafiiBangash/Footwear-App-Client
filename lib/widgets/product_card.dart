import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;
  final String offerTag;
  final VoidCallback onTap;
  const ProductCard({super.key, required this.imageUrl, required this.name, required this.price, required this.offerTag, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                  imageUrl,
                height: 120,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 9.0),
              Text(name,style: const TextStyle(fontSize: 16.0,overflow: TextOverflow.ellipsis),),
              const SizedBox(height: 9.0),
              Text('Rs : $price',style: const TextStyle(fontSize: 16.0,overflow: TextOverflow.ellipsis),),
              const SizedBox(height: 4.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.green
                ),
                child: Text(
                  offerTag,
                  style: const TextStyle(color: Colors.white,fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
