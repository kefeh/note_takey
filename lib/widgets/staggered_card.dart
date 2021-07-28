import 'package:flutter/material.dart';
import 'package:note_takey/models/colors_data.dart';
import 'package:note_takey/models/task.dart';
import 'package:note_takey/models/task_data_change_notifier.dart';
import 'package:note_takey/screens/add_task_screen.dart';
import 'package:provider/provider.dart';

class CardItem extends StatelessWidget {
  final Task task;
  const CardItem({
    Key? key,
    required this.task,
  }) : super(key: key);

  longPress(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF757575),
      builder: (BuildContext context) {
        return Container(
          height: 60,
          decoration: const BoxDecoration(
            color: ColorsData.accentColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            ),
          ),
          child: TextButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false)
                  .removeTaskItem(task);
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.delete_forever,
              color: Colors.redAccent,
              size: 30.0,
            ),
          ),
        );
      },
    );
  }

  tap() {}

  @override
  Widget build(BuildContext context) {
    const FontWeight weight500 = FontWeight.w500;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddTaskScreen(
              task: task,
            ),
          ),
        );
      },
      onLongPress: () {
        longPress(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: ColorsData.accentColor,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Header(
                  text: task.header,
                ),
              ),
              Text(
                task.body,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: weight500,
                  height: 1.8,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  task.createdAt,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: weight500,
                    height: 1.5,
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

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }
}
