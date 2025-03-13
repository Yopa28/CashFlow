import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orders Page',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: OrdersPage(),
    );
  }
}

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<Item> items = [
    Item(name: "Cheeseburger Wendy's Burger", price: 50000, quantity: 1),
    Item(name: "Es Teh Manis", price: 25000, quantity: 1),
  ];

  int totalItem = 0;
  int totalPrice = 0;

  // Variabel untuk mengelola informasi pemesan
  String sambalInfo = "Sambalnya yang banyak ya";

  @override
  void initState() {
    super.initState();
    _calculateTotal();
  }

  void _calculateTotal() {
    totalItem = 0;
    totalPrice = 0;
    for (var item in items) {
      totalItem += item.quantity;
      totalPrice += item.price * item.quantity;
    }
  }

  // Fungsi untuk menampilkan dialog untuk mengubah informasi
  void _showEditDialog() {
    TextEditingController controller = TextEditingController(text: sambalInfo);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ubah Informasi Pemesan'),
          content: TextField(
            controller: controller,
            decoration:
                const InputDecoration(hintText: "Masukkan informasi baru"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  sambalInfo = controller.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk mengurangi jumlah kuantitas item
  void _decreaseQuantity(int index) {
    setState(() {
      if (items[index].quantity > 1) {
        items[index].quantity--;
        _calculateTotal();
      } else {
        // Jika kuantitas sudah 1, maka item dapat dihapus jika diinginkan
        items.removeAt(index);
        _calculateTotal();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Informasi Pemesan
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Informasi Pemesan'),
                TextButton(
                  onPressed: _showEditDialog,
                  child: const Text('Ubah'),
                ),
              ],
            ),
            const Divider(),
            // Menampilkan informasi pemesan yang bisa diubah
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(sambalInfo), // Menampilkan informasi yang diubah
              ],
            ),
            const SizedBox(height: 20),
            // Daftar Pesanan
            const Text('Daftar Pesanan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                // Menentukan gambar berdasarkan nama item
                String imagePath = '';
                if (items[index].name.contains('Cheeseburger')) {
                  imagePath = 'assets/burger1.jpg';
                } else if (items[index].name.contains('Es Teh Manis')) {
                  imagePath = 'assets/EsTeh.jpg';
                }

                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    leading: Image.asset(
                      imagePath, // Menggunakan path gambar yang sesuai
                      width: 50, // Ukuran gambar
                      height: 50, // Ukuran gambar
                      fit: BoxFit.cover, // Menyesuaikan ukuran gambar
                    ),
                    title: Text(items[index].name),
                    subtitle: Text('Rp. ${items[index].price}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            _decreaseQuantity(index); // Mengurangi kuantitas
                          },
                        ),
                        Text('${items[index].quantity}'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              items[index].quantity++;
                              _calculateTotal();
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              items.removeAt(index);
                              _calculateTotal();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const Divider(),
            // Jumlah Item dan Total Pesanan
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Jumlah Item'),
                Text('$totalItem item'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Pesanan'),
                Text('Rp. $totalPrice'),
              ],
            ),
            const SizedBox(height: 20),
            // Tombol Pesan Sekarang
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logic to proceed with the order
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: const Text('Pesan Sekarang',
                    style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Kelas untuk Item
class Item {
  final String name;
  final int price;
  int quantity;

  Item({required this.name, required this.price, required this.quantity});
}
