import 'package:flutter/material.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Training Hub')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Categories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              _chip('Waste Disposal', true),
              _chip('Housing', false),
              _chip('Feeding', false),
            ]),
          ),
          const SizedBox(height: 20),
          _trainingCard('Biosecurity Measures for Pig Farms', 'Learn essential practices to protect your pig farm.', 'Video'),
          _trainingCard('Poultry Farm Biosecurity Checklist', 'A comprehensive checklist for top biosecurity standards.', 'Infographic'),
          _trainingCard('Waste Management in Livestock Farming', 'Best practices for managing waste effectively.', 'Video'),
          _trainingCard('Vaccination Protocols for Pigs', 'Detailed protocols for vaccinating your pigs.', 'Infographic'),
          _trainingCard('Test Your Knowledge', 'Take a quiz to assess your understanding of biosecurity.', 'Quiz'),
        ]),
      ),
    );
  }

  Widget _chip(String label, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: active ? Colors.green.shade100 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: TextStyle(color: active ? Colors.green : Colors.black87)),
    );
  }

  Widget _trainingCard(String title, String desc, String type) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(desc),
        leading: CircleAvatar(
          backgroundColor: Colors.green.shade50,
          child: Text(type[0], style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
