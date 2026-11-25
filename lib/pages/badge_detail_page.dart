import 'package:flutter/material.dart';

import '../models/achievement_badge.dart';

import 'package:provider/provider.dart';

import '../viewmodels/badge_detail_view_model.dart';
import 'completed_spots_page.dart';

class BadgeDetailPage extends StatelessWidget {
  final AchievementBadge badge;

  const BadgeDetailPage({super.key, required this.badge});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BadgeDetailViewModel(badge)..load(),
      child: const _BadgeDetailView(),
    );
  }
}

class _BadgeDetailView extends StatelessWidget {
  const _BadgeDetailView();
  @override
  Widget build(BuildContext context) {
    return Consumer<BadgeDetailViewModel>(
      builder: (context, vm, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('バッジ詳細')),

          body: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              children: [
                Icon(_icon(vm.badge), size: 120, color: _color(vm.badge)),

                const SizedBox(height: 24),

                Text(
                  vm.badge.badgeName,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                ListTile(
                  leading: const Icon(Icons.category),
                  title: const Text('カテゴリ'),
                  subtitle: Text(vm.badge.category),
                ),

                ListTile(
                  leading: const Icon(Icons.percent),
                  title: const Text('達成率'),
                  subtitle: Text('${vm.badge.achievedPercent}%'),
                ),

                ListTile(
                  leading: const Icon(Icons.event),
                  title: const Text('獲得日時'),
                  subtitle: Text(vm.badge.achievedAt.toLocal().toString()),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),

                    child: Text(vm.badge.description),
                  ),
                ),
                const SizedBox(height: 24),

                const Divider(),

                const SizedBox(height: 12),

                ElevatedButton.icon(
                  icon: const Icon(Icons.list),
                  label: const Text('達成スポット一覧'),
                  onPressed: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (_) =>
                            CompletedSpotsPage(category: vm.badge.category),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  IconData _icon(AchievementBadge badge) {
    switch (badge.badgeName.toLowerCase()) {
      case 'complete':
        return Icons.workspace_premium;

      case 'gold':
        return Icons.emoji_events;

      case 'silver':
        return Icons.military_tech;

      case 'bronze':
        return Icons.star;

      default:
        return Icons.workspace_premium;
    }
  }

  Color _color(AchievementBadge badge) {
    switch (badge.badgeName.toLowerCase()) {
      case 'complete':
        return Colors.amber;

      case 'gold':
        return Colors.orange;

      case 'silver':
        return Colors.blueGrey;

      case 'bronze':
        return Colors.brown;

      default:
        return Colors.amber;
    }
  }
}
