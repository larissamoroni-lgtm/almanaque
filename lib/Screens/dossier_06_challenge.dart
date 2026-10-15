import 'package:flutter/material.dart';
import 'package:almanaque/Screens/dossier_reward_screen.dart';

class Dossier06ChallengeScreen extends StatefulWidget {
  const Dossier06ChallengeScreen({super.key});

  @override
  State<Dossier06ChallengeScreen> createState() =>
      _Dossier06ChallengeScreenState();
}

class _Dossier06ChallengeScreenState
    extends State<Dossier06ChallengeScreen> {
  final Color _gold = const Color(0xFFD4AF37);
  final Color _paper = const Color(0xFFF7F3E9);
  final Color _ink = const Color(0xFF382E25);

  late List<Map<String, String>> _events;

  bool _checked = false;
  bool _completed = false;
  int _attempts = 0;

  final List<Map<String, String>> _correctTimeline = [
    {
      'id': '1827',
      'date': '1827',
      'title': 'Lei de 1827',
      'description':
          'Estabelecimento de escolas de primeiras letras e previsão do ensino mútuo.',
    },
    {
      'id': '1834',
      'date': '1834',
      'title': 'Reformas provinciais',
      'description':
          'A descentralização atribui às províncias a responsabilidade pelo ensino primário.',
    },
    {
      'id': '1835',
      'date': '1835',
      'title': 'Primeira Escola Normal',
      'description':
          'Criação da Escola Normal na província do Rio de Janeiro.',
    },
    {
      'id': '1879',
      'date': '1879',
      'title': 'Reforma Leôncio de Carvalho',
      'description':
          'Propostas de mudanças no ensino e ampliação dos conteúdos educacionais.',
    },
    {
      'id': '1890',
      'date': '1890',
      'title': 'Reforma Caetano de Campos',
      'description':
          'O modelo paulista torna-se uma referência para a organização do ensino.',
    },
    {
      'id': '1930',
      'date': 'Década de 1930',
      'title': 'Institutos de Educação',
      'description':
          'Mudanças na preparação docente e maior valorização da formação profissional.',
    },
    {
      'id': '1946',
      'date': '1946',
      'title': 'Lei Orgânica do Ensino Normal',
      'description':
          'Organização da formação de professores em dois ciclos.',
    },
    {
      'id': '1971',
      'date': '1971',
      'title': 'Lei nº 5.692',
      'description':
          'A formação docente passa a ser organizada como Habilitação Específica para o Magistério.',
    },
    {
      'id': '1980',
      'date': 'Década de 1980',
      'title': 'Revitalização da formação docente',
      'description':
          'Os CEFAMs valorizam a formação integral, a pesquisa e a prática docente.',
    },
    {
      'id': '1996',
      'date': '1996',
      'title': 'Lei de Diretrizes e Bases',
      'description':
          'A LDB estabelece a formação em nível superior como referência para a docência na educação básica.',
    },
  ];

  @override
  void initState() {
    super.initState();

    // A ordem inicial está embaralhada de propósito.
    _events = [
      _correctTimeline[4],
      _correctTimeline[0],
      _correctTimeline[6],
      _correctTimeline[2],
      _correctTimeline[9],
      _correctTimeline[3],
      _correctTimeline[7],
      _correctTimeline[1],
      _correctTimeline[8],
      _correctTimeline[5],
    ].map((event) => Map<String, String>.from(event)).toList();
  }

  void _reorderEvents(int oldIndex, int newIndex) {
    if (_checked || _completed) return;

    setState(() {
      if (newIndex > oldIndex) newIndex--;

      final event = _events.removeAt(oldIndex);
      _events.insert(newIndex, event);
    });
  }

  void _checkTimeline() {
    final isCorrect = List.generate(
      _events.length,
      (index) => _events[index]['id'] ==
          _correctTimeline[index]['id'],
    ).every((value) => value);

    setState(() {
      _attempts++;
      _checked = true;
      _completed = isCorrect;
    });
  }

  void _tryAgain() {
    setState(() {
      _checked = false;
    });
  }

  void _finishChallenge() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DossierRewardScreen(
          badgeTitle: 'MESTRE DA HISTÓRIA DOCENTE',
          levelText: _attempts == 1
              ? 'LINHA DO TEMPO PERFEITA'
              : 'CRONOLOGIA RECONSTRUÍDA',
          buttonText: 'VOLTAR AO DOSSIÊ Nº 06',
          onContinue: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: _paper,
        border: Border.all(color: _gold, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 8,
            offset: const Offset(3, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ARQUIVO HISTÓRICO // DESAFIO 06',
            style: TextStyle(
              fontFamily: 'Courier',
              fontWeight: FontWeight.bold,
              fontSize: 11,
              letterSpacing: 1.2,
              color: _ink,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'RECONSTRUA A HISTÓRIA',
            style: TextStyle(
              fontFamily: 'Courier',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: _ink,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'A história da formação de professores foi '
            'marcada por leis, reformas e mudanças nas '
            'instituições de ensino. Mas os registros foram '
            'encontrados fora de ordem!',
            style: TextStyle(
              fontFamily: 'Courier',
              fontSize: 12,
              height: 1.5,
              color: _ink,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(10),
            color: const Color(0xFFE8DFC8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.touch_app, color: _ink, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Segure um cartão e arraste-o para a posição '
                    'correta. Organize os acontecimentos do mais '
                    'antigo ao mais recente.',
                    style: TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 11,
                      height: 1.4,
                      color: _ink,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(
    Map<String, String> event,
    int index,
  ) {
    final correctId = _correctTimeline[index]['id'];
    final isCorrectPosition = _checked &&
        event['id'] == correctId;

    final isWrongPosition = _checked &&
        event['id'] != correctId;

    Color borderColor = const Color(0xFFC2B69D);

    if (isCorrectPosition) {
      borderColor = const Color(0xFF39804A);
    } else if (isWrongPosition) {
      borderColor = const Color(0xFFA82315);
    }

    return Container(
      key: ValueKey(event['id']),
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: _paper,
        border: Border.all(
          color: borderColor,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 18),
            color: _ink,
            child: Text(
              '${index + 1}'.padLeft(2, '0'),
              style: TextStyle(
                fontFamily: 'Courier',
                fontWeight: FontWeight.bold,
                color: _gold,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event['date']!,
                    style: TextStyle(
                      fontFamily: 'Courier',
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: _checked
                          ? (isCorrectPosition
                              ? const Color(0xFF39804A)
                              : const Color(0xFFA82315))
                          : const Color(0xFF8C7A6B),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    event['title']!,
                    style: TextStyle(
                      fontFamily: 'Courier',
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: _ink,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    event['description']!,
                    style: TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 10,
                      height: 1.4,
                      color: _ink,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_checked)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                isCorrectPosition
                    ? Icons.check_circle
                    : Icons.cancel,
                color: isCorrectPosition
                    ? const Color(0xFF39804A)
                    : const Color(0xFFA82315),
                size: 20,
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.drag_handle,
                color: _ink.withOpacity(0.7),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFeedback() {
    final allCorrect = _completed;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: allCorrect
            ? const Color(0xFFE0EBDD)
            : const Color(0xFFF4DFD9),
        border: Border.all(
          color: allCorrect
              ? const Color(0xFF39804A)
              : const Color(0xFFA82315),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            allCorrect
                ? 'ARQUIVO RECONSTRUÍDO!'
                : 'AINDA HÁ DOCUMENTOS FORA DE ORDEM',
            style: TextStyle(
              fontFamily: 'Courier',
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: allCorrect
                  ? const Color(0xFF285B35)
                  : const Color(0xFFA82315),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            allCorrect
                ? 'Excelente! Você organizou os acontecimentos '
                    'em ordem cronológica e reconstruiu a linha '
                    'do tempo da formação docente.'
                : 'Os cartões com o símbolo vermelho estão na '
                    'posição errada. Compare as datas, reorganize '
                    'os documentos e tente novamente.',
            style: TextStyle(
              fontFamily: 'Courier',
              fontSize: 11,
              height: 1.5,
              color: _ink,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12100E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF12100E),
        elevation: 0,
        iconTheme: IconThemeData(color: _gold),
        title: Text(
          'DESAFIO Nº 06',
          style: TextStyle(
            fontFamily: 'Courier',
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: _gold,
            fontSize: 15,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                child: _buildHeader(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'DOCUMENTOS: ${_events.length}',
                      style: TextStyle(
                        fontFamily: 'Courier',
                        fontWeight: FontWeight.bold,
                        color: _paper,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      'TENTATIVAS: $_attempts',
                      style: TextStyle(
                        fontFamily: 'Courier',
                        fontWeight: FontWeight.bold,
                        color: _gold,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReorderableListView.builder(
                  padding: const EdgeInsets.only(
                    top: 4,
                    bottom: 12,
                  ),
                  buildDefaultDragHandles: false,
                  itemCount: _events.length,
                  onReorder: _reorderEvents,
                  itemBuilder: (context, index) {
                    final event = _events[index];

                    return ReorderableDragStartListener(
                      key: ValueKey(event['id']),
                      index: index,
                      enabled: !_checked && !_completed,
                      child: _buildEventCard(event, index),
                    );
                  },
                ),
              ),
              if (_checked) _buildFeedback(),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _completed
                        ? _finishChallenge
                        : _checked
                            ? _tryAgain
                            : _checkTimeline,
                    icon: Icon(
                      _completed
                          ? Icons.workspace_premium
                          : _checked
                              ? Icons.refresh
                              : Icons.fact_check,
                    ),
                    label: Text(
                      _completed
                          ? 'RECEBER RECOMPENSA'
                          : _checked
                              ? 'REORGANIZAR DOCUMENTOS'
                              : 'VALIDAR LINHA DO TEMPO',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        letterSpacing: 0.5,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _gold,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 8,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
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