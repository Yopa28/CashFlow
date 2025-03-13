import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'CashFlow',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lobster', // Gaya font CashFlow
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.teal),
            onPressed: () {
              // Aksi untuk cart
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Category Filter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FilterChip(label: Text('All'), onSelected: (_) {}),
                FilterChip(label: Text('Makanan'), onSelected: (_) {}),
                FilterChip(label: Text('Minuman'), onSelected: (_) {}),
              ],
            ),
            SizedBox(height: 20),
            // Grid of food and drinks
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4, // Menampilkan 4 gambar
                itemBuilder: (context, index) {
                  List<String> images = [
                    'assets/burger1.jpg', // Gambar pertama
                    'assets/EsTeh.jpg', // Gambar kedua
                    'assets/milo.png', // Gambar ketiga
                    'assets/images/burger4.jpg', // Gambar keempat
                  ];
                  return FoodItemCard(
                    imageUrl:
                        images[index], // Ganti dengan gambar sesuai indeks
                    name: 'Food Item ${index + 1}',
                    rating: 4.5 + index * 0.1,
                  );
                },
              ),
            ),
            // Add to Cart button
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () {
                  // Action for Add to Cart
                },
                child:
                    Text('ADD TO CART', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodItemCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double rating;

  const FoodItemCard({
    required this.imageUrl,
    required this.name,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 120,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 16,
                ),
                SizedBox(width: 5),
                Text(
                  '$rating',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.teal,
              ),
              onPressed: () {
                // Logic to add item to cart
              },
            ),
          ),
        ],
      ),
    );
  }
}
