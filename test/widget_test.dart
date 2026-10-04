import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/calorie_provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CalorieProvider>();
    final recentEntries = provider.entries.take(5).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Daily Goal',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${provider.todayCalories} / 2000 kcal',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Meals',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: recentEntries.isEmpty
                  ? const Center(
                      child: Text('No meals recorded yet.'),
                    )
                  : ListView.builder(
                      itemCount: recentEntries.length,
                      itemBuilder: (context, index) {
                        final entry = recentEntries[index];
                        return ListTile(
                          leading: const Icon(Icons.fastfood),
                          title: Text(entry.name),
                          subtitle: Text(
                            '${entry.date.day}/${entry.date.month}/${entry.date.year}',
                          ),
                          trailing: Text('${entry.calories} kcal'),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
