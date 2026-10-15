import 'package:flutter/material.dart';

import 'dossier_01_challenge.dart';

import 'dossier_02.dart';

import 'cabinet_screen.dart';



class Dossier01Screen extends StatefulWidget {

  const Dossier01Screen({

    super.key,

    required String title,

    required String dossierNumber,

  });



  @override

  State<Dossier01Screen> createState() => _Dossier01ScreenState();

}



class _Dossier01ScreenState extends State<Dossier01Screen> {

  late final List<Map<String, String>> _documents;



  @override

  void initState() {

    super.initState();



    _documents = [

      {

        'section': 'PARTE I: O QUE É HISTÓRIA?',

        'docNumber': 'DOC. 01/A',

        'title': '1. Definição e Conhecimento Histórico',

        'content':

            'O passado não pode ser observado de forma concreta; ele chega ao presente na forma de vestígios materiais, escritos, orais, visuais e digitais.\n\n'

            'Cabe ao historiador selecionar, contextualizar e confrontar esses registros, convertendo-os em argumentos sujeitos à crítica pública.',

      },

      {

        'section': 'PARTE I: O QUE É HISTÓRIA?',

        'docNumber': 'DOC. 01/B',

        'title': '2. Historiografia: Da Narrativa à Ciência',

        'content':

            '• Heródoto & Tucídides: Transição dos relatos orais comparados à crítica racional de testemunhos.\n\n'

            '• Idade Média: Historiografia providencialista cristã.\n\n'

            '• Renascimento & Iluminismo: Crítica filológica e verificação de autenticidade documental.\n\n'

            '• Século XIX: Profissionalização e o método de Leopold von Ranke baseado em fontes primárias contra o anacronismo.',

      },

      {

        'section': 'PARTE I: O QUE É HISTÓRIA?',

        'docNumber': 'DOC. 01/C',

        'title': '3. Método, Fontes e a Escola dos Annales',

        'content':

            '• Fonte Histórica: Todo vestígio capaz de responder a um problema de pesquisa. Requer Crítica Externa (suporte/origem) e Crítica Interna (intenções/silêncios).\n\n'

            '• Annales (1929): Marc Bloch e Lucien Febvre superam a história puramente político-militar e integram a análise da vida cotidiana e grupos marginalizados.',

      },

      {

        'section': 'PARTE I: O QUE É HISTÓRIA?',

        'docNumber': 'DOC. 01/D',

        'title': '4. Memória, Revisionismo e Negacionismo',

        'content':

            '• Disputas de Memória: Instituições frequentemente silenciam vozes de indígenas, negros, mulheres e trabalhadores.\n\n'

            '• Revisionismo Legítimo: Reavaliação constante baseada em novas fontes e métodos.\n\n'

            '• Negacionismo: Rejeição deliberada e falsificação de evidências historiográficas consolidadas.',

      },

      {

        'section': 'PARTE II: HISTÓRIA DA EDUCAÇÃO',

        'docNumber': 'DOC. 02/A',

        'title': '1. Estranhar o Familiar & Invenção da Escola',

        'content':

            '• Estranhar o Familiar: Elementos cotidianos (provas, quadros, rotinas) devem ser historicizados para não parecerem "naturais".\n\n'

            '• Etimologia: Skolê (grego - "ócio/lazer") e Schola (latim - "ócios consagrados ao estudo"). O Paidagôgos era o escravo encarregado de conduzir a criança.',

      },

      {

        'section': 'PARTE II: HISTÓRIA DA EDUCAÇÃO',

        'docNumber': 'DOC. 02/B',

        'title': '2. Trajetória Histórica da Educação',

        'content':

            '• Grécia e Roma: Transição do ensino aristocrático individual para os estudos literários e científicos.\n\n'

            '• Idade Média: Monopólio da Igreja, criação das Universidades nos burgos e a "pedagogia visual" das catedrais.\n\n'

            '• Brasil Colônia: Ação ambivalente dos Jesuítas (1549–1759) e posterior Reforma Pombalina com as "aulas régias".',

      },

      {

        'section': 'PARTE II: HISTÓRIA DA EDUCAÇÃO',

        'docNumber': 'DOC. 02/C',

        'title': '3. Século XX e a Escola Contemporânea',

        'content':

            '• Escola Nova: Manifesto dos Pioneiros (1932) defende ensino público, laico, gratuito e obrigatório.\n\n'

            '• Períodos Autoritários: Instrumentalização da escola no Estado Novo e na Ditadura Militar.\n\n'

            '• Desafio Atual: Desenvolvimento da reflexão crítica diante do excesso de informações da cultura digital.',

      },

    ];

  }



  void _navigateToChallenge() {

    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (context) => const Dossier01ChallengeScreen(),

      ),

    );

  }



  void _navigateToDossier02() {

    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (context) => const Dossier02Screen(

          title: 'DOSSIÊ Nº 02',

          dossierNumber: '02',

        ),

      ),

    );

  }






  // Abre uma visualização ampliada da imagem com legenda e informações de origem.
  void _showExpandedImage(Map<String, String> data) {
    showDialog<void>(
      context: context,
      barrierColor: Colors.black87,
      builder: (dialogContext) {
        final screenHeight = MediaQuery.of(dialogContext).size.height;

        return Dialog(
          backgroundColor: const Color(0xFFF7F3E9),
          insetPadding: const EdgeInsets.all(18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
            side: const BorderSide(color: Color(0xFFD4AF37), width: 1.5),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 1000,
              maxHeight: screenHeight * 0.9,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Text(
                          'REGISTRO VISUAL — VISUALIZAÇÃO AMPLIADA',
                          style: TextStyle(
                            fontFamily: 'Courier',
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF382E25),
                          ),
                        ),
                      ),
                      IconButton(
                        tooltip: 'Fechar imagem',
                        onPressed: () => Navigator.of(dialogContext).pop(),
                        icon: const Icon(Icons.close),
                        color: const Color(0xFFA82315),
                      ),
                    ],
                  ),
                  const Divider(color: Color(0xFFDCD2C0)),
                  Container(
                    width: double.infinity,
                    color: const Color(0xFF12100E),
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      height: screenHeight * 0.52,
                      child: InteractiveViewer(
                        minScale: 0.8,
                        maxScale: 4,
                        child: Image.asset(
                          data['path']!,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Text(
                                'IMAGEM NÃO ENCONTRADA',
                                style: TextStyle(
                                  fontFamily: 'Courier',
                                  color: Color(0xFFE8DFC8),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    data['caption']!,
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 12,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1A17),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8DFC8),
                      border: Border.all(color: const Color(0xFFC2B69D)),
                    ),
                    child: Text(
                      data['status']!,
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 11,
                        height: 1.5,
                        color: Color(0xFF382E25),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'ORIGEM / DISPONIBILIDADE',
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.7,
                      color: Color(0xFF8C7A6B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  SelectableText(
                    data['source']!,
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 11,
                      height: 1.45,
                      color: Color(0xFF38302A),
                    ),
                  ),
                  if ((data['url'] ?? '').isNotEmpty) ...[
                    const SizedBox(height: 6),
                    SelectableText(
                      data['url']!,
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 10,
                        height: 1.4,
                        color: Color(0xFF8C3B2A),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Dica: selecione e copie o endereço para abri-lo no navegador.',
                      style: TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 9,
                        color: Color(0xFF6B5B4B),
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('VOLTAR AO DOSSIÊ'),
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFFA82315),
                        textStyle: const TextStyle(
                          fontFamily: 'Courier',
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
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
    const imageData = <String, Map<String, String>>{
      'DOC. 01/A': {
        'path': 'assets/images/doc_01a_manuscrito.jpg',
        'caption': 'FIGURA 01 — Representação visual de um manuscrito antigo.',
        'status': 'GERADA POR INTELIGÊNCIA ARTIFICIAL — imagem criada com auxílio do ChatGPT para compor o Almanaque. É uma ilustração fictícia, não um documento histórico autêntico e não deve ser usada como evidência histórica.',
        'source': 'Imagem gerada por IA (ChatGPT), para uso visual no Almanaque. Não há acervo externo de origem.',
        'url': '',
      },
      'DOC. 01/B': {
        'path': 'assets/images/doc_01b_herodoto.jpg',
        'caption': 'FIGURA 02 — Imagem associada a conteúdo sobre o mundo antigo.',
        'status': 'ILUSTRAÇÃO / REFERÊNCIA VISUAL — o endereço indicado leva a uma página sobre Luciano de Samósata, não Heródoto. Portanto, não apresente a imagem como retrato de Heródoto nem como fonte direta sobre a historiografia herodoteana.',
        'source': 'Literature and History — “Episode 87: Lucian of Samosata”.',
        'url': 'https://literatureandhistory.com/episode-087-lucian-of-samosata/',
      },
      'DOC. 01/C': {
        'path': 'assets/images/doc_01c_fontes.jpg',
        'caption': 'FIGURA 03 — Exemplo visual de documentos e registros de arquivo.',
        'status': 'EXEMPLO DE MATERIAL ARQUIVÍSTICO — a matéria trata de documentos relacionados a um caso de homicídio nos Países Baixos. A imagem pode ilustrar a existência de registros históricos, mas não é uma fonte direta sobre a Escola dos Annales.',
        'source': 'Historiek.net — matéria sobre documentos de arquivo relacionados ao caso Marietje Kessels.',
        'url': 'https://historiek.net/onbekende-archiefstukken-gevonden-over-moord-op-marietje-kessels/162617/',
      },
      'DOC. 02/A': {
        'path': 'assets/images/doc_02a_escola_antiga.jpg',
        'caption': 'FIGURA 04 — Sala de aula fotografada em 1926.',
        'status': 'FOTOGRAFIA HISTÓRICA — imagem relacionada ao tema da história da escola e útil para observar características de uma sala de aula em outro período. Sua interpretação depende das informações e do contexto registrados na página de origem.',
        'source': 'Wikimedia Commons — arquivo “1926 - Sala de Aula.jpg”.',
        'url': 'https://commons.wikimedia.org/wiki/File:1926_-_Sala_de_Aula.jpg',
      },
      'DOC. 02/B': {
        'path': 'assets/images/doc_02b_educacao_historica.jpg',
        'caption': 'FIGURA 05 — Fotografia de Portugal antigo.',
        'status': 'ILUSTRAÇÃO ESTÉTICA / CONTEXTUAL — a página reúne fotografias de Portugal antigo, mas isso não garante uma relação direta com a história da educação ou com o Brasil Colônia. Use como ambientação visual, não como evidência direta do conteúdo do documento.',
        'source': 'Ferreira Dias e Noites — publicação “Fotografias de um Portugal antigo”.',
        'url': 'https://ferreiradiasenoites.blogspot.com/2016/06/fotografias-de-um-portugal-antigo.html',
      },
      'DOC. 02/C': {
        'path': 'assets/images/doc_02c_escola_moderna.png',
        'caption': 'FIGURA 06 — Imagem de apoio à discussão sobre a história da educação no Brasil.',
        'status': 'REFERÊNCIA TEMÁTICA — o artigo indicado aborda a trajetória da educação brasileira. A imagem funciona como apoio visual; para usá-la como evidência específica, é importante conferir a legenda e o contexto em que aparece na matéria.',
        'source': 'Gazeta do Povo — “A história da Educação no Brasil: uma longa jornada com lenta evolução”.',
        'url': 'https://www.gazetadopovo.com.br/educacao/a-historia-da-educacao-no-brasil-uma-longa-jornada-rumo-a-universalizacao-84npcihyra8yzs2j8nnqn8d91/',
      },
    };

    final data = imageData[docNumber];
    if (data == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => _showExpandedImage(data),
              borderRadius: BorderRadius.circular(2),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8DFC8),
                  border: Border.all(color: const Color(0xFFC2B69D)),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: Image.asset(
                        data['path']!,
                        width: double.infinity,
                        height: 165,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 100,
                            width: double.infinity,
                            color: const Color(0xFFE8DFC8),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(12),
                            child: const Text(
                              'IMAGEM NÃO ENCONTRADA',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Courier',
                                fontSize: 10,
                                color: Color(0xFFA82315),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      right: 7,
                      bottom: 7,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 5,
                        ),
                        color: const Color(0xDD12100E),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.zoom_in, size: 14, color: Color(0xFFE8DFC8)),
                            SizedBox(width: 4),
                            Text(
                              'CLIQUE PARA AMPLIAR',
                              style: TextStyle(
                                fontFamily: 'Courier',
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFE8DFC8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            data['caption']!,
            style: const TextStyle(
              fontFamily: 'Courier',
              fontSize: 9,
              height: 1.4,
              fontStyle: FontStyle.italic,
              color: Color(0xFF6B5B4B),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data['status']!,
            style: const TextStyle(
              fontFamily: 'Courier',
              fontSize: 9,
              height: 1.4,
              color: Color(0xFF8C3B2A),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            'Origem: ${data['source']!}',
            style: const TextStyle(
              fontFamily: 'Courier',
              fontSize: 8,
              height: 1.4,
              color: Color(0xFF6B5B4B),
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

          _buildDocumentImage(doc['docNumber']!),

          Text(

            doc['content']!,

            style: const TextStyle(

              fontFamily: 'Courier',

              fontSize: 11,

              height: 1.45,

              color: Color(0xFF38302A),

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

    'DOSSIÊ Nº 01 — CLASSIFICADO',

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

                    mainAxisAlignment:

                        MainAxisAlignment.spaceBetween,

                    children: [

                      const Expanded(

                        child: Text(

                          'O CAMPO DA HISTÓRIA DA EDUCAÇÃO',

                          style: TextStyle(

                            fontFamily: 'Courier',

                            fontSize: 13,

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



                    // BOTÃO DO DESAFIO

                    SizedBox(

                      width: double.infinity,

                      child: ElevatedButton.icon(

                        onPressed: _navigateToChallenge,

                        style: ElevatedButton.styleFrom(

                          backgroundColor:

                              const Color(0xFFA82315),

                          foregroundColor:

                              const Color(0xFFF7F3E9),

                          padding: const EdgeInsets.symmetric(

                            horizontal: 12,

                            vertical: 12,

                          ),

                          shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(2),

                            side: const BorderSide(

                              color: Color(0xFFD4AF37),

                              width: 1,

                            ),

                          ),

                        ),

                        icon: const Icon(

                          Icons.assignment_late_outlined,

                          size: 18,

                        ),

                        label: const Text(

                          'INICIAR DESAFIO DO DOSSIÊ 01',

                          textAlign: TextAlign.center,

                          style: TextStyle(

                            fontFamily: 'Courier',

                            fontSize: 11,

                            fontWeight: FontWeight.bold,

                            letterSpacing: 0.5,

                          ),

                        ),

                      ),

                    ),



                    const SizedBox(height: 8),



                    // BOTÃO PARA ABRIR O DOSSIÊ 02

                    SizedBox(

                      width: double.infinity,

                      child: ElevatedButton.icon(

                        onPressed: _navigateToDossier02,

                        style: ElevatedButton.styleFrom(

                          backgroundColor:

                              const Color(0xFF382E25),

                          foregroundColor:

                              const Color(0xFFE8DFC8),

                          padding: const EdgeInsets.symmetric(

                            horizontal: 12,

                            vertical: 12,

                          ),

                          shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(2),

                            side: const BorderSide(

                              color: Color(0xFFD4AF37),

                              width: 1,

                            ),

                          ),

                        ),

                        icon: const Icon(

                          Icons.folder_open,

                          size: 18,

                        ),

                        label: const Text(

                          'ACESSAR DOSSIÊ Nº 02',

                          textAlign: TextAlign.center,

                          style: TextStyle(

                            fontFamily: 'Courier',

                            fontSize: 11,

                            fontWeight: FontWeight.bold,

                            letterSpacing: 0.8,

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
