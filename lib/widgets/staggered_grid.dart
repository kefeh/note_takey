import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_takey/widgets/staggered_card.dart';

class StGridView extends StatefulWidget {
  const StGridView({
    Key? key,
    required this.accentColor,
  }) : super(key: key);

  final Color accentColor;

  @override
  State<StGridView> createState() => _StGridViewState();
}

class _StGridViewState extends State<StGridView> {
  List<CardItem> cardItems = [];
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      crossAxisSpacing: 22,
      mainAxisSpacing: 22,
      itemCount: cardItems.length,
      itemBuilder: (context, index) {
        return cardItems[index];
      },
      staggeredTileBuilder: (index) {
        return const StaggeredTile.fit(1);
      },
    );
  }
}
