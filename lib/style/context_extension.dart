import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get height2 => mq.size.height / 100;
  double get width2 => mq.size.width / 100;

  double get smallestText => height2 * 1.7;

  double get smallText => height2 * 2;

  double get normalText => height2 * 2.5;

  double get heightText => height2 * 3;

  double get paddingLowValue => width2 * 1;

  double get paddingMediumValue => width2 * 5;

  double get paddingheight2Value => width2 * 12;

  double get paddingSocialIconsValue => width2 * 4;

  double get iconSmall => height2 * 4;

  double get iconMedium => height2 * 5;

  double get fieldSpaceContainer => height2 * 1;

  double get lowestContainer => height2 * 3;

  double get lowContainer => height2 * 5;

  double get mediumContainer => height2 * 7;

  double get heightContainer => height2 * 9;
}

extension ThemeExtension on BuildContext {
  ThemeData get weatherTheme => Theme.of(this);

  TextTheme get textTheme => weatherTheme.textTheme;

  ColorScheme get colors => weatherTheme.colorScheme;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingSocialIcons => EdgeInsets.all(paddingSocialIconsValue);

  EdgeInsets get paddingMedium => EdgeInsets.symmetric(horizontal: paddingMediumValue);

  EdgeInsets get paddingText => EdgeInsets.only(left: paddingheight2Value);

  EdgeInsets get paddingLow => EdgeInsets.symmetric(horizontal: paddingLowValue);
}

extension ContextExtension on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
}
