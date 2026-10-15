import 'package:almanaque/Screens/prologue_screen.dart';
import 'package:flutter/material.dart';

class IdentificationScreen extends StatefulWidget {
  const IdentificationScreen({super.key});

  @override
  State<IdentificationScreen> createState() => _IdentificationScreenState();
}

class _IdentificationScreenState extends State<IdentificationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _studentNameController =
      TextEditingController(text: 'Larissa Moroni Breda');
  final TextEditingController _raController =
      TextEditingController(text: '858794');
  final TextEditingController _professorController =
      TextEditingController(text: 'Ariadne Lopes Ecar');
  final TextEditingController _courseController =
      TextEditingController(text: 'História da Educação II — UFSCar');

  @override
  void dispose() {
    _studentNameController.dispose();
    _raController.dispose();
    _professorController.dispose();
    _courseController.dispose();
    super.dispose();
  }

void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const PrologueScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFE8D8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C241D),
        elevation: 0,
        title: const Text(
          'FICHA DE ACREDITAÇÃO',
          style: TextStyle(
            fontFamily: 'Courier',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Color(0xFFD4AF37),
            fontSize: 16,
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
                padding: const EdgeInsets.all(20.0),
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'UFSCar — DEPTº DE EDUCAÇÃO',
                                style: TextStyle(
                                  fontFamily: 'Courier',
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF5A4A3A),
                                ),
                              ),
                              Text(
                                'REGISTRO DE ACERVO HISTÓRICO',
                                style: TextStyle(
                                  fontFamily: 'Courier',
                                  fontSize: 10,
                                  color: Color(0xFF7A6A5A),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red.shade800),
                            ),
                            child: Text(
                              'VOL. I',
                              style: TextStyle(
                                fontFamily: 'Courier',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.red.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 30, thickness: 1, color: Color(0xFFC0B29A)),

                      const Text(
                        'IDENTIFICAÇÃO DO PESQUISADOR / AUTOR:',
                        style: TextStyle(
                          fontFamily: 'Courier',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C241D),
                        ),
                      ),
                      const SizedBox(height: 16),

                      _buildTypedFormField(
                        label: 'NOME DO ALUNO(A):',
                        controller: _studentNameController,
                      ),
                      const SizedBox(height: 14),

                      _buildTypedFormField(
                        label: 'REGISTRO ACADÊMICO (R.A.):',
                        controller: _raController,
                      ),
                      const SizedBox(height: 14),

                      _buildTypedFormField(
                        label: 'DISCIPLINA / CURSO:',
                        controller: _courseController,
                      ),
                      const SizedBox(height: 14),

                      _buildTypedFormField(
                        label: 'DOCENTE RESPONSÁVEL:',
                        controller: _professorController,
                      ),
                      const SizedBox(height: 24),

                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3EDDF),
                          border: Border.all(
                              color: const Color(0xFF8C7A6B),
                              style: BorderStyle.solid),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.verified_outlined,
                                color: Color(0xFF5A4A3A), size: 28),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Acreditação confirmada. Acesso concedido aos 15 Dossiês Temáticos.',
                                style: TextStyle(
                                  fontFamily: 'Courier',
                                  fontSize: 11,
                                  color: Color(0xFF4A3A2A),
                                  fontStyle: FontStyle.italic,
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
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _submitForm,
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
                        'ABRIR PRÓLOGO DO ARQUIVO',
                        style: TextStyle(
                          fontFamily: 'Courier',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 18),
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

  Widget _buildTypedFormField({
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Courier',
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B5A4B),
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          style: const TextStyle(
            fontFamily: 'Courier',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A1A),
          ),
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            filled: true,
            fillColor: Color(0xFFEDE5D5),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFB0A08B)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF2C241D), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}