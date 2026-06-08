import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _Background();
}

class _Background extends State<Background> with TickerProviderStateMixin {
  // 👈 Ticker бо контролерів багато
  final List<_Particle> _particles = [];
  final List<AnimationController> _controllers = [];

  static const _particleCount = 18;

  @override
  void initState() {
    super.initState();
    _spawnParticles();
  }

  void _spawnParticles() {
    final rand = Random();

    for (int i = 0; i < _particleCount; i++) {
      final duration = Duration(milliseconds: 4000 + rand.nextInt(6000));

      final controller = AnimationController(vsync: this, duration: duration)
        ..repeat();

      // зсув щоб не всі стартували одночасно
      controller.forward(from: rand.nextDouble());

      _controllers.add(controller);

      _particles.add(
        _Particle(
          startX: rand.nextDouble(),
          size: 2 + rand.nextDouble() * 3,
          opacity: 0.2 + rand.nextDouble() * 0.4,
          controller: controller,
        ),
      );
    }
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // градієнтний фон
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF1A0610), Color(0xFF2D0A1A), Color(0xFF1A0A10)],
              stops: [0.0, 0.4, 1.0],
            ),
          ),
        ),

        // частинки
        ...List.generate(_particles.length, (i) {
          final p = _particles[i];
          return AnimatedBuilder(
            animation: p.controller,
            builder: (context, _) {
              final screenH = MediaQuery.of(context).size.height;
              final screenW = MediaQuery.of(context).size.width;
              final progress = p.controller.value;

              return Positioned(
                left: p.startX * screenW,
                top: screenH - (progress * (screenH + 40)),
                child: Opacity(
                  opacity: p.opacity * (1 - progress),
                  child: Container(
                    width: p.size,
                    height: p.size,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE8607A),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ],
    );
  }
}

// модель однієї частинки
class _Particle {
  final double startX;
  final double size;
  final double opacity;
  final AnimationController controller;

  const _Particle({
    required this.startX,
    required this.size,
    required this.opacity,
    required this.controller,
  });
}
