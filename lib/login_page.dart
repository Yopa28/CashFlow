import 'package:cashflow/sidemenu.dart';
import 'package:flutter/material.dart';
import 'menu_page.dart' as menu;
import 'register_page.dart';
import 'dashboard_page.dart';
import 'keranjang_page.dart';
import 'pesanan_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  bool _isEmailValid = true;
  bool _isPasswordValid = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Email dan password yang sudah ditentukan
  final String _correctEmail = "User@gmail.com"; // Ganti dengan email User
  final String _correctPassword = "User12345!"; // Ganti dengan password User
  final String _adminEmail = "Admin@gmail.com"; // Email Admin
  final String _adminPassword = "Admin12345!"; // Password Admin

  // Fungsi untuk memvalidasi email
  bool _validateEmail(String email) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zAZ0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  // Fungsi untuk memvalidasi password
  bool _validatePassword(String password) {
    final passwordRegExp = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$');
    return passwordRegExp.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Membungkus body dengan SingleChildScrollView
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/cashflow.png',
                width: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'LOGIN',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: const OutlineInputBorder(),
                  errorText: _isEmailValid ? null : 'Format email tidak valid',
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
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  errorText: _isPasswordValid
                      ? null
                      : 'Password tidak sesuai ketentuan',
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                onChanged: (password) {
                  setState(() {
                    _isPasswordValid = _validatePassword(password);
                  });
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value!;
                      });
                    },
                  ),
                  const Text('Ingat saya')
                ],
              ),
              const SizedBox(height: 10),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    key: const ValueKey<int>(1),
                    onPressed: () {
                      // Cek jika email dan password cocok dengan yang sudah ditentukan
                      if (_emailController.text == _correctEmail &&
                          _passwordController.text == _correctPassword) {
                        // Pindah ke MenuPage setelah login berhasil untuk User
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => menu
                                  .MenuPage()), // Arahkan ke MenuPage untuk User
                        );
                      } else if (_emailController.text == _adminEmail &&
                          _passwordController.text == _adminPassword) {
                        // Pindah ke DashboardPage setelah login berhasil untuk Admin
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DashboardPage()), // Arahkan ke DashboardPage untuk Admin
                        );
                      } else {
                        // Tampilkan pesan kesalahan jika email atau password salah
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Email atau password salah!'),
                        ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text('Masuk',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'Belum punya akun? ',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Daftar disini',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
