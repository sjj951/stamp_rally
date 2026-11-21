import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/badge_history_view_model.dart';

class BadgeHistoryPage extends StatelessWidget {
  const BadgeHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BadgeHistoryViewModel()..load(),
      child: const _BadgeHistoryView(),
    );
  }
}

class _BadgeHistoryView extends StatelessWidget {
  const _BadgeHistoryView();

  @override
  Widget build(BuildContext context) {
    return Consumer<BadgeHistoryViewModel>(
      builder: (context, vm, child) {
        return Scaffold(
          appBar: AppBar(title: Text('獲得バッジ (${vm.badgeCount})')),

          body: RefreshIndicator(
            onRefresh: vm.refresh,

            child: vm.isLoading
                ? const Center(child: CircularProgressIndicator())
                : vm.badges.isEmpty
                ? const Center(child: Text('獲得バッジがありません'))
                : ListView.builder(
                    itemCount: vm.badges.length,

                    itemBuilder: (context, index) {
                      final badge = vm.badges[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),

                        child: ListTile(
                          leading: _badgeIcon(badge.badgeName),

                          title: Text(badge.badgeName),

                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'カテゴリ: '
                                '${badge.category}',
                              ),

                              Text(
                                '達成率: '
                                '${badge.achievedPercent}%',
                              ),

                              Text(
                                '獲得日: '
                                '${badge.achievedAt.year}/'
                                '${badge.achievedAt.month.toString().padLeft(2, '0')}/'
                                '${badge.achievedAt.day.toString().padLeft(2, '0')}',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }

  Widget _badgeIcon(String badgeName) {
    switch (badgeName.toLowerCase()) {
      case 'complete':
        return const Icon(
          Icons.workspace_premium,
          color: Colors.amber,
          size: 40,
        );

      case 'gold':
        return const Icon(Icons.emoji_events, color: Colors.orange, size: 40);

      case 'silver':
        return const Icon(
          Icons.military_tech,
          color: Colors.blueGrey,
          size: 40,
        );

      case 'bronze':
        return const Icon(Icons.star, color: Colors.brown, size: 40);

      default:
        return const Icon(Icons.workspace_premium, size: 40);
    }
  }
}
