import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/temperature_sensor.dart';

/// Entry point of the Flutter application
void main() {
  /// Runs the MyApp widget as the root of the application
  runApp(const MyApp());
}

/// Root widget of the application
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// Boolean variable to track if dark mode is enabled
  bool _isDarkMode = false;

  /// Callback function to handle theme changes
  void _onThemeChanged(bool isDark) {
    setState(() {
      _isDarkMode = isDark;
    });
    Logger.log("Theme changed to ${isDark ? 'Dark' : 'Light'} mode");
  }

  @override
  Widget build(BuildContext context) {
    /// Builds the main structure of the app
    return MaterialApp(
      title: 'My App',
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: HomePage(onThemeChanged: _onThemeChanged),
    );
  }
}

/// Custom Logger class for debugging
/// Logs messages only in debug mode
class Logger {
  static void log(String message) {
    if (kDebugMode) {
      print('[DEBUG] $message');
    }
  }
}
