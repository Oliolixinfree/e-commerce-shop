import 'package:e_commerce_shop/models/product.dart';
import 'package:e_commerce_shop/pages/cart_details.dart';
import 'package:e_commerce_shop/widgets/available_size.dart';
import 'package:flutter/material.dart';
import '../providers/cart_provider.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.yellow.shade100),
                    // child: CircleAvatar(
                    //   radius: 30,
                    //   backgroundImage: ExactAssetImage(product.image),
                    // ),
                    child: Image.asset(product.image, fit: BoxFit.cover),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                // height: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\$ ${product.price}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      product.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 14),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Available Size',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        AvailableSize(size: 'US 7'),
                        AvailableSize(size: 'US 8'),
                        AvailableSize(size: 'US 9'),
                        AvailableSize(size: 'US 10'),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Available Size',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.blueAccent,
                        ),
                        SizedBox(width: 8),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.orangeAccent,
                        ),
                        SizedBox(width: 8),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.lightGreenAccent,
                        ),
                        SizedBox(height: 26),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 10,
          decoration: BoxDecoration(
            color: Colors.yellow.shade600,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${product.price}',
                style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  provider.toggleProduct(product);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartDetails(),
                    ),
                  );
                },
                icon: const Icon(Icons.send),
                label: const Text('Add to Card'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
