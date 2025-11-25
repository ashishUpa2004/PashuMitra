import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class RiskAssessmentPage extends StatefulWidget {
  const RiskAssessmentPage({super.key});

  @override
  State<RiskAssessmentPage> createState() => _RiskAssessmentPageState();
}

class _RiskAssessmentPageState extends State<RiskAssessmentPage> {
  final Map<int, bool?> answers = {};

  final questions = [
    'Do you have a designated entry point for visitors and vehicles?',
    'Are all visitors required to sign in and out of the farm?',
    'Do you have a quarantine area for new animals?',
    'Are all vehicles entering the farm disinfected?',
    'Do you have a regular pest control program?',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Risk Assessment')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const Text(
            'Answer the following questions to assess biosecurity risks on your farm.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 20),
          for (int i = 0; i < questions.length; i++) _buildQuestion(i + 1, questions[i]),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Assessment submitted!')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              minimumSize: const Size(double.infinity, 55),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Submit'),
          ),
        ]),
      ),
    );
  }

  Widget _buildQuestion(int num, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          CircleAvatar(radius: 14, backgroundColor: Colors.green.shade100, child: Text('$num', style: const TextStyle(color: Colors.green))),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold))),
        ]),
        Row(children: [
          Expanded(
            child: RadioListTile<bool>(
              title: const Text('Yes'),
              value: true,
              groupValue: answers[num],
              onChanged: (v) => setState(() => answers[num] = v),
            ),
          ),
          Expanded(
            child: RadioListTile<bool>(
              title: const Text('No'),
              value: false,
              groupValue: answers[num],
              onChanged: (v) => setState(() => answers[num] = v),
            ),
          ),
        ]),
      ]),
    );
  }
}
