import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // Variable pour le mode sombre
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(), // Thème clair
      darkTheme: ThemeData.dark(), // Thème sombre
      home: HomePage(
        onThemeChanged: (bool isDarkMode) {
          setState(() {
            _isDarkMode = isDarkMode;
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final Function(bool) onThemeChanged;

  const HomePage({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0341), // Fond de la page
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Titre de la section
            const Text(
              'Page d\'accueil',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),

            // Bouton pour accéder aux paramètres
            ElevatedButton(
              onPressed: () {
                // Naviguer vers la page SettingsPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            SettingsPage(onThemeChanged: onThemeChanged),
                  ),
                );
              },
              child: const Text('Accéder aux Paramètres'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  final Function(bool) onThemeChanged;

  const SettingsPage({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0341), // Fond de la page
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A0341),
        title: const Text('Paramètres', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Titre de la section
            const Text(
              'Paramètres de l\'application',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),

            // Switch pour le mode sombre
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Mode Sombre',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Switch(
                  value: Theme.of(context).brightness == Brightness.dark,
                  onChanged: (value) {
                    // Lorsque l'utilisateur modifie l'état du switch, on appelle la fonction de rappel
                    onThemeChanged(value);
                  },
                  activeColor: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Autres paramètres peuvent être ajoutés ici
            const Text(
              'Autres options à ajouter...',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
