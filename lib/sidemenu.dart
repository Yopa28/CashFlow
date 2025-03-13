import 'package:cashflow/menu_page.dart';
import 'package:cashflow/keranjang_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CashFlow App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int totalProduct = 5;
  int totalOrder = 2;
  double totalRevenue = 3100;
  double totalExpenses = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.teal,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu), // Tombol hamburger
              onPressed: () {
                // Menampilkan side menu
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: SideMenuPage(), // Menampilkan side menu dengan Drawer
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Dashboard',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            // Menampilkan Total Product, Total Order, Total Revenue, Total Expenses
            _buildCard('Total Product', '$totalProduct'),
            const SizedBox(height: 10),
            _buildCard('Total Order', '$totalOrder'),
            const SizedBox(height: 10),
            _buildCard('Total Revenue', 'Rp. $totalRevenue'),
            const SizedBox(height: 10),
            _buildCard('Total Expenses', 'Rp. $totalExpenses'),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun Card
  Widget _buildCard(String title, String value) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            Text(value,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

// Halaman SideMenuPage (side menu baru)
class SideMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 250, // Lebar side menu yang lebih besar
        color: Colors.teal[50],
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                // Navigasi ke halaman Dashboard
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Products'),
              onTap: () {
                // Navigasi ke halaman Products
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPage()),
                );
              },
            ),
           ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Orders'),
              onTap: () {
                // Navigasi ke halaman Orders
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrdersPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('POS'),
              onTap: () {
                // Navigasi ke halaman POS
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Others'),
              onTap: () {
                // Navigasi ke halaman Others
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
