import 'package:flutter/material.dart';
import 'package:pashu_mitra/core/theme/app_theme.dart';


class CompliancePage extends StatelessWidget {
  const CompliancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compliance Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Progress', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: 0.5, backgroundColor: Colors.grey.shade200, color: AppTheme.primary),
          const SizedBox(height: 10),
          const Text('50%', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primary)),
          const SizedBox(height: 20),
          const Text('Biosecurity Checklist', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _checkTile('Sanitize equipment', true),
          _checkTile('Implement entry/exit protocols', false),
          _checkTile('Monitor animal health', false),
        ]),
      ),
    );
  }

  Widget _checkTile(String text, bool done) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: done ? Colors.green.shade50 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(done ? Icons.check_circle : Icons.access_time, color: done ? Colors.green : Colors.grey),
          const SizedBox(width: 12),
          Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
            Text(done ? 'Completed' : 'Pending', style: TextStyle(color: done ? Colors.green : Colors.grey)),
          ])),
          Checkbox(value: done, onChanged: (_) {}),
        ],
      ),
    );
  }
}
