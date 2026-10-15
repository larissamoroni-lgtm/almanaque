import 'package:flutter/material.dart';
import 'package:almanaque/Screens/dossier_02_challenge.dart';
import 'package:almanaque/Screens/dossier_03.dart';
import 'cabinet_screen.dart';

class Dossier02Screen extends StatefulWidget {
  const Dossier02Screen({
    super.key,
    required String title,
    required String dossierNumber,
  });

  @override
  State<Dossier02Screen> createState() => _Dossier02ScreenState();
}

class _Dossier02ScreenState extends State<Dossier02Screen> {
  late final List<Map<String, String>> _documents;

  @override
  void initState() {
    super.initState();

    _documents = [
  {
    'section': 'PARTE I: REFORMAS POMBALINAS',
    'docNumber': 'DOC. 02/A',
    'title': '1. As Aulas Régias (1760 – 1774)',
    'content':
        '• 1760 — Reformas Pombalinas: Implementação das Aulas Régias e do Estudo das Humanidades.\n\n'
        '• 1772: Liberação do Subsídio Literário para financiamento das aulas.\n\n'
        '• 1774: Início das primeiras aulas de Filosofia, Língua Nacional e Moral.',
  },
  {
    'section': 'PARTE I: EXPANSÃO ESCOLAR',
    'docNumber': 'DOC. 02/B',
    'title': '2. Primeiras Escolas e Instrução (1827)',
    'content':
        '• 1827 — Criação das primeiras escolas em locais mais populosos.\n\n'
        '• Organização do Trabalho: Definição clara de jornada de trabalho e salário justo para os mestres.\n\n'
        '• Monitores: Introdução de monitores para auxiliar os professores no ensino.\n\n'
        '• Inclusão de Gênero: Ensino aberto para meninos e meninas (embora com carga reduzida em Matemática para as meninas).',
  },
  {
    'section': 'PARTE II: IMPÉRIO & SEGUNDA METADE DO SÉC. XIX',
    'docNumber': 'DOC. 02/C',
    'title': '3. Colégio de Pedro II e Reformas de Ensino',
    'content':
        '• 1837 — Criação do Colégio de Pedro II: Instituição de referência com número mínimo de funcionários. Currículo com Química, Filosofia, Grego, Latim, etc.\n\n'
        '• 1854 — Reforma de Ensino (1º e 2º Graus): Estabelecimento de condições para o magistério público e regulamentação do que deve ser ensinado.',
  },
  {
    'section': 'PARTE II: REPÚBLICA E REFORMA BENJAMIN CONSTANT',
    'docNumber': 'DOC. 02/D',
    'title': '4. Experiência Pedagógica e Método Intuitivo (1889)',
    'content':
        '• 1889 — 1ª Experiência Pedagógica no RJ: Promulgada pelo Decreto nº 7.247.\n\n'
        '• Protagonistas: Rui Barbosa e a introdução do Método Intuitivo (lições de coisas).',
  },
  {
    'section': 'PARTE III: ESTRUTURAÇÃO DA ESCOLA PRIMÁRIA',
    'docNumber': 'DOC. 02/E',
    'title': '5. Políticas Públicas na Educação (27.08)',
    'content':
        '• Divisão da Escola Primária: Organizada em 1º e 2º graus e dividida em 3 cursos (Elementar, Médio e Superior/Gradual).\n\n'
        '• Método Intuitivo: Equilíbrio prático e teórico entre a teoria e a prática.\n\n'
        '• Normas de Turma: 1º grau com limite máximo de 30 alunos por sala (devendo contratar mais professores caso exceda).\n\n'
        '• Diretrizes: Ensino gratuito e livre para todos. Estrutura física prevê biblioteca, museu, ginásio, pátio e jardim.',
  },
  {
    'section': 'PARTE III: FORMAÇÃO DOCENTE E INOVAÇÃO',
    'docNumber': 'DOC. 02/F',
    'title': '6. Escola Normal e Pedagogium',
    'content':
        '• Escola Normal: Focada na formação de professores para o ensino primário.\n\n'
        '• Carreira Docente: Professor Primário Titular (contrato de 5 anos via concurso público) e Professor Adjunto/Auxiliar (3 anos de atuação).\n\n'
        '• Pedagogium: Centro de inovação e atualização tecnológica para docentes que já atuam na rede pública.\n\n'
        '• Ensino Secundário Integral: Mantido via impostos públicos, com gratificação e melhoria salarial de acordo com o trabalho prestado (Título VIII, Art. 62).',
  },
];
  }

  void _navigateToChallenge() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Dossier02ChallengeScreen(),
      ),
    );
  }

  void _navigateToDossier03() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Dossier03Screen(
          title: 'DOSSIÊ Nº 03',
          dossierNumber: '03',
        ),
      ),
    );
  }


  // Metadados das imagens: os nomes dos arquivos foram mantidos exatamente
  // como você os salvou na pasta assets/images.
  final Map<String, Map<String, String>> _imageData = {
    'DOC. 02/A': {
      'file': 'assets/images/doc_02a.jpeg',
      'caption': 'FIGURA 01 — A atuação dos jesuítas na educação brasileira.',
      'status': 'Imagem de contextualização sobre a participação dos jesuítas na história da educação no Brasil.',
      'source': 'Portal Jesuítas Brasil — “Atuação educativa dos jesuítas no Brasil é tema de livro”.',
      'url': 'https://jesuitasbrasil.org.br/atuacao-educativa-dos-jesuitas-no-brasil-e-tema-de-livro/',
    },
    'DOC. 02/B': {
      'file': 'assets/images/doc_2b.jpeg',
      'caption': 'FIGURA 02 — A instrução pública e o ensino das primeiras letras.',
      'status': 'Imagem de apoio ao tema da educação brasileira, com destaque para a instrução pública e as primeiras letras.',
      'source': 'Spotify for Creators — episódio “Educação Brasileira: Instrução Pública, Primeiras Letras e a Reforma Couto Ferraz”.',
      'url': 'https://creators.spotify.com/pod/profile/raiza-da-silva-lima/episodes/EDUCAO-BRASILEIRA-instruo-Pblica--Primeiras-Letras-e-a-Reforma-Couto-Ferraz-e170d9h',
    },
    'DOC. 02/C': {
      'file': 'assets/images/doc_2c.jpeg',
      'caption': 'FIGURA 03 — A educação brasileira durante o período imperial.',
      'status': 'Ilustração de apoio para acompanhar o contexto histórico da educação no Brasil imperial.',
      'source': 'Pinterest — publicação indicada pelo link fornecido.',
      'url': 'https://br.pinterest.com/pin/715368722038862892/',
    },
    'DOC. 02/D': {
      'file': 'assets/images/doc_2d.jpeg',
      'caption': 'FIGURA 04 — Rui Barbosa e as ideias de renovação da educação.',
      'status': 'Imagem relacionada à trajetória de Rui Barbosa e ao debate educacional no período republicano.',
      'source': 'Citações do Sampaio — “Ruy Barbosa: Jurista, Escritor e Político Brasileiro”.',
      'url': 'https://citacoesdosampaio.wordpress.com/2016/11/09/ruy-barbosa-jurista-escritor-e-politico-brasileiro/',
    },
    'DOC. 02/F': {
      'file': 'assets/images/doc_2f.jpeg',
      'caption': 'FIGURA 05 — A Escola Normal e a formação de professores.',
      'status': 'Imagem de contextualização sobre a formação docente e a diferença entre educar e instruir.',
      'source': 'Heloisa Helena Meirelles — blog “Pesquisando História no Rio de Janeiro”, postagem “Educar e instruir”.',
      'url': 'https://heloisahmeirelles.blogspot.com/2012/09/educar-e-instruir.html',
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
                          'REGISTRO VISUAL — DOSSIÊ 02',
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
    'DOSSIÊ Nº 02 — POLÍTICAS PÚBLICAS',
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
                          'HISTÓRIA DA EDUCAÇÃO — AULA 02',
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
                          Icons.search,
                          size: 18,
                        ),
                        label: const Text(
                          'INICIAR PERÍCIA DOCUMENTAL',
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
                        onPressed: _navigateToDossier03,
                        icon: const Icon(
                          Icons.folder_open,
                          size: 18,
                        ),
                        label: const Text(
                          'ACESSAR DOSSIÊ Nº 03',
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