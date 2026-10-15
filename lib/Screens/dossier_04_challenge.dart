import 'package:almanaque/Screens/cabinet_screen.dart';
import 'package:flutter/material.dart';
import 'dossier_reward_screen.dart';

class Dossier04ChallengeScreen extends StatefulWidget {
  const Dossier04ChallengeScreen({super.key});

  @override
  State<Dossier04ChallengeScreen> createState() =>
      _Dossier04ChallengeScreenState();
}

class _Dossier04ChallengeScreenState extends State<Dossier04ChallengeScreen> {
  // Lista de evidências do cotidiano escolar para classificar
  final List<Map<String, dynamic>> _evidenceCards = [
    {
      'title': 'Manual do Professor de 1950',
      'description': 'Livro oficial emitido pelo Ministério detalhando as normas estritas de disciplina.',
      'category': 'PRESCRITA', // Esquerda
    },
    {
      'title': 'Adaptação na Sala de Aula',
      'description': 'Professores e alunos redefinem a rotina para adaptar a matéria difícil ao cotidiano.',
      'category': 'PRATICADA', // Direita
    },
    {
      'title': 'Decreto de Distribuição de Carteiras',
      'description': 'Regulamento governamental que padroniza o mobiliário das escolas públicas.',
      'category': 'PRESCRITA',
    },
    {
      'title': 'Uso Criativo do Pátio',
      'description': 'Alunos utilizando o espaço do jardim para criar jogos e trocas culturais no intervalo.',
      'category': 'PRATICADA',
    },
  ];

  int _currentIndex = 0;
  int _score = 0;
  bool _isGameOver = false;

  void _handleSwipe(String direction) {
    final currentCard = _evidenceCards[_currentIndex];
    final bool isPrescrita = direction == 'LEFT';
    final bool isPraticada = direction == 'RIGHT';

    bool correct = false;
    if (isPrescrita && currentCard['category'] == 'PRESCRITA') correct = true;
    if (isPraticada && currentCard['category'] == 'PRATICADA') correct = true;

    if (correct) _score++;

    setState(() {
      if (_currentIndex < _evidenceCards.length - 1) {
        _currentIndex++;
      } else {
        _isGameOver = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12100E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B1714),
        title: const Text(
          'DESAFIO 04 — INSPEÇÃO DE ARQUIVO',
          style: TextStyle(
            fontFamily: 'Courier',
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFFD4AF37),
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _isGameOver
              ? _buildResultView()
              : Column(
                  children: [
                    // INSTRUÇÃO DA MISSÃO
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A231D),
                        border: Border.all(color: const Color(0xFF8C7A6B)),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.swipe, color: Color(0xFFD4AF37), size: 28),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'CLASSIFIQUE A EVIDÊNCIA:\n⬅ Arraste para a Esquerda: CULTURA PRESCRITA (Leis/Regras)\n➡ Arraste para a Direita: CULTURA PRATICADA (Dia a dia/Prática)',
                              style: TextStyle(
                                fontFamily: 'Courier',
                                fontSize: 10.5,
                                color: Color(0xFFE8DFC8),
                                height: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // CARTÃO DE EVIDÊNCIA COM SWIPE (DISMISSIBLE)
                    Expanded(
                      child: Center(
                        child: Dismissible(
                          key: ValueKey(_currentIndex),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.endToStart) {
                              _handleSwipe('LEFT');
                            } else {
                              _handleSwipe('RIGHT');
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 320,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7F3E9),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: const Color(0xFFD4AF37),
                                width: 2,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 12,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_special,
                                  size: 48,
                                  color: Color(0xFFA82315),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  _evidenceCards[_currentIndex]['title'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: 'Courier',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1E1A17),
                                  ),
                                ),
                                const Divider(height: 24, color: Color(0xFF8C7A6B)),
                                Text(
                                  _evidenceCards[_currentIndex]['description'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: 'Courier',
                                    fontSize: 12,
                                    color: Color(0xFF38302A),
                                    height: 1.4,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  '◄ Arraste para classificar ►',
                                  style: TextStyle(
                                    fontFamily: 'Courier',
                                    fontSize: 10,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0xFF8C7A6B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // BOTÕES MANUAIS ALTERNATIVOS
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => _handleSwipe('LEFT'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF382E25),
                              foregroundColor: const Color(0xFFE8DFC8),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text(
                              '⬅ PRESCRITA',
                              style: TextStyle(fontFamily: 'Courier', fontSize: 11),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => _handleSwipe('RIGHT'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFA82315),
                              foregroundColor: const Color(0xFFF7F3E9),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text(
                              'PRATICADA ➡',
                              style: TextStyle(fontFamily: 'Courier', fontSize: 11),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  // TELA DE CONCLUÍDO
  Widget _buildResultView() {
    final bool passed = _score >= 3;
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1A17),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFFD4AF37)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              passed ? Icons.verified : Icons.error_outline,
              size: 50,
              color: passed ? Colors.green : Colors.red,
            ),
            const SizedBox(height: 12),
            Text(
              passed ? 'INSPEÇÃO CONCLUÍDA COM SUCESSO!' : 'MUITOS ERROS DE PERÍCIA!',
              style: TextStyle(
                fontFamily: 'Courier',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: passed ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Você acertou $_score de ${_evidenceCards.length} evidências da cultura escolar.',
              style: const TextStyle(
                fontFamily: 'Courier',
                fontSize: 11,
                color: Color(0xFFE8DFC8),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (passed) {
                  // VAI PARA A RECOMPENSA DE NÍVEL 04
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DossierRewardScreen(
                        badgeTitle: 'ESPECIALISTA EM CULTURA ESCOLAR',
                        levelText: 'NÍVEL 04 — CONCEDIDO',
                        buttonText: 'CONCLUIR MÓDULO ➔',
                        onContinue: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CabinetScreen(unlockedUpTo: 4),
                              ),
                                );
                        },
                      ),
                    ),
                  );
                } else {
                  setState(() {
                    _currentIndex = 0;
                    _score = 0;
                    _isGameOver = false;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD4AF37),
                foregroundColor: Colors.black,
              ),
              child: Text(
                passed ? 'RESGATAR RECOMPENSA ➔' : 'REINICIAR INSPEÇÃO ↺',
                style: const TextStyle(
                  fontFamily: 'Courier',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}