# Flutter framework
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.util.** { *; }

# Keep annotations
-keepattributes *Annotation*

# Dartz
-keep class dartz.** { *; }

# Equatable
-keep class equatable.** { *; }

# BLoC & Flutter BLoC
-keep class bloc.** { *; }
-keep class flutter_bloc.** { *; }

# GetIt & Injectable
-keep class get_it.** { *; }
-keep class injectable.** { *; }

# SharedPreferences
-keep class androidx.preference.** { *; }

# Drift & SQLite
-keep class drift.** { *; }
-keep class sqlite3.** { *; }
-keep class com.squareup.sqldelight.** { *; }

# Flutter SVG
-keep class com.horcrux.svg.** { *; }
-keep class androidsvg.** { *; }

# Keep all resources used by Flutter (images, fonts, etc.)
-keep class io.flutter.view.** { *; }

# Misc
-dontwarn android.support.**
-dontwarn androidx.**
-dontwarn io.flutter.plugins.**
-dontwarn com.squareup.**
-dontwarn org.xmlpull.**
-dontwarn kotlin.**
