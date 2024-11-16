import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart'; // Pastikan library ini diimpor
import 'package:bunnies_store_mobile/screens/login.dart';
import 'package:bunnies_store_mobile/screens/register.dart';
import 'package:bunnies_store_mobile/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CookieRequest>(
          create: (_) => CookieRequest(),
        ),
      ],
      child: MaterialApp(
        title: '🐰 bunnies store 🐰',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.pink,
          ).copyWith(
            primary: const Color(0xFFEFB2CC),
            secondary: const Color(0xFFDBC3E6),
          ),
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(), // Tambahkan route untuk halaman register
          '/menu': (context) => MyHomePage(),
        },
        home: const LoginPage(), // Login Page sebagai halaman pertama
      ),
    );
  }
}
