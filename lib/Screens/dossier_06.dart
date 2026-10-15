import 'package:flutter/material.dart';
import 'package:almanaque/Screens/dossier_06_challenge.dart';
import 'cabinet_screen.dart';

class Dossier06Screen extends StatefulWidget {
  const Dossier06Screen({
    super.key,
    required String title,
    required String dossierNumber,
  });

  @override
  State<Dossier06Screen> createState() => _Dossier06ScreenState();
}

class _Dossier06ScreenState extends State<Dossier06Screen> {
  late final List<Map<String, String>> _documents;

  @override
  void initState() {
    super.initState();

    _documents = [
      {
        'section': 'AULA 06: HISTÓRIA DA FORMAÇÃO DE PROFESSORES',
        'docNumber': 'DOC. 06/A',
        'title': '1. Século XIX: Primeiras Tentativas e Reformas',
        'content':
            '• Marcos Iniciais: Alvará de 1772 (exames em Portugal) e Lei de 1827 (exames públicos e ensino mútuo, método Lancaster).\n\n'
            '• Reformas de 1834: Descentralização — as províncias assumem a responsabilidade pelo ensino primário.\n\n'
            '• Primeira Escola Normal: Criada no Rio de Janeiro, em 1835. Possuía currículo rudimentar, baixa frequência e enfrentava fechamentos constantes devido à falta de professores e aos baixos salários.',
      },
      {
        'section': 'AULA 06: HISTÓRIA DA FORMAÇÃO DE PROFESSORES',
        'docNumber': 'DOC. 06/B',
        'title': '2. Primeira República e o Modelo de São Paulo',
        'content':
            '• Modelo Paulista: A Reforma Caetano de Campos, de 1890, tornou-se referência para a organização do ensino.\n\n'
            '• Constituição de 1891: Manteve a descentralização, deixando aos estados a responsabilidade pela instrução primária.\n\n'
            '• Reformas Educacionais: Destacaram-se iniciativas no Distrito Federal e em São Paulo, associadas a educadores como Anísio Teixeira e Fernando de Azevedo, além da aproximação entre a formação docente e as universidades.',
      },
      {
        'section': 'AULA 06: HISTÓRIA DA FORMAÇÃO DE PROFESSORES',
        'docNumber': 'DOC. 06/C',
        'title': '3. Escolanovismo e Feminização do Magistério',
        'content':
            '• Escolanovismo: Ganhou força no início do século XX, criticando o ensino tradicional e valorizando métodos ativos e a psicologia do desenvolvimento.\n\n'
            '• Feminização do Magistério: A entrada das mulheres na profissão foi associada ao papel materno e às tarefas domésticas. Os baixos salários também contribuíram para a desvalorização da carreira.\n\n'
            '• Reforma Leôncio de Carvalho (1879): Propôs mudanças no ensino, incluindo a ampliação dos conteúdos e a valorização de áreas como ciências, filosofia e pedagogia.',
      },
      {
        'section': 'AULA 06: HISTÓRIA DA FORMAÇÃO DE PROFESSORES',
        'docNumber': 'DOC. 06/D',
        'title': '4. Institutos de Educação, Leis Orgânicas e LDB',
        'content':
            '• Institutos de Educação (1930–1946): A formação docente passou por mudanças, com maior exigência de escolarização e valorização da preparação profissional.\n\n'
            '• Lei Orgânica do Ensino Normal (1946): Organizou a formação em dois ciclos, com Escolas Normais Regionais e Escolas Normais. Houve expansão da rede, mas também presença de professores sem formação específica.\n\n'
            '• Lei 5.692/71: Transformou a formação de professores em Habilitação Específica para o Magistério (HEM), no segundo grau. Entre os problemas estavam a fragmentação curricular e a separação entre teoria e prática.\n\n'
            '• Revitalização nos anos 1980: Os CEFAMs ofereceram formação em período integral e valorizaram a pesquisa e a prática docente. A ANFOPE também defendeu a docência como base da identidade profissional da educação.\n\n'
            '• LDB de 1996: O artigo 62 estabeleceu a formação em nível superior como referência para a docência na educação básica, admitindo a formação de nível médio, modalidade normal, para a educação infantil e os cinco primeiros anos do ensino fundamental. Permaneceram desafios relacionados à valorização profissional e à remuneração.',
      },
    ];
  }

  void _navigateToChallenge() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Dossier06ChallengeScreen(),
      ),
    );
  }


  // Metadados das imagens: os nomes dos arquivos foram mantidos exatamente
  // como você os salvou na pasta assets/images.
  final Map<String, Map<String, String>> _imageData = {
    'DOC. 06/A': {
      'file': 'assets/images/doc_2f.jpeg',
      'caption': 'FIGURA 01 — Educar e instruir: reflexões sobre a educação.',
      'status': 'A imagem pode ajudar a discutir as concepções de educação e as funções atribuídas à escola e aos professores.',
      'source': 'Heloísa H. Meirelles — “Educar e instruir”.',
      'url': 'https://heloisahmeirelles.blogspot.com/2012/09/educar-e-instruir.html',
    },
    'DOC. 06/D': {
      'file': 'assets/images/doc_06e.jpeg',
      'caption': 'FIGURA 02 — Instituto de Educação.',
      'status': 'A fonte visual se relaciona às instituições dedicadas à formação de professores e às mudanças na preparação profissional docente.',
      'source': 'Saudades do Rio — “Instituto de Educação”.',
      'url': 'https://saudadesdoriodoluizd.blogspot.com/2019/11/instituto-de-educacao.html',
    },
  };

  void _showExpandedImage(Map<String, String> data) {
    showDialog<void>(
      context: context,
      barrierColor: Colors.black.withOpacity(0.88),
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: const Color(0xFFF7F3E9),
          insetPadding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
            side: const BorderSide(color: Color(0xFFD4AF37), width: 2),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 900,
              maxHeight: MediaQuery.of(dialogContext).size.height * 0.9,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'REGISTRO VISUAL — DOSSIÊ 06',
                          style: TextStyle(
                            fontFamily: 'Courier', fontWeight: FontWeight.bold,
                            color: Color(0xFF382E25), fontSize: 13,
                          ),
                        ),
                      ),
                      IconButton(
                        tooltip: 'Fechar imagem',
                        onPressed: () => Navigator.of(dialogContext).pop(),
                        icon: const Icon(Icons.close, color: Color(0xFF382E25)),
                      ),
                    ],
                  ),
                  const Divider(color: Color(0xFFD4AF37)),
                  Flexible(
                    child: InteractiveViewer(
                      minScale: 0.7,
                      maxScale: 4,
                      child: Image.asset(
                        data['file']!,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => const Padding(
                          padding: EdgeInsets.all(24),
                          child: Text(
                            'Não foi possível carregar a imagem. Confira se o arquivo está em assets/images e se o nome está escrito exatamente como no código.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: 'Courier'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      data['caption']!,
                      style: const TextStyle(
                        fontFamily: 'Courier', fontWeight: FontWeight.bold,
                        color: Color(0xFF382E25), fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Text(
                        data['status']!,
                        style: const TextStyle(
                          fontFamily: 'Courier', fontSize: 11,
                          height: 1.4, color: Color(0xFF38302A),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'FONTE: ${data['source']}',
                      style: const TextStyle(
                        fontFamily: 'Courier', fontSize: 10,
                        fontWeight: FontWeight.bold, color: Color(0xFF8C7A6B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  SelectableText(
                    data['url']!,
                    style: const TextStyle(
                      fontFamily: 'Courier', fontSize: 10,
                      color: Color(0xFF7A4E16), decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Dica: amplie com o zoom e arraste a imagem. O endereço acima pode ser selecionado e copiado para abrir no navegador.',
                    style: TextStyle(fontFamily: 'Courier', fontSize: 9, color: Color(0xFF6D6255)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDocumentImage(String docNumber) {
    final data = _imageData[docNumber];
    if (data == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => _showExpandedImage(data),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxHeight: 260),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFC2B69D), width: 1.5),
                  ),
                  child: Image.asset(
                    data['file']!,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Imagem não encontrada. Confira o nome do arquivo em assets/images.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Courier', fontSize: 10),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: const Color(0xDD382E25),
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  child: const Text(
                    'CLIQUE PARA AMPLIAR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Courier', fontSize: 10,
                      fontWeight: FontWeight.bold, letterSpacing: 1,
                      color: Color(0xFFE8DFC8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data['caption']!,
            style: const TextStyle(
              fontFamily: 'Courier', fontSize: 10.5,
              fontWeight: FontWeight.bold, color: Color(0xFF382E25),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'FONTE: ${data['source']}',
            style: const TextStyle(
              fontFamily: 'Courier', fontSize: 9.5, color: Color(0xFF8C7A6B),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data['status']!,
            style: const TextStyle(
              fontFamily: 'Courier', fontSize: 10,
              height: 1.35, color: Color(0xFF38302A),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentCard(Map<String, String> doc) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F3E9),
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: const Color(0xFFC2B69D),
          width: 1.5,
        ),
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
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.attach_file,
              color: Colors.grey[700],
              size: 24,
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            color: const Color(0xFF382E25),
            child: Text(
              doc['section']!,
              style: const TextStyle(
                fontFamily: 'Courier',
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE8DFC8),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            doc['docNumber']!,
            style: const TextStyle(
              fontFamily: 'Courier',
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8C7A6B),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            doc['title']!,
            style: const TextStyle(
              fontFamily: 'Courier',
              fontSize: 13.5,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E1A17),
            ),
          ),

          const Divider(
            height: 18,
            thickness: 1,
            color: Color(0xFFDCD2C0),
          ),

          Text(
            doc['content']!,
            style: const TextStyle(
              fontFamily: 'Courier',
              fontSize: 11,
              height: 1.45,
              color: Color(0xFF38302A),
            ),
          ),

          if (_imageData.containsKey(doc['docNumber']))
            _buildDocumentImage(doc['docNumber']!),
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

  // Seta branca para voltar aos gabinetes
  leading: IconButton(
    icon: const Icon(
      Icons.arrow_back,
      color: Colors.white,
    ),
    onPressed: () {
      Navigator.of(context).popUntil(
        (route) =>
            route.settings.name == '/cabinet' ||
            route.isFirst,
      );
    },
  ),

  title: const Text(
    'DOSSIÊ Nº 06 — FORMAÇÃO DE PROFESSORES',
    style: TextStyle(
      fontFamily: 'Courier',
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
      color: Color(0xFFD4AF37),
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
              const SizedBox(height: 12),

              // CABEÇALHO FIXO
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8DFC8),
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: const Color(0xFF8C7A6B),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          'HISTÓRIA DA FORMAÇÃO DE PROFESSORES — AULA 06',
                          style: TextStyle(
                            fontFamily: 'Courier',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E1A17),
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFA82315),
                          ),
                        ),
                        child: const Text(
                          'UFSCar',
                          style: TextStyle(
                            fontFamily: 'Courier',
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFA82315),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // DOCUMENTOS EM LISTA VERTICAL ROLÁVEL
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: _documents.length,
                  itemBuilder: (context, index) {
                    return _buildDocumentCard(
                      _documents[index],
                    );
                  },
                ),
              ),

              // RODAPÉ FIXO
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'DOCUMENTOS DISPONÍVEIS: ${_documents.length}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE8DFC8),
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // BOTÃO DE PERÍCIA DOCUMENTAL
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _navigateToChallenge,
                        icon: const Icon(
                          Icons.history_edu,
                          size: 18,
                        ),
                        label: const Text(
                          'INICIAR DESAFIO DA AULA 06',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Courier',
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            letterSpacing: 0.6,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD4AF37),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}