import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // Daftar produk makanan dengan gambar, rating, dan nama
  List<Map<String, dynamic>> foodItems = [
    {'name': 'Cheeseburger', 'image': 'assets/food_item1.png', 'rating': 4.9},
    {'name': 'Hamburger', 'image': 'assets/food_item2.png', 'rating': 4.8},
    {'name': 'Hamburger', 'image': 'assets/food_item3.png', 'rating': 4.6},
    {'name': 'Hamburger', 'image': 'assets/food_item4.png', 'rating': 4.5},
  ];

  // Fungsi untuk menambahkan item ke keranjang (misalnya)
  void addToCart(int index) {
    // Aksi untuk menambahkan produk ke keranjang
    print("${foodItems[index]['name']} ditambahkan ke keranjang.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CashFlow'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pesan Makanan Favorit Anda!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Bar pencarian
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.settings),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            // Pilihan kategori makanan
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _categoryButton('All'),
                _categoryButton('Combos'),
                _categoryButton('Sliders'),
                _categoryButton('Classics'),
              ],
            ),
            SizedBox(height: 20),
            // Grid untuk menampilkan produk makanan
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 kolom
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.75, // rasio antara lebar dan tinggi item
                ),
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Aksi saat item dipilih
                      print("${foodItems[index]['name']} dipilih!");
                      // Misalnya navigasi ke halaman detail produk
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailPage(
                            foodName: foodItems[index]['name'],
                            foodImage: foodItems[index]['image'],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              foodItems[index]['image'], // Gambar produk
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 150,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              foodItems[index]['name'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.orange, size: 18),
                                SizedBox(width: 4),
                                Text('${foodItems[index]['rating']}'),
                              ],
                            ),
                          ),
                          Spacer(),
                          // Tombol + untuk menambah ke keranjang
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () => addToCart(index),
                              child: Text('+'),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(12),
                                backgroundColor:
                                    Colors.teal, // Tombol berwarna teal
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk kategori tombol
  Widget _categoryButton(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          backgroundColor:
              Colors.teal, // Ganti dari primary menjadi backgroundColor
        ),
        child: Text(label),
      ),
    );
  }
}

class FoodDetailPage extends StatelessWidget {
  final String foodName;
  final String foodImage;

  FoodDetailPage({required this.foodName, required this.foodImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodName),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(foodImage, width: 200, height: 200),
            SizedBox(height: 20),
            Text(foodName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            // Tambahkan detail lainnya sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
