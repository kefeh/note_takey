import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:note_takey/models/task.dart';
import 'package:note_takey/widgets/staggered_card.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    Key? key,
    required this.addListItems,
  }) : super(key: key);

  final Function addListItems;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String header = '';
  String body = '';
  String date = DateFormat.yMMMEd().format(DateTime.now());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color accentColor = Color(0xFFCFECFE);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Header(
            text: "Add Notes",
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.white12,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget.addListItems(
              Task(
                header: header,
                body: body,
                createdAt: date,
              ),
            );
          },
          child: const Icon(Icons.check),
        ),
        backgroundColor: Colors.white,
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
                    fillColor: accentColor,
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
                      fillColor: accentColor,
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
