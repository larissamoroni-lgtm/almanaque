import 'package:almanaque/Screens/dossier_03.dart';
import 'package:almanaque/Screens/dossier_reward_screen.dart';
import 'package:flutter/material.dart';

class Dossier02ChallengeScreen extends StatefulWidget {
  const Dossier02ChallengeScreen({super.key});

  @override
  State<Dossier02ChallengeScreen> createState() =>
      _Dossier02ChallengeScreenState();
}

class _Dossier02ChallengeScreenState extends State<Dossier02ChallengeScreen> {
  int? _selectedStatement;
  bool _hasSubmitted = false;
  bool _isCorrect = false;

  // Trecho 2 é o INCORRETO (O erro proposital / sabotagem)
  final int _correctAnomalousIndex = 2;

  final List<Map<String, dynamic>> _statements = [
    {
      'id': 0,
      'text':
          '1. Fica estabelecida a fundação do Colégio de Pedro II (1837), garantindo o ensino de Química, Filosofia, Grego e Latim.',
      'isFalse': false,
    },
    {
      'id': 1,
      'text':
          '2. O Decreto nº 7.247 introduz a primeira experiência pedagógica no RJ com o Método Intuitivo proposto por Rui Barbosa.',
      'isFalse': false,
    },
    {
      'id': 2,
      'text':
          '3. Nas Escolas Primárias de 1º grau, fica permitido ter até 80 alunos por sala sem necessidade de contratar novos professores.',
      'isFalse': true, // ESTE É O ERRO! (O correto seria máx 30 alunos)
    },
    {
      'id': 3,
      'text':
          '4. A Escola Normal focará na formação do Magistério Primário, com cargos de titular por concurso público e tempo de serviço.',
      'isFalse': false,
    },
  ];

  void _verifySelection() {
    if (_selectedStatement == null) return;

    setState(() {
      _hasSubmitted = true;
      _isCorrect = _selectedStatement == _correctAnomalousIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12100E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B1714),
        title: const Text(
          'DESAFIO 02 — PERÍCIA DOCUMENTAL',
          style: TextStyle(
            fontFamily: 'Courier',
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color(0xFFD4AF37),
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CABEÇALHO DA MISSÃO
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A231D),
                  border: Border.all(color: const Color(0xFF8C7A6B)),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.policy, color: Color(0xFFD4AF37), size: 28),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'INSTRUÇÕES: Analise o decreto legislativo abaixo. Um dos artigos foi adulterado com informações históricas falsas. Toque na cláusula FALSA para denunciá-la.',
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

              const SizedBox(height: 20),

              // O DOCUMENTO "OFICIAL"
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F3E9),
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: const Color(0xFFC2B69D), width: 2),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'DECRETO REGULAMENTAR DE 1889\n(EXTRATO DE AUDITORIA)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Courier',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E1A17),
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const Divider(height: 24, thickness: 1, color: Color(0xFF8C7A6B)),

                    // LISTA DE CLÁUSULAS/PARÁGRAFOS
                    ..._statements.map((stmt) {
                      final isSelected = _selectedStatement == stmt['id'];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: InkWell(
                          onTap: _hasSubmitted
                              ? null
                              : () {
                                  setState(() {
                                    _selectedStatement = stmt['id'];
                                  });
                                },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFA82315).withOpacity(0.15)
                                  : Colors.transparent,
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFFA82315)
                                    : Colors.transparent,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  isSelected
                                      ? Icons.warning_amber_rounded
                                      : Icons.check_box_outline_blank,
                                  color: isSelected
                                      ? const Color(0xFFA82315)
                                      : Colors.grey[600],
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    stmt['text'],
                                    style: TextStyle(
                                      fontFamily: 'Courier',
                                      fontSize: 11.5,
                                      height: 1.4,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: isSelected
                                          ? const Color(0xFFA82315)
                                          : const Color(0xFF38302A),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ÁREA DE FEEDBACK / CONCLUSÃO
              if (_hasSubmitted) ...[
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: _isCorrect
                        ? const Color(0xFF1B2E1E)
                        : const Color(0xFF331614),
                    border: Border.all(
                      color: _isCorrect ? Colors.green : Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            _isCorrect ? Icons.verified : Icons.cancel,
                            color: _isCorrect ? Colors.green : Colors.red,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _isCorrect
                                ? 'FRAUDE DETECTADA COM SUCESSO!'
                                : 'ANÁLISE INCORRETA!',
                            style: TextStyle(
                              fontFamily: 'Courier',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: _isCorrect ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _isCorrect
                            ? 'Excelente análise! O Decreto previa o máximo de 30 alunos por turma de 1º grau, devendo contratar mais professores caso excedesse esse número.'
                            : 'Você apontou uma cláusula verdadeira. Lembre-se: As regras estipulavam o limite estrito de 30 alunos no 1º grau.',
                        style: const TextStyle(
                          fontFamily: 'Courier',
                          fontSize: 11,
                          color: Color(0xFFE8DFC8),
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // BOTÃO DE AÇÃO
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
  onPressed: _selectedStatement == null
      ? null
      : () {
          if (!_hasSubmitted) {
            _verifySelection();
          } else {
            if (_isCorrect) {
              // NAVEGA PARA A TELA DE RECOMPENSA COM OS DADOS DO DOSSIÊ 02
              Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => DossierRewardScreen(
      badgeTitle: 'PERITO EM POLÍTICAS PÚBLICAS',
      levelText: 'NÍVEL 02 — CONCEDIDO', 
      buttonText: 'AVANÇAR PARA DOSSIÊ 03 ➔',
      onContinue: () {
        // Redirecionamento para o Dossiê 03 (ou para o Mapa/Menu principal)
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Dossier03Screen(title: '', dossierNumber: '',),
          ),
        );
        
      },
    ),
  ),
);
            } else {
              // Reseta para tentar novamente se errou
              setState(() {
                _hasSubmitted = false;
                _selectedStatement = null;
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
        ? 'EMITIR LAUDO DE PERÍCIA'
        : (_isCorrect ? 'RESGATAR RECOMPENSA ➔' : 'REANALISAR DOCUMENTO ↺'),
    style: const TextStyle(
      fontFamily: 'Courier',
      fontWeight: FontWeight.bold,
      fontSize: 12,
      letterSpacing: 1.2,
    ),
  ),
)
              ),
            ],
          ),
        ),
      ),
    );
  }
}