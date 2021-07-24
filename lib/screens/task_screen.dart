import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color mainColor = Colors.white;
    const Color accentColor = Color(0xFFCFECFE);
    const Color accentColorSecondary = Color(0xFF2CC2EC);
    const Color textColor = Color(0xff0f1212);
    const Color searchColor = Color(0xFFF5F6FD);
    return Scaffold(
      backgroundColor: mainColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: accentColorSecondary,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 150,
                          child: Text(
                            "Hey milz,\nGood morning",
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: accentColor,
                          radius: 25.0,
                          child: Icon(
                            Icons.person,
                            size: 20.0,
                            color: accentColorSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    child: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        color: searchColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            size: 30,
                          ),
                          fillColor: Colors.white,
                          hintText: "Search",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: SizedBox(
                  child: StGridView(accentColor: accentColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StGridView extends StatelessWidget {
  const StGridView({
    Key? key,
    required this.accentColor,
  }) : super(key: key);

  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      crossAxisSpacing: 22,
      mainAxisSpacing: 22,
      itemCount: 6,
      itemBuilder: (context, index) {
        return CardItem(accentColor: accentColor);
      },
      staggeredTileBuilder: (index) {
        return const StaggeredTile.fit(1);
      },
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.accentColor,
  }) : super(key: key);

  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: accentColor, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Health",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              "We will create an imageList URL in a list and define it on a staggered gridview.",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "20th May",
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
