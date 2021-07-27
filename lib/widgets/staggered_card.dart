import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String header;
  final String body;
  final String createdAt;
  const CardItem({
    Key? key,
    required this.header,
    required this.body,
    required this.createdAt,
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
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Header(
                text: 'Header',
              ),
            ),
            Text(
              "We will create an imageList URL in a list and define it on a staggered gridview.",
              style: TextStyle(
                fontSize: 11,
                fontWeight: weight500,
                height: 1.8,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "20th May",
                style: TextStyle(
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
