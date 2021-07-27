import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_takey/models/task.dart';
import 'package:note_takey/widgets/staggered_card.dart';

class StGridView extends StatefulWidget {
  const StGridView({
    Key? key,
    required this.accentColor,
    required this.taskItems,
  }) : super(key: key);

  final Color accentColor;
  final List<Task> taskItems;

  @override
  State<StGridView> createState() => _StGridViewState();
}

class _StGridViewState extends State<StGridView> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      crossAxisSpacing: 22,
      mainAxisSpacing: 22,
      itemCount: widget.taskItems.length,
      itemBuilder: (context, index) {
        return CardItem(
          task: widget.taskItems[index],
        );
      },
      staggeredTileBuilder: (index) {
        return const StaggeredTile.fit(1);
      },
    );
  }
}
