import 'package:flutter/material.dart';
import "/style/context_extension.dart";

import '../style/color_scheme.dart';
import '../style/text_theme.dart';

TextFormField textFormField(TextEditingController cityTextController, TextThemeLight weatherTheme, ColorSchemeLight colorScheme, BuildContext context) {
  return TextFormField(
    style: weatherTheme.subtitle1,
    controller: cityTextController,
    decoration: InputDecoration(
      prefixStyle: weatherTheme.subtitle2,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.purple),
        borderRadius: BorderRadius.circular(25.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(context.lowestContainer)),
        borderSide: BorderSide(color: colorScheme.purple),
      ),
      labelText: 'Search',
      labelStyle: weatherTheme.subtitle2,
    ),
  );
}
