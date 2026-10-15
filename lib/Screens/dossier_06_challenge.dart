import 'package:flutter/material.dart';

class Dossier06ChallengeScreen extends StatelessWidget {
  const Dossier06ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio 06'),
      ),
      body: const Center(
        child: Text(
          'Tela de Teste - Desafio 06',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}