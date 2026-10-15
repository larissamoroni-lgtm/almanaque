import 'package:almanaque/Screens/dossier_04.dart';
import 'package:flutter/material.dart';
import 'dossier_reward_screen.dart';

class Dossier03ChallengeScreen extends StatefulWidget {
  const Dossier03ChallengeScreen({super.key});

  @override
  State<Dossier03ChallengeScreen> createState() =>
      _Dossier03ChallengeScreenState();
}

class _Dossier03ChallengeScreenState extends State<Dossier03ChallengeScreen> {
  // Lista de eventos embaralhados (Ordem incorreta inicial)
  final List<Map<String, dynamic>> _timelineEvents = [
    {
      'id': '1971',
      'yearLabel': 'DITADURA MILITAR',
      'title': 'LDB nº 5.692/71',
      'description':
          'Inserção de Educação Moral e Cívica (EMC) e formação técnica rápida para trabalhadores.',
      'correctOrder': 2,
    },
    {
      'id': '1893',
      'yearLabel': 'REPÚBLICA VELHA',
      'title': 'Criação dos Grupos Escolares',
      'description':
          'Surgimento das escolas isoladas/reunidas e grupos de 4 salas voltados ao público masculino.',
      'correctOrder': 0,
    },
    {
      'id': '1996',
      'yearLabel': 'BRASIL RECENTE',
      'title': 'LDB Atual nº 9.394/96',
      'description':
          'Estabelecimento da BNCC e garantia constitucional de ensino gratuito e obrigatório.',
      'correctOrder': 3,
    },
    {
      'id': '1942',
      'yearLabel': 'ERA VARGAS',
      'title': 'Criação do SENAI / SENAC',
      'description':
          'Leis Orgânicas dividindo a formação profissional entre Indústria e Comércio.',
      'correctOrder': 1,
    },
  ];

  bool _hasSubmitted = false;
  bool _isCorrect = false;

  void _checkOrder() {
    bool correct = true;
    for (int i = 0; i < _timelineEvents.length; i++) {
      if (_timelineEvents[i]['correctOrder'] != i) {
        correct = false;
        break;
      }
    }

    setState(() {
      _hasSubmitted = true;
      _isCorrect = correct;
    });
  }

  void _onReorder(int oldIndex, int newIndex) {
    if (_hasSubmitted) return; // Trava após submeter

    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final item = _timelineEvents.removeAt(oldIndex);
      _timelineEvents.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12100E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B1714),
        title: const Text(
          'DESAFIO 03 — RECONSTITUIÇÃO TEMPORAL',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // PAINEL DE INSTRUÇÃO
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A231D),
                  border: Border.all(color: const Color(0xFF8C7A6B)),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.unfold_more, color: Color(0xFFD4AF37), size: 26),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'ARQUIVO DESORDENADO: Segure e arraste os eventos para colocá-los em ordem cronológica (do mais antigo para o mais recente).',
                        style: TextStyle(
                          fontFamily: 'Courier',
                          fontSize: 11,
                          color: Color(0xFFE8DFC8),
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // LISTA REORDENÁVEL (DRAG & DROP)
              Expanded(
                child: Theme(
                  data: ThemeData(
                    canvasColor: Colors.transparent,
                  ),
                  child: ReorderableListView.builder(
                    onReorder: _onReorder,
                    itemCount: _timelineEvents.length,
                    itemBuilder: (context, index) {
                      final event = _timelineEvents[index];
                      return Container(
                        key: ValueKey(event['id']),
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F3E9),
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(
                            color: _hasSubmitted
                                ? (event['correctOrder'] == index
                                    ? Colors.green
                                    : Colors.red)
                                : const Color(0xFFC2B69D),
                            width: 1.5,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.drag_handle,
                              color: Color(0xFF8C7A6B),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    event['yearLabel']!,
                                    style: const TextStyle(
                                      fontFamily: 'Courier',
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFA82315),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    event['title']!,
                                    style: const TextStyle(
                                      fontFamily: 'Courier',
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1E1A17),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    event['description']!,
                                    style: const TextStyle(
                                      fontFamily: 'Courier',
                                      fontSize: 10.5,
                                      color: Color(0xFF38302A),
                                      height: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              // FEEDBACK
              if (_hasSubmitted) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: _isCorrect
                        ? const Color(0xFF1B2E1E)
                        : const Color(0xFF331614),
                    border: Border.all(
                      color: _isCorrect ? Colors.green : Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _isCorrect ? Icons.check_circle : Icons.error,
                        color: _isCorrect ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _isCorrect
                              ? 'LINHA DO TEMPO RECONSTITUÍDA! A sequência histórica dos decretos foi validada.'
                              : 'ORDEM INCORRETA! Revise as datas e reorganize os documentos.',
                          style: TextStyle(
                            fontFamily: 'Courier',
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: _isCorrect ? Colors.green[200] : Colors.red[200],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              // BOTÃO
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (!_hasSubmitted) {
                      _checkOrder();
                    } else {
                      if (_isCorrect) {
                        // VAI PARA A RECOMPENSA DO NÍVEL 03
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DossierRewardScreen(
                              badgeTitle: 'ARQUIVISTA HISTÓRICO DA REPÚBLICA',
                              levelText: 'NÍVEL 03 — CONCEDIDO',
                              buttonText: 'AVANÇAR PARA DOSSIÊ 04 ➔',
                              onContinue: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Dossier04Screen(title: '', dossierNumber: '',),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      } else {
                        setState(() {
                          _hasSubmitted = false;
                        });
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  child: Text(
                    !_hasSubmitted
                        ? 'VALIDAR SEQUÊNCIA TEMPORAL'
                        : (_isCorrect ? 'RESGATAR RECOMPENSA ➔' : 'TENTAR REORDENAR ↺'),
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 1.2,
                    ),
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