import 'package:flutter/material.dart';
import "/style/context_extension.dart";
import '../style/color_scheme.dart';
import '../style/text_theme.dart';

Widget textFormField(TextEditingController cityTextController, TextThemeLight textTheme, ColorSchemeLight colorScheme, BuildContext context) {
  return Semantics(
    enabled: true,
    tooltip: "Search Bar",
    label: "search bar",
    focused: true,
    child: TextFormField(
      style: textTheme.subtitle1,
      controller: cityTextController,
      decoration: InputDecoration(
        helperText: "Write a Location or Country",
        hintStyle: textTheme.subtitle1,
        prefixStyle: textTheme.subtitle2,

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.purple),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(context.lowestContainer)),
          borderSide: BorderSide(color: colorScheme.purple),
        ),
        labelText: 'Search',
        labelStyle: textTheme.subtitle2,
      ),
    ),
  );
}
