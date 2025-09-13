import "package:expensemanagement/style/typography/expense_management_text_style.dart";
import "package:flutter/material.dart";

class MaterialTheme {
  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: ExpenseManagementTextStyles.displayLarge,
      displayMedium: ExpenseManagementTextStyles.displayMedium,
      displaySmall: ExpenseManagementTextStyles.displaySmall,
      headlineLarge: ExpenseManagementTextStyles.headlineLarge,
      headlineMedium: ExpenseManagementTextStyles.headlineMedium,
      headlineSmall: ExpenseManagementTextStyles.headlineSmall,
      titleLarge: ExpenseManagementTextStyles.bigTitle,
      titleMedium: ExpenseManagementTextStyles.titleMedium,
      titleSmall: ExpenseManagementTextStyles.titleSmall,
      bodyLarge: ExpenseManagementTextStyles.paragraphSemiBold,
      bodyMedium: ExpenseManagementTextStyles.paragraphMedium,
      bodySmall: ExpenseManagementTextStyles.paragraphBold,
      labelLarge: ExpenseManagementTextStyles.captionBold,
      labelMedium: ExpenseManagementTextStyles.captionMedium,
      labelSmall: ExpenseManagementTextStyles.labelSmall,

    );
  }

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff0A97B0),
      surfaceTint: Color(0xff00687a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff008096),
      onPrimaryContainer: Color(0xfff9fdff),
      secondary: Color(0xff46B5A7),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff46b5a7),
      onSecondaryContainer: Color(0xff00423c),
      tertiary: Color(0xff77498e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9162a9),
      onTertiaryContainer: Color(0xfffffbff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff6fafc),
      onSurface: Color(0xff171c1e),
      onSurfaceVariant: Color(0xff3d494c),
      outline: Color(0xff6d797d),
      outlineVariant: Color(0xffbdc8cc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3133),
      inversePrimary: Color(0xff68d5ef),
      primaryFixed: Color(0xffabedff),
      onPrimaryFixed: Color(0xff001f26),
      primaryFixedDim: Color(0xff68d5ef),
      onPrimaryFixedVariant: Color(0xff004e5c),
      secondaryFixed: Color(0xff8af5e5),
      onSecondaryFixed: Color(0xff00201c),
      secondaryFixedDim: Color(0xff6dd8c9),
      onSecondaryFixedVariant: Color(0xff005048),
      tertiaryFixed: Color(0xfff6d9ff),
      onTertiaryFixed: Color(0xff300149),
      tertiaryFixedDim: Color(0xffe7b3ff),
      onTertiaryFixedVariant: Color(0xff603477),
      surfaceDim: Color(0xffd6dbdd),
      surfaceBright: Color(0xfff6fafc),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f6),
      surfaceContainer: Color(0xffeaeff0),
      surfaceContainerHigh: Color(0xffe4e9eb),
      surfaceContainerHighest: Color(0xffdfe3e5),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: lightScheme(),
      brightness: Brightness.light,
      textTheme: _textTheme,
      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: darkScheme(),
      brightness: Brightness.dark,
      textTheme: _textTheme,
      useMaterial3: true,
    );
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff0A97B0),
      surfaceTint: Color(0xff68d5ef),
      onPrimary: Color(0xff003640),
      primaryContainer: Color(0xff1e9eb7),
      onPrimaryContainer: Color(0xff00272f),
      secondary: Color(0xff46B5A7),
      onSecondary: Color(0xff003732),
      secondaryContainer: Color(0xff46b5a7),
      onSecondaryContainer: Color(0xff00423c),
      tertiary: Color(0xffe7b3ff),
      onTertiary: Color(0xff471c5f),
      tertiaryContainer: Color(0xffaf7ec7),
      onTertiaryContainer: Color(0xff390a50),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f1416),
      onSurface: Color(0xffdfe3e5),
      onSurfaceVariant: Color(0xffbdc8cc),
      outline: Color(0xff879396),
      outlineVariant: Color(0xff3d494c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e5),
      inversePrimary: Color(0xff00687a),
      primaryFixed: Color(0xffabedff),
      onPrimaryFixed: Color(0xff001f26),
      primaryFixedDim: Color(0xff68d5ef),
      onPrimaryFixedVariant: Color(0xff004e5c),
      secondaryFixed: Color(0xff8af5e5),
      onSecondaryFixed: Color(0xff00201c),
      secondaryFixedDim: Color(0xff6dd8c9),
      onSecondaryFixedVariant: Color(0xff005048),
      tertiaryFixed: Color(0xfff6d9ff),
      onTertiaryFixed: Color(0xff300149),
      tertiaryFixedDim: Color(0xffe7b3ff),
      onTertiaryFixedVariant: Color(0xff603477),
      surfaceDim: Color(0xff0f1416),
      surfaceBright: Color(0xff353a3c),
      surfaceContainerLowest: Color(0xff0a0f10),
      surfaceContainerLow: Color(0xff171c1e),
      surfaceContainer: Color(0xff1b2022),
      surfaceContainerHigh: Color(0xff262b2c),
      surfaceContainerHighest: Color(0xff303637),
    );
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: _textTheme,
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
