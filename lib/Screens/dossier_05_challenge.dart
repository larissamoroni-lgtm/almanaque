import 'package:flutter/material.dart';

class Dossier05ChallengeScreen extends StatelessWidget {
  const Dossier05ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio 05'),
      ),
      body: const Center(
        child: Text(
          'Tela de Teste - Desafio 05',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}