import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rizz/gen/colors.gen.dart';

class BackgroundView extends StatefulWidget {
  const BackgroundView({super.key});

  @override
  State<BackgroundView> createState() => _BackgroundView();
}

class _BackgroundView extends State<BackgroundView>
    with TickerProviderStateMixin {
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

      _controllers.add(controller);

      _particles.add(
        _Particle(
          startX: rand.nextDouble(),
          size: 2 + rand.nextDouble() * 3,
          opacity: 0.2 + rand.nextDouble() * 0.4,
          phase: rand.nextDouble(),
          controller: controller,
        ),
      );
    }
  }

  @override
  void dispose() {
    // Loop through all the controllers and dispose them
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
        // Gradient background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorName.roseBackgroundStart,
                ColorName.roseBackgroundMiddle,
                ColorName.roseBackgroundEnd,
              ],
              stops: [0.0, 0.4, 1.0],
            ),
          ),
        ),

        // Participles
        ...List.generate(_particles.length, (i) {
          final p = _particles[i];
          return AnimatedBuilder(
            animation: p.controller,
            builder: (context, _) {
              final screenH = MediaQuery.of(context).size.height;
              final screenW = MediaQuery.of(context).size.width;
              final progress = (p.controller.value + p.phase) % 1.0;

              return Positioned(
                left: p.startX * screenW,
                top: screenH - (progress * (screenH + 40)),
                child: Opacity(
                  opacity: p.opacity * (1 - progress),
                  child: Container(
                    width: p.size,
                    height: p.size,
                    decoration: const BoxDecoration(
                      color: ColorName.particle,
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

// Participle model
class _Particle {
  final double startX;
  final double size;
  final double opacity;
  final double phase;
  final AnimationController controller;

  const _Particle({
    required this.startX,
    required this.size,
    required this.opacity,
    required this.phase,
    required this.controller,
  });
}
