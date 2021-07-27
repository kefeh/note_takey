import 'package:flutter/material.dart';
import 'package:note_takey/screens/add_task_screen.dart';
import 'package:note_takey/widgets/search_form.dart';
import 'package:note_takey/widgets/staggered_grid.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  Widget buildBottomModal(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    return Container();
  }

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
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          )
        },
        backgroundColor: accentColorSecondary,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        SizedBox(
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
                        CircleAvatar(
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
                  const SearchForm(searchColor: searchColor),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Expanded(
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
