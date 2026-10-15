import 'package:flutter/material.dart';
import 'dossier_reward_screen.dart';
import 'dossier_06.dart';

class Dossier05ChallengeScreen extends StatefulWidget {
  const Dossier05ChallengeScreen({super.key});

  @override
  State<Dossier05ChallengeScreen> createState() =>
      _Dossier05ChallengeScreenState();
}

class _Dossier05ChallengeScreenState
    extends State<Dossier05ChallengeScreen> {
  int _currentQuestion = 0;
  int _score = 0;
  int? _selectedAnswer;
  bool _answered = false;

  final List<Map<String, dynamic>> _questions = [
    {
      'category': 'ANÁLISE DOCUMENTAL',
      'title': 'O documento desaparecido',
      'story':
          'Você encontrou uma revista antiga no arquivo. '
          'Ela apresenta conselhos sobre comportamento, família '
          'e educação, mas não foi produzida por uma escola.',
      'question':
          'Por que essa revista pode ser importante para a História da Educação?',
      'options': [
        'Porque somente documentos escolares ajudam a estudar a educação.',
        'Porque impressos extraescolares também transmitem valores e comportamentos.',
        'Porque toda revista antiga foi produzida para ensinar conteúdos escolares.',
        'Porque revistas não permitem estudar a sociedade do passado.',
      ],
      'correct': 1,
      'explanation':
          'Correto! Jornais, revistas, livros e outros impressos também '
              'educam informalmente, transmitindo valores, ideias e modelos de comportamento.',
    },
    {
      'category': 'INVESTIGAÇÃO HISTÓRICA',
      'title': 'A fonte não fala sozinha',
      'story':
          'Uma revista de época apresenta um método de ensino como '
          'se ele fosse utilizado por todos os professores. '
          'Você precisa verificar se isso realmente acontecia.',
      'question':
          'Qual deve ser a atitude do pesquisador?',
      'options': [
        'Aceitar tudo o que está escrito como retrato fiel da realidade.',
        'Ignorar a revista e utilizar apenas documentos atuais.',
        'Investigar quem produziu a revista, sua circulação e as práticas reais.',
        'Concluir que todos os professores seguiam as mesmas orientações.',
      ],
      'correct': 2,
      'explanation':
          'Muito bem! Uma fonte precisa ser interrogada. É necessário '
              'considerar sua produção, circulação, finalidade e relação '
              'com as práticas que realmente aconteceram.',
    },
    {
      'category': 'CULTURA ESCRITA',
      'title': 'O impresso misterioso',
      'story':
          'No acervo, você encontra manuscritos, jornais impressos, '
          'livros em braile e publicações digitais de épocas diferentes.',
      'question':
          'O que esses materiais permitem investigar?',
      'options': [
        'Apenas a evolução dos equipamentos de impressão.',
        'Somente os conteúdos ensinados dentro das salas de aula.',
        'Apenas os hábitos de leitura das pessoas alfabetizadas.',
        'Os usos da escrita, as formas de leitura e as relações sociais em diferentes contextos.',
      ],
      'correct': 3,
      'explanation':
          'Exatamente! A cultura escrita abrange diferentes suportes e '
              'formas de utilização. Seus significados variam conforme '
              'a época, o grupo social, o gênero e as relações de poder.',
    },
    {
      'category': 'RELAÇÕES DE GÊNERO',
      'title': 'Os registros das professoras',
      'story':
          'Você encontra registros de uma revista educacional que '
          'destacava professoras em aulas modelo, enquanto homens '
          'apareciam em discussões teóricas e organizacionais.',
      'question':
          'Qual análise histórica é mais adequada?',
      'options': [
        'Investigar como os papéis de gênero influenciavam a representação '
            'e a atuação de professoras e professores.',
        'Concluir que as mulheres não participavam da produção do conhecimento.',
        'Considerar que essa divisão era natural e não precisa ser investigada.',
        'Ignorar os nomes dos envolvidos, pois eles não têm importância histórica.',
      ],
      'correct': 0,
      'explanation':
          'Correto! As fontes podem revelar desigualdades e expectativas '
              'sociais relacionadas ao gênero. O pesquisador deve analisar '
              'como esses papéis eram construídos e representados.',
    },
    {
      'category': 'DESAFIO FINAL',
      'title': 'A verdade por trás das páginas',
      'story':
          'Você precisa escrever o relatório final do arquivo. '
          'O documento apresenta regras de leitura e comportamento, '
          'mas você não encontrou evidências de como as pessoas '
          'realmente utilizavam os impressos.',
      'question':
          'Qual conclusão respeita os limites da fonte histórica?',
      'options': [
        'As regras comprovam que todas as pessoas agiam exatamente como previsto.',
        'As regras devem ser analisadas separadamente das práticas reais de leitura.',
        'A ausência de registros comprova que ninguém lia esses materiais.',
        'As normas escritas não possuem valor para a História da Educação.',
      ],
      'correct': 1,
      'explanation':
          'Missão cumprida! As normas apresentadas nos impressos não são '
              'necessariamente iguais às práticas reais. O historiador '
              'precisa distinguir os discursos das experiências concretas.',
    },
  ];

  void _selectAnswer(int index) {
    if (_answered) return;

    setState(() {
      _selectedAnswer = index;
      _answered = true;

      if (index == _questions[_currentQuestion]['correct']) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
        _selectedAnswer = null;
        _answered = false;
      });
    } else {
      _finishChallenge();
    }
  }

  void _finishChallenge() {
    final navigator = Navigator.of(context);

    navigator.pushReplacement(
      MaterialPageRoute(
        builder: (_) => DossierRewardScreen(
          badgeTitle: 'PERITA DA CULTURA ESCRITA',
          levelText: _score == _questions.length
              ? 'INVESTIGAÇÃO PERFEITA'
              : _score >= 3
                  ? 'INVESTIGAÇÃO CONCLUÍDA'
                  : 'ARQUIVO EXAMINADO',
          buttonText: 'ACESSAR DOSSIÊ Nº 06',
          onContinue: () {
            navigator.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => const Dossier06Screen(
                  title: 'DOSSIÊ Nº 06',
                  dossierNumber: '06',
                ),
              ),
              (route) => route.isFirst,
            );
          },
        ),
      ),
    );
  }

  Color _optionColor(int index) {
    if (!_answered) {
      return const Color(0xFFFAF6EE);
    }

    if (index == _questions[_currentQuestion]['correct']) {
      return const Color(0xFFDCE8D5);
    }

    if (index == _selectedAnswer) {
      return const Color(0xFFF0D9D2);
    }

    return const Color(0xFFFAF6EE);
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestion];
    final options = question['options'] as List<String>;
    final correctAnswer = question['correct'] as int;

    return Scaffold(
      backgroundColor: const Color(0xFF12100E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF12100E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'PERÍCIA DOCUMENTAL — 05',
          style: TextStyle(
            fontFamily: 'Courier',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Color(0xFFD4AF37),
            fontSize: 14,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/madeira.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black45,
              BlendMode.darken,
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // CABEÇALHO DO DESAFIO
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8DFC8),
                        border: Border.all(
                          color: const Color(0xFFD4AF37),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ARQUIVO CONFIDENCIAL',
                            style: TextStyle(
                              fontFamily: 'Courier',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFA82315),
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'O MISTÉRIO DAS PÁGINAS PERDIDAS',
                            style: TextStyle(
                              fontFamily: 'Courier',
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2C241D),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Investigue os registros, examine as evidências '
                            'e descubra o que os impressos revelam sobre '
                            'a História da Educação.',
                            style: TextStyle(
                              fontFamily: 'Courier',
                              fontSize: 12,
                              height: 1.5,
                              color: Color(0xFF4A3A2A),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ETAPA ${_currentQuestion + 1}/'
                                '${_questions.length}',
                                style: const TextStyle(
                                  fontFamily: 'Courier',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: Color(0xFF382E25),
                                ),
                              ),
                              Text(
                                'ACERTOS: $_score',
                                style: const TextStyle(
                                  fontFamily: 'Courier',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: Color(0xFF382E25),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: LinearProgressIndicator(
                              value: (_currentQuestion + 1) /
                                  _questions.length,
                              minHeight: 7,
                              backgroundColor:
                                  const Color(0xFFC2B69D),
                              valueColor:
                                  const AlwaysStoppedAnimation<Color>(
                                Color(0xFF8C6D1F),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // DOCUMENTO DA ETAPA
                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F3E9),
                        border: Border.all(
                          color: const Color(0xFFC2B69D),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(3, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.folder_special,
                                color: Color(0xFF8C7A6B),
                                size: 22,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  question['category'] as String,
                                  style: const TextStyle(
                                    fontFamily: 'Courier',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF8C7A6B),
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            height: 24,
                            color: Color(0xFFD4AF37),
                          ),
                          Text(
                            question['title'] as String,
                            style: const TextStyle(
                              fontFamily: 'Courier',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF2C241D),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Color(0xFFEDE5D5),
                              border: Border(
                                left: BorderSide(
                                  color: Color(0xFF8C7A6B),
                                  width: 3,
                                ),
                              ),
                            ),
                            child: Text(
                              question['story'] as String,
                              style: const TextStyle(
                                fontFamily: 'Courier',
                                fontSize: 12,
                                height: 1.6,
                                color: Color(0xFF38302A),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'QUESTÃO DE INVESTIGAÇÃO:',
                            style: TextStyle(
                              fontFamily: 'Courier',
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Color(0xFFA82315),
                              letterSpacing: 0.7,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            question['question'] as String,
                            style: const TextStyle(
                              fontFamily: 'Courier',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              height: 1.5,
                              color: Color(0xFF1E1A17),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // ALTERNATIVAS
                          ...List.generate(options.length, (index) {
                            final isCorrect =
                                index == correctAnswer;
                            final isSelected =
                                index == _selectedAnswer;

                            return Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10),
                              child: InkWell(
                                onTap: () => _selectAnswer(index),
                                child: AnimatedContainer(
                                  duration: const Duration(
                                    milliseconds: 200,
                                  ),
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: _optionColor(index),
                                    border: Border.all(
                                      color: _answered && isCorrect
                                          ? const Color(0xFF507449)
                                          : _answered && isSelected
                                              ? const Color(0xFFA82315)
                                              : const Color(0xFFC2B69D),
                                      width: 1.3,
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 27,
                                        height: 27,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(
                                              0xFF8C7A6B,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          String.fromCharCode(65 + index),
                                          style: const TextStyle(
                                            fontFamily: 'Courier',
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF382E25),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(
                                            top: 4,
                                          ),
                                          child: Text(
                                            options[index],
                                            style: const TextStyle(
                                              fontFamily: 'Courier',
                                              fontSize: 11,
                                              height: 1.5,
                                              color: Color(0xFF38302A),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (_answered && isCorrect)
                                        const Icon(
                                          Icons.check_circle,
                                          color: Color(0xFF507449),
                                          size: 20,
                                        ),
                                      if (_answered &&
                                          isSelected &&
                                          !isCorrect)
                                        const Icon(
                                          Icons.cancel,
                                          color: Color(0xFFA82315),
                                          size: 20,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),

                          // FEEDBACK
                          if (_answered) ...[
                            const SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: _selectedAnswer == correctAnswer
                                    ? const Color(0xFFE5EBDD)
                                    : const Color(0xFFF2E0DA),
                                border: Border.all(
                                  color:
                                      _selectedAnswer == correctAnswer
                                          ? const Color(0xFF507449)
                                          : const Color(0xFFA82315),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _selectedAnswer == correctAnswer
                                        ? 'EVIDÊNCIA CONFIRMADA'
                                        : 'PISTA PARA A INVESTIGAÇÃO',
                                    style: TextStyle(
                                      fontFamily: 'Courier',
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: _selectedAnswer ==
                                              correctAnswer
                                          ? const Color(0xFF36562F)
                                          : const Color(0xFFA82315),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    question['explanation'] as String,
                                    style: const TextStyle(
                                      fontFamily: 'Courier',
                                      fontSize: 11,
                                      height: 1.6,
                                      color: Color(0xFF38302A),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'ARQUIVO 6672 • SETOR DE INVESTIGAÇÃO HISTÓRICA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 9,
                        letterSpacing: 0.6,
                        color: Color(0xFFE8DFC8),
                      ),
                    ),
                  ],
                ),
              ),

              // BOTÃO INFERIOR
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: _answered ? _nextQuestion : null,
                    icon: Icon(
                      _currentQuestion == _questions.length - 1
                          ? Icons.workspace_premium
                          : Icons.arrow_forward,
                    ),
                    label: Text(
                      _currentQuestion == _questions.length - 1
                          ? 'FINALIZAR INVESTIGAÇÃO'
                          : 'PRÓXIMA EVIDÊNCIA',
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 0.5,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4AF37),
                      foregroundColor: const Color(0xFF1E1A17),
                      disabledBackgroundColor:
                          const Color(0xFF655B45),
                      disabledForegroundColor:
                          const Color(0xFFC2B69D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
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