import 'package:flutter/material.dart';
import 'package:note_takey/models/task.dart';
import 'package:note_takey/screens/add_task_screen.dart';
import 'package:note_takey/widgets/search_form.dart';
import 'package:note_takey/widgets/staggered_grid.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> taskItems = [
    Task(
      header: "Header",
      body:
          "We are definitely going to start from somewhere and it will be a series that will last us a couple of weeks. We will start with what a widget is and explore through other complex concepts and techniques.",
      createdAt: "20th May",
    ),
    Task(
      header: "Header",
      body:
          "State: state defines the condition of a system or entity at a specific time (or under specific conditions).",
      createdAt: "20th May",
    ),
    Task(
      header: "Header",
      body: "Yeah that's obvious, you may say but is it?",
      createdAt: "20th May",
    ),
    Task(
      header: "Header",
      body:
          "In life, you may ask a very trivial question as, what's the state of water at room temperature? It's liquid, that's right, but does that mean that water is stateful? Yes sure, due to some external conditions, water is able to change its form or state.",
      createdAt: "20th May",
    ),
    Task(
      header: "Header",
      body: "We are definitely going to start.",
      createdAt: "20th May",
    ),
  ];

  void modifyListItems(Task taskItem) {
    setState(() {
      taskItems.add(taskItem);
    });
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
              builder: (context) => AddTaskScreen(
                addListItems: modifyListItems,
              ),
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
              Expanded(
                child: SizedBox(
                  child: StGridView(
                    accentColor: accentColor,
                    taskItems: taskItems,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
