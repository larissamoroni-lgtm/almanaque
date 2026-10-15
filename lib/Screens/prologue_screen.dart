import 'package:flutter/material.dart';
import 'cabinet_screen.dart';

class PrologueScreen extends StatelessWidget {
  const PrologueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFE8D8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C241D),
        elevation: 0,
        title: const Text(
          'PRÓLOGO: O ARQUIVO ESQUECIDO',
          style: TextStyle(
            fontFamily: 'Courier',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Color(0xFFD4AF37),
            fontSize: 15,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(22.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAF6EE),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFFC0B29A), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(25),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'NOTA INTRODUTÓRIA',
                          style: TextStyle(
                            fontFamily: 'Courier',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8C2D19),
                          ),
                        ),
                        Text(
                          'DOCUMENTO Nº 00',
                          style: TextStyle(
                            fontFamily: 'Courier',
                            fontSize: 11,
                            color: Color(0xFF7A6A5A),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24, thickness: 1, color: Color(0xFFC0B29A)),
                    const SizedBox(height: 8),
                    const Text(
                      'Este almanaque constitui um repositório vivo de investigações no campo da História da Educação II. '
                      'Longe de apresentar uma narrativa linear e acabada, cada dossiê aqui reunido funciona como uma pasta de evidências, '
                      'articulando fontes primárias, vestígios iconográficos e análises críticas sobre a trajetória escolar brasileira.\n\n'
                      'Por meio dos 15 dossiês que compõem este arquivo, convida-se o pesquisador a "estranhar o familiar", questionando as permanências e '
                      'rupturas das práticas educativas da Colônia à era contemporânea.',
                      style: TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 13,
                        height: 1.5,
                        color: Color(0xFF2C241D),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF3EDDF),
                        border: Border(
                          left: BorderSide(color: Color(0xFF8C2D19), width: 4),
                        ),
                      ),
                      child: const Text(
                        '"A História da Educação não nos dá receitas para a sala de aula, mas nos ensina a estranhar o presente e compreender o tempo lento das mudanças sociais."',
                        style: TextStyle(
                          fontFamily: 'Courier',
                          fontSize: 11,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF4A3A2A),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                 onPressed: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CabinetScreen(),
      ),
    );
  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2C241D),
                    foregroundColor: const Color(0xFFD4AF37),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    elevation: 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'ACESSAR GAVETEIRO DE DOSSIÊS',
                        style: TextStyle(
                          fontFamily: 'Courier',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.folder_open, size: 18),
                    ],
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