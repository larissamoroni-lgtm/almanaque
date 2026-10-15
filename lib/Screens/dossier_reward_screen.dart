import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BadgeStorage {
  static const String _storageKey = 'almanaque_badges';

  static Future<void> saveBadge(String badgeTitle) async {
    final prefs = await SharedPreferences.getInstance();
    final badges = prefs.getStringList(_storageKey) ?? [];

    if (!badges.contains(badgeTitle)) {
      badges.add(badgeTitle);
      await prefs.setStringList(_storageKey, badges);
    }
  }

  static Future<List<String>> getBadges() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_storageKey) ?? [];
  }

  static Future<bool> hasBadge(String badgeTitle) async {
    final badges = await getBadges();
    return badges.contains(badgeTitle);
  }
}

class DossierRewardScreen extends StatefulWidget {
  final String badgeTitle;
  final String levelText;
  final String buttonText;
  final VoidCallback onContinue;

  const DossierRewardScreen({
    super.key,
    required this.badgeTitle,
    this.levelText = 'NÍVEL 01 — CONCEDIDO',
    this.buttonText = 'PROSSEGUIR ➔',
    required this.onContinue,
  });

  @override
  State<DossierRewardScreen> createState() => _DossierRewardScreenState();
}

class _DossierRewardScreenState extends State<DossierRewardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    // Rotação infinita para luzes e efeito do crachá
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _playSound();

    BadgeStorage.saveBadge(widget.badgeTitle);
  }

  Future<void> _playSound() async {
    try {
      await _audioPlayer.play(AssetSource('audio/victory.mp3'));
    } catch (_) {
      // Ignora erro caso o áudio não esteja disponível
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0B0A),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 1. FAIXAS DE LUZ GIRATÓRIAS (SUNBURST EFFECT)
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: CustomPaint(
                    size: const Size(500, 500),
                    painter: SunburstPainter(),
                  ),
                );
              },
            ),

            // 2. BRILHO CENTRAL (GLOW)
            Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFD4AF37).withOpacity(0.35),
                    blurRadius: 90,
                    spreadRadius: 30,
                  ),
                ],
              ),
            ),

            // 3. CONTEÚDO PRINCIPAL
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'ITEM DESBLOQUEADO!',
                  style: TextStyle(
                    fontFamily: 'Courier',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4AF37),
                    letterSpacing: 3.0,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),

                // 4. CRACHÁ GIRANDO EM 3D
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    final double angle = _controller.value * 2 * math.pi;
                    return Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(angle),
                      alignment: Alignment.center,
                      child: child,
                    );
                  },
                  child: _buildBadgeCard(),
                ),

                const SizedBox(height: 35),

                // TÍTULO DA CREDENCIAL
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    widget.badgeTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF7F3E9),
                      letterSpacing: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // BOTÃO DE CONTINUAR
                ElevatedButton(
                  onPressed: widget.onContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  child: Text(
                    widget.buttonText,
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // WIDGET DO CRACHÁ DINÂMICO
  Widget _buildBadgeCard() {
    return Container(
      width: 200,
      height: 280,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1A17),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD4AF37), width: 2),
        boxShadow: const [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Furo do crachá
          Container(
            width: 30,
            height: 8,
            decoration: BoxDecoration(
              color: const Color(0xFF0D0B0A),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: const Color(0xFF8C7A6B)),
            ),
          ),
          const SizedBox(height: 12),

          // Foto / Ícone de Perfil
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFF2A2420),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFD4AF37), width: 1.5),
            ),
            child: const Icon(
              Icons.person,
              size: 45,
              color: Color(0xFFE8DFC8),
            ),
          ),
          const SizedBox(height: 12),

          const Text(
            'INVESTIGADOR(A)',
            style: TextStyle(
              fontFamily: 'Courier',
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD4AF37),
            ),
          ),
          const SizedBox(height: 4),

          // TEXTO DO NÍVEL (DINÂMICO)
          Text(
            widget.levelText,
            style: const TextStyle(
              fontFamily: 'Courier',
              fontSize: 9,
              color: Color(0xFF8C7A6B),
            ),
          ),

          const Spacer(),

          // Selo de Autenticidade
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(2),
            ),
            child: const Text(
              'CREDENCIAL ATIVA',
              style: TextStyle(
                fontFamily: 'Courier',
                fontSize: 8,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// PAINTER DAS FAIXAS DE LUZ (SUNBURST)
class SunburstPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.max(size.width, size.height);
    final paint = Paint()
      ..color = const Color(0xFFD4AF37).withOpacity(0.08)
      ..style = PaintingStyle.fill;

    const numberOfRays = 12;
    const angleStep = (2 * math.pi) / numberOfRays;

    for (int i = 0; i < numberOfRays; i += 2) {
      final startAngle = i * angleStep;
      final sweepAngle = angleStep;

      final path = Path()
        ..moveTo(center.dx, center.dy)
        ..arcTo(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          sweepAngle,
          false,
        )
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}