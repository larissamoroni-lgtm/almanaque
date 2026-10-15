import 'package:almanaque/Screens/dossier_02.dart';
import 'package:almanaque/Screens/dossier_reward_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Dossier01ChallengeScreen extends StatefulWidget {
  const Dossier01ChallengeScreen({super.key});

  @override
  State<Dossier01ChallengeScreen> createState() =>
      _Dossier01ChallengeScreenState();
}

class _Dossier01ChallengeScreenState extends State<Dossier01ChallengeScreen> {
  int? _selectedIndex;
  bool _submitted = false;
  bool _isCorrect = false;

  // Player de áudio dedicado para o carimbo
  final AudioPlayer _stampPlayer = AudioPlayer();

  // O índice 1 representa a tese da Escola dos Annales (Correta)
  final int _correctIndex = 1;

  final List<Map<String, String>> _evidenceCards = [
    {
      'code': 'FONTE A-101',
      'concept': 'HISTORIOGRAFIA TRADICIONAL',
      'text':
          'Afirma que a História é feita apenas por grandes reis, generais e documentos oficiais do Estado.',
    },
    {
      'code': 'FONTE B-202',
      'concept': 'ESCOLA DOS ANNALES',
      'text':
          'Ampliou o conceito de fonte histórica, incorporando a vida cotidiana, mentalidades e vestígios não escritos.',
    },
    {
      'code': 'FONTE C-303',
      'concept': 'NEGACIONISMO HISTÓRICO',
      'text':
          'Trata o negacionismo e a falsificação deliberada de fatos como um método válido de revisão historiográfica.',
    },
    {
      'code': 'FONTE D-404',
      'concept': 'PAIDAGÔGOS GRÉCIA ANTIGA',
      'text':
          'Sustenta que o termo Paidagôgos era o título de honra concedido exclusivamente aos grandes filósofos da polis.',
    },
  ];

  void _verifySource(int index) async {
    if (_submitted) return;

    // Toca apenas o som do carimbo
    try {
      await _stampPlayer.stop();
      await _stampPlayer.play(AssetSource('audio/carimbo_impacto.mp3'));
    } catch (e) {
      debugPrint('Erro ao tocar som do carimbo: $e');
    }

    // Atualiza o estado da tela com a escolha
    setState(() {
      _selectedIndex = index;
      _submitted = true;
      _isCorrect = index == _correctIndex;
    });
  }

  void _proceedToDossier02() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DossierRewardScreen(
          badgeTitle: 'INVESTIGADOR JÚNIOR',
          levelText: 'NÍVEL 01 — CONCEDIDO',
          buttonText: 'AVANÇAR PARA DOSSIÊ 02 ➔',
          onContinue: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Dossier02Screen(title: '', dossierNumber: '',),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _stampPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12100E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B1714),
        elevation: 0,
        title: const Text(
          'INSPEÇÃO DE FONTES — DOSSIÊ 01',
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
              // PAINEL DE INSTRUÇÃO DO DETETIVE
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2420),
                  border: Border.all(color: const Color(0xFF8C7A6B)),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.saved_search, color: Color(0xFFD4AF37), size: 28),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'MISSÃO: Analise as 4 evidências recolhidas. Apenas UMA representa a virada historiográfica das fontes. Toque no cartão para periciar.',
                        style: TextStyle(
                          fontFamily: 'Courier',
                          color: Color(0xFFE8DFC8),
                          fontSize: 10.5,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // LISTA DE CARTÕES COM TEXTURA DE PAPEL
              Expanded(
                child: ListView.builder(
                  itemCount: _evidenceCards.length,
                  itemBuilder: (context, index) {
                    final card = _evidenceCards[index];
                    final isSelected = _selectedIndex == index;

                    Color borderColor = const Color(0xFF4A3E35);
                    if (_submitted && isSelected) {
                      borderColor = _isCorrect ? Colors.green : Colors.red;
                    }

                    return GestureDetector(
                      onTap: () => _verifySource(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          // FUNDO DE PAPEL ENVELHECIDO
                          image: const DecorationImage(
                            image: AssetImage('assets/images/papel_envelhecido.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: borderColor,
                            width: isSelected ? 2.0 : 1.2,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      card['code']!,
                                      style: const TextStyle(
                                        fontFamily: 'Courier',
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF5A4A3A),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF2A231D),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Text(
                                        card['concept']!,
                                        style: const TextStyle(
                                          fontFamily: 'Courier',
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFD4AF37),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  card['text']!,
                                  style: const TextStyle(
                                    fontFamily: 'Courier',
                                    fontSize: 11.5,
                                    color: Color(0xFF2C241D),
                                    fontWeight: FontWeight.w600,
                                    height: 1.35,
                                  ),
                                ),
                              ],
                            ),

                            // CARIMBO APARECENDO APÓS A PERÍCIA
                            if (_submitted && isSelected)
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 300),
                                    opacity: 0.9,
                                    child: Image.asset(
                                      _isCorrect
                                          ? 'assets/images/carimbo_aprovado.png'
                                          : 'assets/images/carimbo_falso.png',
                                      width: 110,
                                      height: 55,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // BARRAS DE AÇÃO FINAL
              if (_submitted)
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _isCorrect
                        ? _proceedToDossier02
                        : () => setState(() => _submitted = false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4AF37),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: Text(
                      _isCorrect
                          ? 'RESGATAR RECOMPENSA ➔'
                          : 'REINICIAR ANÁLISE DE FONTES ↺',
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontWeight: FontWeight.bold,
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