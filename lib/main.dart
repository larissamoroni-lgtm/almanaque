import 'package:almanaque/Screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AlmanaqueApp());
}

class AlmanaqueApp extends StatelessWidget {
  const AlmanaqueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'O Arquivo Esquecido',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: const Color(0xFFF4EAE1), 
      ),
      home: const SplashScreen(),
    );
  }
}