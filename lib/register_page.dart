import 'package:flutter/material.dart';
import 'success_page.dart'; // Pastikan halaman SuccessPage sudah ada

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controller untuk input teks
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Variabel untuk validasi
  bool _isPasswordValid = false;
  bool _isEmailValid = false;
  bool _isPasswordMatched = true;

  // Fungsi untuk memvalidasi password
  bool _validatePassword(String password) {
    final passwordRegExp = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$',
    );
    return passwordRegExp.hasMatch(password);
  }

  // Fungsi untuk memvalidasi email
  bool _validateEmail(String email) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'DAFTAR',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: const OutlineInputBorder(),
                errorText: _isEmailValid ? null : 'Email tidak valid',
              ),
              onChanged: (email) {
                setState(() {
                  _isEmailValid = _validateEmail(email);
                });
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Kata Sandi',
                border: const OutlineInputBorder(),
                errorText:
                    _isPasswordValid ? null : 'Password tidak sesuai kriteria',
              ),
              onChanged: (password) {
                setState(() {
                  _isPasswordValid = _validatePassword(password);
                });
              },
            ),
            const SizedBox(height: 10),
            Text('Tingkat: ${_isPasswordValid ? "Valid" : "Tidak Valid"}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            const Text('Your password must contain:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('✗ Minimum number of characters is 6.'),
            const Text('✗ Should contain lowercase.'),
            const Text('✗ Should contain uppercase.'),
            const Text('✗ Should contain numbers.'),
            const Text('✗ Should contain special characters.'),
            const SizedBox(height: 10),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Ulangi Kata Sandi',
                border: const OutlineInputBorder(),
                errorText: _isPasswordMatched ? null : 'Password tidak cocok',
              ),
              onChanged: (confirmPassword) {
                setState(() {
                  _isPasswordMatched =
                      confirmPassword == _passwordController.text;
                });
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Validasi sebelum navigasi
                  if (_isEmailValid && _isPasswordValid && _isPasswordMatched) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SuccessPage()),
                    );
                  } else {
                    // Tampilkan alert jika ada yang tidak valid
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text(
                            'Pastikan semua data valid sebelum melanjutkan.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('Daftar', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
