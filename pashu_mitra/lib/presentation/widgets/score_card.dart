import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ScoreCard extends StatelessWidget {
  final double score;
  final String label;

  const ScoreCard({
    super.key,
    required this.score,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.greenGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: AppColors.shadow, blurRadius: 8, offset: Offset(0, 4))
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label,
            style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        Text('${(score * 100).toInt()}/100',
            style: const TextStyle(
                fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold)),
        const Text('Excellent', style: TextStyle(color: Colors.white)),
        const SizedBox(height: 10),
        LinearPercentIndicator(
          lineHeight: 10,
          percent: score,
          backgroundColor: Colors.white24,
          progressColor: Colors.white,
          barRadius: const Radius.circular(10),
        ),
      ]),
    );
  }
}
