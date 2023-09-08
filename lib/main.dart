import 'package:e_commerce_shop/pages/cart_details.dart';
import 'package:e_commerce_shop/pages/favorite_screen.dart';
import 'package:e_commerce_shop/pages/home_screen.dart';
import 'package:e_commerce_shop/pages/profile_screen.dart';
import 'package:e_commerce_shop/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ],
        child: MaterialApp(
          title: 'E-Commerce Shop',
          theme: ThemeData(
            primarySwatch: Colors.yellow,
          ),
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.yellow.shade600,
              title: const Text(
                'E-Commerce Shop',
              ),
              centerTitle: true,
              actions: [
                Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartDetails(),
                        ),
                      ),
                      icon: const Icon(Icons.add_shopping_cart),
                    );
                  },
                ),
              ],
            ),
            body: screens[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                setState(() => currentIndex = value);
              },
              selectedItemColor: Colors.yellow.shade600,
              unselectedItemColor: Colors.grey,
              currentIndex: currentIndex,
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: 'Favorite',
                  icon: Icon(Icons.favorite),
                ),
                BottomNavigationBarItem(
                  label: 'Profile',
                  icon: Icon(Icons.person),
                ),
              ],
            ),
          ),
        ),
      );
}
