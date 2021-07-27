import 'package:flutter/material.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
    required this.searchColor,
  }) : super(key: key);

  final Color searchColor;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SizedBox(
        height: 40,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            fillColor: searchColor,
            filled: true,
            prefixIcon: const Icon(
              Icons.search,
              size: 30,
            ),
            hintText: "Search",
            hintStyle: const TextStyle(
              fontSize: 12,
              textBaseline: TextBaseline.alphabetic,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
