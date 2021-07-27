import 'package:flutter/material.dart';
import 'package:note_takey/models/task.dart';

class CardItem extends StatelessWidget {
  final Task task;
  const CardItem({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const FontWeight weight500 = FontWeight.w500;
    const Color accentColor = Color(0xFFCFECFE);

    return Container(
      decoration: BoxDecoration(
          color: accentColor, borderRadius: BorderRadius.circular(12)),
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
