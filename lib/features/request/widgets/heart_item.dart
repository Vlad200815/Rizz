import 'package:flutter/material.dart';
import 'package:rizz/gen/colors.gen.dart';

class HeartItem extends StatefulWidget {
  const HeartItem({super.key});

  @override
  State<HeartItem> createState() => _HeartStateItem();
}

class _HeartStateItem extends State<HeartItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();

    _scale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 1.18,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 14,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.18,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 14,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 1.08,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 14,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.08,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 14,
      ),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 44),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scale,
      builder: (context, child) =>
          Transform.scale(scale: _scale.value, child: child),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: ColorName.accentRed.withValues(alpha: 0.5),
                  blurRadius: 40,
                  spreadRadius: 8,
                ),
              ],
            ),
            child: const Text('❤️', style: TextStyle(fontSize: 80)),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('💕', style: TextStyle(fontSize: 18)),
              SizedBox(width: 6),
              Text('✨', style: TextStyle(fontSize: 14)),
              SizedBox(width: 6),
              Text('💕', style: TextStyle(fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }
}
