import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Farm Health ---
            Text(
              'Farm Health',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _lineChart(),

            const SizedBox(height: 20),
            // --- Biosecurity Compliance ---
            Text(
              'Biosecurity Compliance',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _barChart(),

            const SizedBox(height: 30),
            // --- Performance Trends ---
            Text(
              'Performance Trends',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _trendItem('Feed Efficiency', 1.8, '↑ 0.1', true),
            _trendItem('Production Index', 3.2, '↓ 0.2', false),
          ],
        ),
      ),
    );
  }

  // ----------------- Example chart widgets -----------------

  Widget _lineChart() {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: true),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              color: Colors.green,
              spots: const [
                FlSpot(0, 1),
                FlSpot(1, 3),
                FlSpot(2, 1.8),
                FlSpot(3, 2.5),
                FlSpot(4, 1.9),
                FlSpot(5, 2.8),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _barChart() {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          titlesData: const FlTitlesData(show: true),
          borderData: FlBorderData(show: false),
          barGroups: [
            BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 8, color: Colors.green)]),
            BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 10, color: Colors.green)]),
            BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 7, color: Colors.green)]),
            BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 12, color: Colors.green)]),
          ],
        ),
      ),
    );
  }

  Widget _trendItem(String title, double value, String change, bool isPositive) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          Row(
            children: [
              Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                change,
                style: TextStyle(
                  color: isPositive ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
