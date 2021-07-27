import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_takey/widgets/staggered_card.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color searchColor = Color(0xFFF5F6FD);
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
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: TextField(
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
