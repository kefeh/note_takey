import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:note_takey/models/colors_data.dart';
import 'package:note_takey/models/task.dart';
import 'package:note_takey/models/task_data_change_notifier.dart';
import 'package:note_takey/widgets/staggered_card.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String header = '';
  String body = '';
  String date = DateFormat.yMMMEd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Header(
            text: "Add Notes",
          ),
          backgroundColor: ColorsData.mainColor,
          shadowColor: Colors.white12,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<TaskData>(context, listen: false).addTaskItems(
              Task(
                header: header,
                body: body,
                createdAt: date,
              ),
            );
            Navigator.pop(context);
          },
          child: const Icon(Icons.check),
          backgroundColor: ColorsData.accentColorSecondary,
        ),
        backgroundColor: ColorsData.mainColor,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: TextField(
                  onChanged: (value) => {
                    setState(() => {header = value})
                  },
                  textAlignVertical: TextAlignVertical.bottom,
                  maxLength: 40,
                  maxLengthEnforcement:
                      MaxLengthEnforcement.truncateAfterCompositionEnds,
                  decoration: InputDecoration(
                    fillColor: ColorsData.accentColor,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Title',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Scrollbar(
                  radius: const Radius.circular(20),
                  child: TextField(
                    onChanged: (value) => {
                      setState(() => {body = value})
                    },
                    textAlignVertical: TextAlignVertical.top,
                    expands: true,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: const TextStyle(
                      height: 1.8,
                    ),
                    decoration: InputDecoration(
                      fillColor: ColorsData.accentColor,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      hintText: 'Note',
                    ),
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
