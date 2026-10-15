import 'package:flutter/material.dart';
import 'package:almanaque/Screens/dossier_03_challenge.dart';
import 'package:almanaque/Screens/dossier_04.dart';
import 'cabinet_screen.dart';

class Dossier03Screen extends StatefulWidget {
  const Dossier03Screen({
    super.key,
    required String title,
    required String dossierNumber,
  });

  @override
  State<Dossier03Screen> createState() => _Dossier03ScreenState();
}

class _Dossier03ScreenState extends State<Dossier03Screen> {
  late final List<Map<String, String>> _documents;

  @override
  void initState() {
    super.initState();

    _documents = [
      {
        'section': 'PARTE I: REPÚBLICA VELHA',
        'docNumber': 'DOC. 03/A',
        'title': '1. Anos Iniciais da República (1893)',
        'content':
            '• Cenário: Elevadas taxas de analfabetismo e prevalência de aulas particulares.\n\n'
            '• Grupos Escolares & Subvenções: Criação do Grupo Escolar (ex: \"Luz / BH\") direcionado principalmente aos homens.\n\n'
            '• Estrutura: 4 salas (uma para cada grau). Início aos 9 anos e saída direta para o mercado de trabalho.\n\n'
            '• Escolas Isoladas e Reunidas: Ante a falta de grupos escolares, surgiram as escolas isoladas (rurais multissérie) e reunidas (junção de isoladas).',
      },
      {
        'section': 'PARTE I: ERA VARGAS',
        'docNumber': 'DOC. 03/B',
        'title': '2. Ensino Secundário e Nacionalização (1931)',
        'content':
            '• Colégio Pedro II: Reorganização do ensino secundário em 5 anos iniciais e 2 complementares.\n\n'
            '• Escolas Étnicas: Fechamento de escolas étnicas imigrantes; obrigatoriedade do ensino exclusivo em língua portuguesa.',
      },
      {
        'section': 'PARTE II: ENSINO TÉCNICO E REFORMA CAPANEMA',
        'docNumber': 'DOC. 03/C',
        'title': '3. Formação Industrial e Sistema S (1942/1946)',
        'content':
            '• Formação Profissional: Formação voltada para a preparação de trabalhadores para a indústria (criação do SENAI em 1942).\n\n'
            '• SENAI vs. SENAC: Leis Orgânicas dividindo a formação entre Indústria (SENAI) e Comércio (SENAC).\n\n'
            '• Reforma Capanema: O Sistema S mantinha autonomia sem receber verbas diretas do Ministério da Educação. Gratuidade do 1º grau.',
      },
      {
        'section': 'PARTE II: DEMOCRATIZAÇÃO E PRIMEIRA LDB',
        'docNumber': 'DOC. 03/D',
        'title': '4. Leis Orgânicas (1946) e LDB 4.024/61',
        'content':
            '• Lei Orgânica (1946): Regulamentação para construir a identidade nacional e organização por idades.\n\n'
            '• 1ª LDB (1961): Disputa política entre ensino público laico e instituições privadas (LDB reconhece o ensino particular).\n\n'
            '• Estrutura: Níveis Primário, Médio e Superior (4 a 7 anos). Estado oferta, pais têm a obrigação de matricular.',
      },
      {
        'section': 'PARTE III: DITADURA MILITAR',
        'docNumber': 'DOC. 03/E',
        'title': '5. LDB 5.692/71 e Tecnicismo',
        'content':
            '• Controle Ideológico: Inclusão obrigatória de Educação Moral e Cívica (EMC) no 1º grau e presença militar na escola.\n\n'
            '• Objetivo: Formação rápida e instrumental de mão de obra para o mercado de trabalho (formar trabalhadores).',
      },
      {
        'section': 'PARTE III: NOVO FRAMEWORK LEGAL',
        'docNumber': 'DOC. 03/F',
        'title': '6. LDB Atual nº 9.394/96 e a BNCC',
        'content':
            '• LDB 9.394/96: Legislação educacional vigente no Brasil.\n\n'
            '• Diretrizes e BNCC: Estabelecimento da Base Nacional Comum Curricular e Diretrizes Curriculares.\n\n'
            '• Garantia Constitucional: Organização das redes escolares para assegurar educação gratuita e obrigatória.',
      },
    ];
  }

  void _navigateToChallenge() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Dossier03ChallengeScreen(),
      ),
    );
  }

  void _navigateToDossier04() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Dossier04Screen(
          title: 'DOSSIÊ Nº 04',
          dossierNumber: '04',
        ),
      ),
    );
  }


  // Metadados das imagens: os nomes dos arquivos foram mantidos exatamente
  // como você os salvou na pasta assets/images.
  final Map<String, Map<String, String>> _imageData = {
    'DOC. 03/A': {
      'file': 'assets/images/doc_03a.jpeg',
      'caption': 'FIGURA 01 — As primeiras escolas e a expansão do ensino em Minas Gerais.',
      'status': 'Imagem relacionada à história das primeiras escolas em Ouro Preto.',
      'source': 'O Tempo — “Primeiras escolas vieram de Ouro Preto”.',
      'url': 'https://www.otempo.com.br/opiniao/juliana-gouthier/primeiras-escolas-vieram-de-ouro-preto-1.216178',
    },
    'DOC. 03/C': {
      'file': 'assets/images/doc_03c.jpeg',
      'caption': 'FIGURA 02 — Educação de jovens e adultos e formação profissional.',
      'status': 'Material de apoio sobre EJA e educação profissional e tecnológica.',
      'source': 'UFSC — material educativo sobre EJA-EPT.',
      'url': 'https://sgmdnute.sites.ufsc.br/setec-materiais/eja-ept/pagina4.html',
    },
    'DOC. 03/F': {
      'file': 'assets/images/doc_03f.jpeg',
      'caption': 'FIGURA 03 — A ampliação da estrutura e das vagas na educação.',
      'status': 'Imagem de contextualização sobre iniciativas recentes na rede de ensino do Distrito Federal.',
      'source': 'Metrópoles — “Educação no DF entra em nova era com ampliação de vagas e de estrutura”.',
      'url': 'https://www.metropoles.com/conteudo-especial/educacao-no-df-entra-em-nova-era-com-ampliacao-de-vagas-e-de-estrutura',
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
                          'REGISTRO VISUAL — DOSSIÊ 03',
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
    'DOSSIÊ Nº 03 — EDUCAÇÃO NA REPÚBLICA',
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
                          'HISTÓRIA DA EDUCAÇÃO — AULA 03',
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
                        onPressed: _navigateToDossier04,
                        icon: const Icon(
                          Icons.folder_open,
                          size: 18,
                        ),
                        label: const Text(
                          'ACESSAR DOSSIÊ Nº 04',
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