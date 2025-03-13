import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: OrderReceivedScreen(),
  ));
}

class OrderReceivedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Pesanan Diterima'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon Check
              Icon(
                Icons.check_circle_outline,
                color: Colors.teal,
                size: 100,
              ),
              SizedBox(height: 20),
              // Text "Pesanan Diterima"
              Text(
                'Pesanan Diterima',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 10),
              // Text deskripsi
              Text(
                'Pesanan mu sudah diterima dan akan segera dipersiapkan, silahkan menunggu dengan santuy ya...',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 30),
              // Button "Lihat Pesanan"
              ElevatedButton(
                onPressed: () {
                  // Action on button press
                },
                child: Text('Lihat Pesanan'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Background color
                  foregroundColor: Colors.teal, // Text color
                  side: BorderSide(color: Colors.teal), // Border color
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                ),
              ),
              SizedBox(height: 20),
              // Button "Selesaikan Pembayaran"
              ElevatedButton(
                onPressed: () {
                  // Action on button press
                },
                child: Text('Selesaikan Pembayaran'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Background color
                  foregroundColor: Colors.white, // Text color
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
