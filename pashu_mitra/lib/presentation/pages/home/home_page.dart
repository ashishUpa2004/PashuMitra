import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pashu_mitra/presentation/pages/alerts/alerts_page.dart';
import 'package:pashu_mitra/presentation/pages/compliance/compliance_page.dart';
import 'package:pashu_mitra/presentation/pages/reports/reports_page.dart';
import 'package:pashu_mitra/presentation/pages/training/training_page.dart';
import 'package:pashu_mitra/presentation/providers/auth_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _idx = 0;

  final List<Widget> _pages = const [
    HomeContent(),
    AlertsPage(),
    CompliancePage(),
    TrainingPage(),
    ReportsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_idx]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _idx,
        onTap: (i) => setState(() => _idx = i),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important),
            label: 'Alert',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shield),
            label: 'Compliance',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Training'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
        ],
      ),
    );
  }
}

// -------------------------
// 🏠 HOME CONTENT
// -------------------------
class HomeContent extends ConsumerWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --------------------
          // HEADER
          // --------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Logo & Name
              Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Color(0xFFE8F5E9),
                    child: Icon(Icons.agriculture, color: Colors.green),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "PashuMitra",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              // Right side: Notification + Logout
              Row(
                children: [
                  IconButton(
                    tooltip: "Logout",
                    onPressed: () async {
                      await ref.read(authRepositoryProvider).logout();
                      // No navigation needed — RootRouter will redirect to LoginPage automatically
                    },
                    icon: const Icon(Icons.logout, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // --------------------
          // SCORE CARD
          // --------------------
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Biosecurity Score",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                const Text(
                  "92/100",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Excellent",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: 0.92,
                    color: Colors.white,
                    backgroundColor: Colors.white24,
                    minHeight: 8,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // --------------------
          // ALERTS
          // --------------------
          const Text(
            "Alerts",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          _alertCard(
            icon: Icons.warning_amber_rounded,
            iconColor: Colors.redAccent,
            title: "Disease Outbreak",
            description:
                "Highly Pathogenic Avian Influenza (HPAI) detected in nearby region. Implement enhanced biosecurity measures.",
          ),
          const SizedBox(height: 10),

          _alertCard(
            icon: Icons.vaccines_outlined,
            iconColor: Colors.blueAccent,
            title: "Vaccination Reminder",
            description:
                "Swine Flu vaccination due for pigs in Barn 3. Schedule within the next 7 days.",
          ),

          const SizedBox(height: 25),

          // --------------------
          // QUICK ACTIONS
          // --------------------
          const Text(
            "Quick Actions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              _quickActionCard(
                Icons.science,
                "Risk Assessment",
                Colors.green.shade50,
              ),
              _quickActionCard(Icons.school, "Training", Colors.green.shade50),
              _quickActionCard(Icons.rule, "Compliance", Colors.green.shade50),
              _quickActionCard(
                Icons.bar_chart,
                "Reports",
                Colors.green.shade50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --------------------
  // ALERT CARD
  // --------------------
  Widget _alertCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: iconColor.withOpacity(0.1),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --------------------
  // QUICK ACTION CARD
  // --------------------
  Widget _quickActionCard(IconData icon, String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: Icon(icon, color: Colors.green),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
