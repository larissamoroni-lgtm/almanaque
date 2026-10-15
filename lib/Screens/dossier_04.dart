import 'package:flutter/material.dart';
import 'package:almanaque/Screens/dossier_04_challenge.dart';
import 'package:almanaque/Screens/dossier_05.dart';
import 'cabinet_screen.dart';

class Dossier04Screen extends StatefulWidget {
  const Dossier04Screen({
    super.key,
    required String title,
    required String dossierNumber,
  });

  @override
  State<Dossier04Screen> createState() => _Dossier04ScreenState();
}

class _Dossier04ScreenState extends State<Dossier04Screen> {
  late final List<Map<String, String>> _documents;

  @override
  void initState() {
    super.initState();

    _documents = [
      {
        'section': 'PARTE I: CONCEITO DE CULTURA ESCOLAR',
        'docNumber': 'DOC. 04/A',
        'title': '1. Ideia Central: Cultura Escolar (2004)',
        'content':
            '• A escola não é mera reprodutora da sociedade: ela seleciona, transforma e produz saberes, disciplinas, normas e práticas próprias.\n\n'
            '• Estudar a Cultura Escolar: Significa abrir a \"caixa-preta\" da escola (foco no cotidiano real, não apenas nas leis e reformas).\n\n'
            '• Diferença Crucial: Cultura Prescrita (regras, manuais, leis) vs. Cultura Praticada (o que realmente acontece no dia a dia da prática).',
      },
      {
        'section': 'PARTE I: AUTORES E HISTORIOGRAFIA',
        'docNumber': 'DOC. 04/B',
        'title': '2. Quadro Comparativo dos Autores',
        'content':
            '• D. Julia: Foco no conjunto de normas e práticas cotidianas de transmissão.\n\n'
            '• A. Chervel: A escola é criativa; produz conhecimento e disciplinas próprias (não só simplifica a ciência).\n\n'
            '• A. M. Forquin: A escola seleciona e reorganiza a cultura social para torná-la ensinável.\n\n'
            '• L. Viñao Frago: Conceito amplo (espaços, tempos, corpos); prefere o plural \"culturas escolares\".',
      },
      {
        'section': 'PARTE II: EIXOS DE PESQUISA NO BRASIL',
        'docNumber': 'DOC. 04/C',
        'title': '3. Saberes, Materialidade, Tempos e Espaços',
        'content':
            '• Saberes e Currículo: O currículo não é neutro; é um campo de disputas políticas e culturais.\n\n'
            '• Materialidade e Métodos: Carteiras, lousas, livros e arquitetura orientam, limitam e viabilizam as práticas pedagógicas.\n\n'
            '• Tempos e Espaços: Horários, sinalizadores e leiautes moldam corpos, comportamentos e hierarquias.',
      },
      {
        'section': 'PARTE II: SUJEITOS E CONTRIBUIÇÕES',
        'docNumber': 'DOC. 04/D',
        'title': '4. Sujeitos Ativos na Escola',
        'content':
            '• Ação dos Sujeitos: Professores e alunos não cumprem ordens passivamente ou cegamente; eles adaptam, negociam e redefinem as reformas na sala de aula.\n\n'
            '• Por que Importa?: Explica por que muitas reformas educacionais fracassam e dá visibilidade histórica ao cotidiano escolar.',
      },
      {
        'section': 'PARTE III: DESAFIOS HISTORIOGRÁFICOS',
        'docNumber': 'DOC. 04/E',
        'title': '5. Desafios do Campo de Pesquisa',
        'content':
            '• Escassez de Arquivos: Dificuldade de encontrar arquivos organizados e de acessar as práticas reais do passado.\n\n'
            '• Riscos de Pesquisa: Perigo de fragmentação excessiva dos estudos e de uso superficial dos conceitos.',
      },
    ];
  }

  void _navigateToChallenge() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Dossier04ChallengeScreen(),
      ),
    );
  }

  void _navigateToDossier05() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Dossier05Screen(
          title: 'DOSSIÊ Nº 05',
          dossierNumber: '05',
        ),
      ),
    );
  }


  // Metadados das imagens: os nomes dos arquivos foram mantidos exatamente
  // como você os salvou na pasta assets/images.
  final Map<String, Map<String, String>> _imageData = {
    'DOC. 04/A': {
      'file': 'assets/images/doc_02a_escola_antiga.jpg',
      'caption': 'FIGURA 01 — Uma sala de aula em 1926.',
      'status': 'A fotografia permite observar a organização do espaço escolar e os elementos materiais presentes na sala de aula.',
      'source': 'Wikimedia Commons — “1926 - Sala de Aula”.',
      'url': 'https://commons.wikimedia.org/wiki/File%3A1926_-_Sala_de_Aula.jpg',
    },
    'DOC. 04/D': {
      'file': 'assets/images/doc_04d.jpeg',
      'caption': 'FIGURA 02 — O bairro e o contexto social da comunidade.',
      'status': 'Imagem relacionada à história do bairro Jardim Palmares, útil como referência visual para pensar a relação entre escola, comunidade e espaço social.',
      'source': 'Saiba História — “Conhecendo o bairro Jardim Palmares, RJ”.',
      'url': 'https://saibahistoria.blogspot.com/2018/11/conhecendo-o-bairro-jardim-palmares-rj.html#google_vignette',
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
                          'REGISTRO VISUAL — DOSSIÊ 04',
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
    'DOSSIÊ Nº 04 — CULTURA ESCOLAR',
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
                          'HISTÓRIA DA EDUCAÇÃO — AULA 04',
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

              // RODAPÉ FIXO COM OS DOIS BOTÕES
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
                          'INICIAR DESAFIO DO DOSSIÊ 03',
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

                    const SizedBox(height: 8),

                    // BOTÃO PARA O DOSSIÊ 03
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _navigateToDossier05,
                        icon: const Icon(
                          Icons.folder_open,
                          size: 18,
                        ),
                        label: const Text(
                          'ACESSAR DOSSIÊ Nº 05',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Courier',
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            letterSpacing: 0.8,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF382E25),
                          foregroundColor: const Color(0xFFE8DFC8),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                            side: const BorderSide(
                              color: Color(0xFFD4AF37),
                              width: 1,
                            ),
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