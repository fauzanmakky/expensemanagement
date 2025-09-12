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
      titleLarge: ExpenseManagementTextStyles.titleLarge,
      titleMedium: ExpenseManagementTextStyles.titleMedium,
      titleSmall: ExpenseManagementTextStyles.titleSmall,
      bodyLarge: ExpenseManagementTextStyles.bodyLargeBold,
      bodyMedium: ExpenseManagementTextStyles.bodyLargeMedium,
      bodySmall: ExpenseManagementTextStyles.bodyLargeRegular,
      labelLarge: ExpenseManagementTextStyles.labelLarge,
      labelMedium: ExpenseManagementTextStyles.labelMedium,
      labelSmall: ExpenseManagementTextStyles.labelSmall,
    );
  }

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006577),
      surfaceTint: Color(0xff00687a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff008096),
      onPrimaryContainer: Color(0xfff9fdff),
      secondary: Color(0xff3f646e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc2e9f5),
      onSecondaryContainer: Color(0xff456a74),
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
      secondaryFixed: Color(0xffc2e9f5),
      onSecondaryFixed: Color(0xff001f26),
      secondaryFixedDim: Color(0xffa7cdd8),
      onSecondaryFixedVariant: Color(0xff264c55),
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

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003c47),
      surfaceTint: Color(0xff00687a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00788c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff133b44),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4e737d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4e2265),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff895aa1),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6fafc),
      onSurface: Color(0xff0d1213),
      onSurfaceVariant: Color(0xff2d383b),
      outline: Color(0xff495458),
      outlineVariant: Color(0xff646f73),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3133),
      inversePrimary: Color(0xff68d5ef),
      primaryFixed: Color(0xff00788c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff005d6e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4e737d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff355a64),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff895aa1),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6f4287),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc2c7c9),
      surfaceBright: Color(0xfff6fafc),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f6),
      surfaceContainer: Color(0xffe4e9eb),
      surfaceContainerHigh: Color(0xffd9dddf),
      surfaceContainerHighest: Color(0xffced2d4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00313b),
      surfaceTint: Color(0xff00687a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00515f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff05313a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff294e58),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff43175a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff62367a),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff6fafc),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff232e31),
      outlineVariant: Color(0xff404b4e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3133),
      inversePrimary: Color(0xff68d5ef),
      primaryFixed: Color(0xff00515f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003843),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff294e58),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff0f3741),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff62367a),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4a1e61),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb5b9bb),
      surfaceBright: Color(0xfff6fafc),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffedf1f3),
      surfaceContainer: Color(0xffdfe3e5),
      surfaceContainerHigh: Color(0xffd0d5d7),
      surfaceContainerHighest: Color(0xffc2c7c9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff68d5ef),
      surfaceTint: Color(0xff68d5ef),
      onPrimary: Color(0xff003640),
      primaryContainer: Color(0xff1e9eb7),
      onPrimaryContainer: Color(0xff00272f),
      secondary: Color(0xffa7cdd8),
      onSecondary: Color(0xff0c353e),
      secondaryContainer: Color(0xff264c55),
      onSecondaryContainer: Color(0xff95bbc6),
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
      secondaryFixed: Color(0xffc2e9f5),
      onSecondaryFixed: Color(0xff001f26),
      secondaryFixedDim: Color(0xffa7cdd8),
      onSecondaryFixedVariant: Color(0xff264c55),
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

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff95e9ff),
      surfaceTint: Color(0xff68d5ef),
      onPrimary: Color(0xff002a33),
      primaryContainer: Color(0xff1e9eb7),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffbce3ee),
      onSecondary: Color(0xff002a33),
      secondaryContainer: Color(0xff7197a1),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff3d1ff),
      onTertiary: Color(0xff3c0e53),
      tertiaryContainer: Color(0xffaf7ec7),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1416),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd3dee2),
      outline: Color(0xffa8b4b8),
      outlineVariant: Color(0xff879296),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e5),
      inversePrimary: Color(0xff004f5e),
      primaryFixed: Color(0xffabedff),
      onPrimaryFixed: Color(0xff001419),
      primaryFixedDim: Color(0xff68d5ef),
      onPrimaryFixedVariant: Color(0xff003c47),
      secondaryFixed: Color(0xffc2e9f5),
      onSecondaryFixed: Color(0xff001419),
      secondaryFixedDim: Color(0xffa7cdd8),
      onSecondaryFixedVariant: Color(0xff133b44),
      tertiaryFixed: Color(0xfff6d9ff),
      onTertiaryFixed: Color(0xff210033),
      tertiaryFixedDim: Color(0xffe7b3ff),
      onTertiaryFixedVariant: Color(0xff4e2265),
      surfaceDim: Color(0xff0f1416),
      surfaceBright: Color(0xff404547),
      surfaceContainerLowest: Color(0xff040809),
      surfaceContainerLow: Color(0xff191e20),
      surfaceContainer: Color(0xff24292a),
      surfaceContainerHigh: Color(0xff2e3335),
      surfaceContainerHighest: Color(0xff393e40),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd6f5ff),
      surfaceTint: Color(0xff68d5ef),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff64d1eb),
      onPrimaryContainer: Color(0xff000d12),
      secondary: Color(0xffd6f5ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffa3c9d4),
      onSecondaryContainer: Color(0xff000d12),
      tertiary: Color(0xfffceaff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffe4affd),
      onTertiaryContainer: Color(0xff180027),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0f1416),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe6f2f6),
      outlineVariant: Color(0xffb9c5c8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e5),
      inversePrimary: Color(0xff004f5e),
      primaryFixed: Color(0xffabedff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff68d5ef),
      onPrimaryFixedVariant: Color(0xff001419),
      secondaryFixed: Color(0xffc2e9f5),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffa7cdd8),
      onSecondaryFixedVariant: Color(0xff001419),
      tertiaryFixed: Color(0xfff6d9ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe7b3ff),
      onTertiaryFixedVariant: Color(0xff210033),
      surfaceDim: Color(0xff0f1416),
      surfaceBright: Color(0xff4c5153),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1b2022),
      surfaceContainer: Color(0xff2c3133),
      surfaceContainerHigh: Color(0xff373c3e),
      surfaceContainerHighest: Color(0xff424849),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: _textTheme,
    scaffoldBackgroundColor: colorScheme.background,
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
