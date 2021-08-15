import 'package:flutter/material.dart';

class HeaderSearchField extends StatelessWidget {
  const HeaderSearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: Theme.of(context).canvasColor,
        filled: true,
        isDense: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide.none,
        ),
        suffixIcon: const Icon(Icons.search_outlined),
      ),
    );
  }
}
