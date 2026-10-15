import 'package:flutter/material.dart';
import 'package:almanaque/Screens/dossier_05_challenge.dart';
import 'package:almanaque/Screens/dossier_06.dart';
import 'cabinet_screen.dart';

class Dossier05Screen extends StatefulWidget {
  const Dossier05Screen({
    super.key,
    required String title,
    required String dossierNumber,
  });

  @override
  State<Dossier05Screen> createState() => _Dossier05ScreenState();
}

class _Dossier05ScreenState extends State<Dossier05Screen> {
  late final List<Map<String, String>> _documents;

  @override
  void initState() {
    super.initState();

    _documents = [
      {
        'section': 'AULA 05: CULTURA ESCRITA NA H.E.',
        'docNumber': 'DOC. 05/A',
        'title': '1. Novas Fontes e a Cultura Escrita',
        'content':
            '• Mudança de Perspectiva: Desde os anos 1990, a história da educação passou a usar documentos cotidianos e práticas escolares.\n\n'
            '• Comparação: Permite contrapor as normas oficiais com o que realmente acontecia na prática educacional.\n\n'
            '• Conceito de Impressos: Envolve manuscritos, impressos e digitais. Seus usos mudam conforme o tempo, classe, gênero e relações de poder.',
      },
      {
        'section': 'AULA 05: CULTURA ESCRITA NA H.E.',
        'docNumber': 'DOC. 05/B',
        'title': '2. Educação Extraescolar e Diversidade',
        'content':
            '• Impressos Extraescolares: Jornais, revistas, fanzines e livros moldam comportamentos e valores, mesmo sem finalidade pedagógica explícita.\n\n'
            '• Diversidade de Fontes: Vários materiais, como boletins, revistas femininas e livros em braile, mostram que os impressos ajudam a construir identidades e formas de coexistência.',
      },
      {
        'section': 'AULA 05: CULTURA ESCRITA NA H.E.',
        'docNumber': 'DOC. 05/C',
        'title': '3. Metodologia e Investigação das Fontes',
        'content':
            '• Análise das Fontes: As fontes históricas não falam sozinhas. O pesquisador deve questioná-las e analisar sua produção e circulação.\n\n'
            '• Exemplo de Divulgação: Uma revista mineira divulgou a Reforma Francisco Campos.\n\n'
            '• Concursos: Concursos com premiações eram criados para engajar os professores nas práticas propostas.\n\n'
            '• Relações de Gênero: Professoras destacaram-se em aulas modelo, enquanto homens atuaram em temas teóricos e organizacionais.',
      },
      {
        'section': 'AULA 05: CULTURA ESCRITA NA H.E.',
        'docNumber': 'DOC. 05/D',
        'title': '4. Papéis Sociais e Regras da Imprensa',
        'content':
            '• Papéis Sociais: Os impressos servem tanto para estudar o passado quanto para formar os sujeitos, transmitindo padrões de gênero, cidadania, etnia e religião.\n\n'
            '• Distinção Fundamental: É preciso diferenciar as regras apresentadas nos impressos das práticas reais de leitura.',
      },
    ];
  }

  void _navigateToChallenge() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Dossier05ChallengeScreen(),
      ),
    );
  }

  void _navigateToDossier06() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Dossier06Screen(
          title: 'DOSSIÊ Nº 06',
          dossierNumber: '06',
        ),
      ),
    );
  }


  // Metadados das imagens: os nomes dos arquivos foram mantidos exatamente
  // como você os salvou na pasta assets/images.
  final Map<String, Map<String, String>> _imageData = {
    'DOC. 05/B': {
      'file': 'assets/images/doc_05b.jpeg',
      'caption': 'FIGURA 01 — Edições encadernadas da Revista da Semana, de 1922.',
      'status': 'A revista é um exemplo de impresso que permite investigar a circulação de ideias e valores fora do espaço escolar.',
      'source': 'Bancantiga — “Revista da Semana: edições encadernadas de 1922”.',
      'url': 'https://www.bancantiga.com.br/214b6c/revista-da-semana-edicoes-encadernadas-do-n-27-ao-n-39-destaque-para-os-primeiros-numeros-da-serie-em-comemoracao-do-centenario-da-independencia-junho-a-setembro-de-1922',
    },
    'DOC. 05/C': {
      'file': 'assets/images/doc_05c.jpeg',
      'caption': 'FIGURA 02 — Decreto imperial e as restrições impostas às professoras.',
      'status': 'A fonte ajuda a discutir como as normas históricas expressavam diferenças de gênero no acesso ao ensino e nas funções docentes.',
      'source': 'Terra — “Mulheres não devem ensinar matemática”, dizia decreto imperial.',
      'url': 'https://www.terra.com.br/noticias/brasil/dia-do-professor-mulheres-nao-devem-ensinar-matematica-dizia-decreto-imperial-que-inspirou-a-data%2C01c2b6928a857e432ed3846d65a32f9cbix8uiqc.html',
    },
    'DOC. 05/D': {
      'file': 'assets/images/doc_05d.jpeg',
      'caption': 'FIGURA 03 — Exemplar da revista A Semana, de 1919.',
      'status': 'A revista ilustrada é um exemplo de fonte impressa que pode ser analisada considerando sua produção, circulação e contexto histórico.',
      'source': 'Fundação Cultural do Pará — “A Semana: revista illustrada, 1919”.',
      'url': 'https://obrasraras.fcp.pa.gov.br/a-semana-revista-illustrada-1919/',
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
                          'REGISTRO VISUAL — DOSSIÊ 05',
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
    'DOSSIÊ Nº 05 — CULTURA ESCRITA',
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
                        onPressed: _navigateToDossier06,
                        icon: const Icon(
                          Icons.folder_open,
                          size: 18,
                        ),
                        label: const Text(
                          'ACESSAR DOSSIÊ Nº 06',
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