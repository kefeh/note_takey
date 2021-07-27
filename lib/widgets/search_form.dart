import 'package:flutter/material.dart';
import 'package:note_takey/models/colors_data.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SizedBox(
        height: 40,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            fillColor: ColorsData.searchColor,
            filled: true,
            prefixIcon: Icon(
              Icons.search,
              size: 30,
            ),
            hintText: "Search",
            hintStyle: TextStyle(
              fontSize: 12,
              textBaseline: TextBaseline.alphabetic,
            ),
            border: OutlineInputBorder(
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
