import 'package:flutter/material.dart';
import 'package:almanaque/services/badge_storage.dart';

class BadgeCollectionScreen extends StatefulWidget {
  const BadgeCollectionScreen({super.key});

  @override
  State<BadgeCollectionScreen> createState() =>
      _BadgeCollectionScreenState();
}

class _BadgeCollectionScreenState
    extends State<BadgeCollectionScreen> {
  List<String> badges = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadBadges();
  }

  Future<void> loadBadges() async {
    final savedBadges = await BadgeStorage.getBadges();

    if (!mounted) return;

    setState(() {
      badges = savedBadges;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF101014);
    const goldColor = Color(0xFFD4AF63);
    const cardColor = Color(0xFF1D1D24);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        foregroundColor: goldColor,
        elevation: 0,
        title: const Text(
          'MINHAS CREDENCIAIS',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(
                color: goldColor,
              ),
            )
          : RefreshIndicator(
              color: goldColor,
              onRefresh: loadBadges,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const Text(
                    'ARQUIVO PESSOAL',
                    style: TextStyle(
                      color: goldColor,
                      fontSize: 12,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Sua coleção',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${badges.length} '
                    '${badges.length == 1 ? 'credencial desbloqueada' : 'credenciais desbloqueadas'}',
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 28),

                  if (badges.isEmpty)
                    Container(
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: goldColor.withValues(alpha: 0.25),
                        ),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.lock_outline,
                            color: goldColor,
                            size: 48,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'NENHUMA CREDENCIAL',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Conclua os desafios dos gabinetes '
                            'para desbloquear suas credenciais. '
                            'Você poderá consultá-las aqui depois.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white60,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    ...List.generate(badges.length, (index) {
                      final badge = badges[index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: goldColor.withValues(alpha: 0.45),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 58,
                              height: 58,
                              decoration: BoxDecoration(
                                color: goldColor.withValues(alpha: 0.12),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: goldColor,
                                ),
                              ),
                              child: const Icon(
                                Icons.verified,
                                color: goldColor,
                                size: 32,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'INVESTIGADOR(A)',
                                    style: TextStyle(
                                      color: goldColor,
                                      fontSize: 10,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    badge,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'CREDENCIAL ${index + 1} • ATIVA',
                                    style: const TextStyle(
                                      color: Colors.white54,
                                      fontSize: 10,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                ],
              ),
            ),
    );
  }
}