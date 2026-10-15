import 'dart:async';
import 'package:flutter/material.dart';
import 'identification_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Animação para dar o efeito de "carimbo" aparecendo
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _controller.forward();

    // Timer de 3 segundos para mudar de tela automaticamente
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const IdentificationScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A), // Fundo escuro tom de arquivo
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ícone ou símbolo do acervo
              const Icon(
                Icons.folder_special_outlined,
                size: 80,
                color: Color(0xFFD4AF37), // Tom dourado vintage
              ),
              const SizedBox(height: 24),
              
              // Título Principal
              const Text(
                'O ARQUIVO ESQUECIDO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  fontFamily: 'Courier', // Fonte estilo máquina de escrever
                ),
              ),
              const SizedBox(height: 8),
              
              const Text(
                'História da Educação II — UFSCar',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 40),

              // Carimbo Animado "ACESSO RESTRITO"
              ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red.shade700, width: 3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'ACESSO RESTRITO',
                    style: TextStyle(
                      color: Colors.red.shade700,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),

              // Indicador discreto de carregamento
              const CircularProgressIndicator(
                color: Color(0xFFD4AF37),
                strokeWidth: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}