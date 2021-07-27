import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_takey/models/task_data_change_notifier.dart';
import 'package:note_takey/widgets/staggered_card.dart';
import 'package:provider/provider.dart';

class StGridView extends StatelessWidget {
  const StGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
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
