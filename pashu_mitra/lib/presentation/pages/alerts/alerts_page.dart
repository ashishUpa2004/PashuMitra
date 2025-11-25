import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pashu_mitra/presentation/widgets/alert_tile.dart';


class AlertsPage extends ConsumerWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // For now we use sample alerts. Later you can replace this with a Firestore provider.
    final sampleAlerts = [
      {
        'title': 'Disease Outbreak',
        'message':
            'Highly Pathogenic Avian Influenza (HPAI) detected in nearby region. Implement enhanced biosecurity measures.',
        'icon': Icons.warning_amber_rounded,
        'color': Colors.redAccent,
        'time': '2h ago'
      },
      {
        'title': 'Vaccination Reminder',
        'message':
            'Swine Flu vaccination due for pigs in Barn 3. Schedule within the next 7 days.',
        'icon': Icons.vaccines_outlined,
        'color': Colors.blueAccent,
        'time': '1 day ago'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerts'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Recent Alerts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Alerts list
              Expanded(
                child: ListView.separated(
                  itemCount: sampleAlerts.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, i) {
                    final a = sampleAlerts[i];
                    return GestureDetector(
                      onTap: () {
                        // show a detail dialog or navigate to detail page
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text(a['title'] as String),
                            content: Text(a['message'] as String),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: AlertTile(
                        title: a['title'] as String,
                        message: a['message'] as String,
                        icon: a['icon'] as IconData,
                        color: a['color'] as Color,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
