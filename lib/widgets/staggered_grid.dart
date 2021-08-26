import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_takey/tasks/application/task_data_change_notifier.dart';
import 'package:note_takey/widgets/staggered_card.dart';

class StGridView extends StatelessWidget {
  const StGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, ref, Widget? child) {
        final taskData = ref.watch(taskDataProvider);
        return StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          crossAxisSpacing: 22,
          mainAxisSpacing: 22,
          itemCount: taskData.taskItems.length,
          itemBuilder: (context, index) {
            return CardItem(
              task: taskData.taskItems[index],
            );
          },
          staggeredTileBuilder: (index) {
            return const StaggeredTile.fit(1);
          },
        );
      },
    );
  }
}
