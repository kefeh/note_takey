import 'package:flutter/material.dart';
import 'package:note_takey/screens/add_task_screen.dart';
import 'package:note_takey/tasks/application/colors_data.dart';
import 'package:note_takey/widgets/search_form.dart';
import 'package:note_takey/widgets/staggered_grid.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsData.mainColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          )
        },
        backgroundColor: ColorsData.accentColorSecondary,
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
                              color: ColorsData.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: ColorsData.accentColor,
                          radius: 25.0,
                          child: Icon(
                            Icons.person,
                            size: 20.0,
                            color: ColorsData.accentColorSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SearchForm(),
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
                  child: StGridView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
