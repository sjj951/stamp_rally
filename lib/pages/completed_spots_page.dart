import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/completed_spots_view_model.dart';
import 'stamp_detail_page.dart';

class CompletedSpotsPage extends StatelessWidget {
  final String category;

  const CompletedSpotsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CompletedSpotsViewModel(category)..load(),

      child: const _CompletedSpotsView(),
    );
  }
}

class _CompletedSpotsView extends StatelessWidget {
  const _CompletedSpotsView();

  @override
  Widget build(BuildContext context) {
    return Consumer<CompletedSpotsViewModel>(
      builder: (context, vm, child) {
        return Scaffold(
          appBar: AppBar(title: Text('${vm.category}達成スポット')),

          body: vm.isLoading
              ? const Center(child: CircularProgressIndicator())
              : vm.stamps.isEmpty
              ? const Center(child: Text('達成スポットがありません'))
              : ListView.builder(
                  itemCount: vm.stamps.length,

                  itemBuilder: (context, index) {
                    final stamp = vm.stamps[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),

                      child: ListTile(
                        leading: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),

                        title: Text(stamp.spotName),

                        subtitle: Text(
                          '${stamp.prefecture} / '
                          '${stamp.category}',
                        ),

                        trailing: const Icon(Icons.chevron_right),

                        onTap: () async {
                          await Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (_) => StampDetailPage(stamp: stamp),
                            ),
                          );

                          if (context.mounted) {
                            vm.load();
                          }
                        },
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
