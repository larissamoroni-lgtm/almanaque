import 'package:flutter/material.dart';
import 'dossier_02.dart';
import 'dossier_03.dart';
import 'dossier_04.dart';
import 'dossier_05.dart'; 
import 'dossier_06.dart'; 
import './dossier_01.dart';
import 'badge_collection_screen.dart';

class CabinetScreen extends StatelessWidget {
  final int unlockedUpTo; // Define até qual dossiê está liberado

  const CabinetScreen({
    super.key,
    this.unlockedUpTo = 6, // Alterado para deixar aberto até o 6 por padrão
  });

  // Mapeamento dos títulos de cada Dossiê
  String _getDossierTitle(int number) {
    switch (number) {
      case 1:
        return 'O Campo da História da Educação';
      case 2:
        return 'Políticas Públicas na Educação';
      case 3:
        return 'História da Educação na República';
      case 4:
        return 'Cultura Escolar e Práticas';
      case 5:
        return 'Título do Dossiê 05';
      case 6:
        return 'Título do Dossiê 06';
      default:
        return 'Aguardando Escavação / Pesquisa';
    }
  }

  // Navegação dinâmica de acordo com o número do Dossiê
  void _navigateToDossier(BuildContext context, int number) {
    Widget? screen;

    switch (number) {
      case 1:
        screen = const Dossier01Screen(
          title: 'O Campo da História da Educação',
          dossierNumber: '01',
        );
        break;
      case 2:
        screen = const Dossier02Screen(title: '', dossierNumber: '',);
        break;
      case 3:
        screen = const Dossier03Screen(title: '', dossierNumber: '',);
        break;
      case 4:
        screen = const Dossier04Screen( title: '', dossierNumber: '', );
        break;
      case 5:
        screen = const Dossier05Screen(title: '', dossierNumber: '',);
        break;
      case 6:
        screen = const Dossier06Screen(title: '', dossierNumber: '',);
        break;
    }

    if (screen != null) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => screen!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C241D),
        elevation: 0,
        title: const Text(
          'GAVETEIRO DE DOSSIÊS',
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
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: 16, 
          itemBuilder: (context, index) {
            
            if (index == 15) {
  return Container(
    margin: const EdgeInsets.only(
      top: 12.0,
      bottom: 24.0,
    ),
    width: double.infinity,
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const BadgeCollectionScreen(),
          ),
        );
      },
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1B1714),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: const Color(0xFFD4AF37),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFD4AF37)
                  .withOpacity(0.15),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF2A231D),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: const Color(0xFF8C7A6B),
                ),
              ),
              child: const Icon(
                Icons.workspace_premium,
                color: Color(0xFFD4AF37),
                size: 28,
              ),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'MINHAS CREDENCIAIS',
                    style: TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD4AF37),
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Consulte os desafios concluídos e as credenciais que você desbloqueou.',
                    style: TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 10,
                      color: Color(0xFFB0A496),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFD4AF37),
              size: 16,
            ),
          ],
        ),
      ),
    ),
  );
}

            // Renderização padrão dos Dossiês (1 a 15)
            final dossierNum = index + 1;
            final isUnlocked = dossierNum <= unlockedUpTo;

            return Container(
              margin: const EdgeInsets.only(bottom: 12.0),
              decoration: BoxDecoration(
                color: isUnlocked
                    ? const Color(0xFFFAF6EE)
                    : const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: isUnlocked
                      ? const Color(0xFFD4AF37)
                      : const Color(0xFF444444),
                  width: 1.5,
                ),
              ),
              child: ListTile(
                leading: Icon(
                  isUnlocked ? Icons.folder_special : Icons.folder_outlined,
                  color: isUnlocked ? const Color(0xFF8C2D19) : Colors.grey,
                  size: 32,
                ),
                title: Text(
                  'DOSSIÊ Nº ${dossierNum.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    fontFamily: 'Courier',
                    fontWeight: FontWeight.bold,
                    color: isUnlocked
                        ? const Color(0xFF2C241D)
                        : Colors.grey.shade300,
                  ),
                ),
                subtitle: Text(
                  _getDossierTitle(dossierNum),
                  style: TextStyle(
                    fontFamily: 'Courier',
                    fontSize: 12,
                    color: isUnlocked
                        ? const Color(0xFF5A4A3A)
                        : Colors.grey.shade600,
                  ),
                ),
                trailing: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isUnlocked
                        ? Colors.red.shade100
                        : Colors.transparent,
                    border: Border.all(
                      color: isUnlocked
                          ? Colors.red.shade800
                          : Colors.grey.shade700,
                    ),
                  ),
                  child: Text(
                    isUnlocked ? 'DISPONÍVEL' : 'RESTRITO',
                    style: TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: isUnlocked ? Colors.red.shade800 : Colors.grey,
                    ),
                  ),
                ),
                onTap: () {
                  if (isUnlocked) {
                    _navigateToDossier(context, dossierNum);
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}