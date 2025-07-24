import 'package:flutter/material.dart';
import 'package:app/models/settings_page.dart';
import 'package:app/screens/temperature_sensor.dart';

/// This is the SearchPage widget
class SearchPage extends StatelessWidget {
  // Callback function to handle theme changes
  final Function(bool) onThemeChanged;

  /// Constructor to initialize the onThemeChanged callback
  SearchPage({required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    /// The main structure of the page is a Scaffold
    return Scaffold(
      backgroundColor: const Color(0xFF1A0341),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A0341),
        elevation: 0,
        title: const Text('Search', style: TextStyle(color: Colors.white)),
      ),

      /// SafeArea ensures the content does not overlap with system UI
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ).copyWith(top: 190),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///search bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  const Center(
                    child: Text(
                      'Résultats de recherche ici...',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    ///Available sensors
                    'Capteurs disponibles',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// ListTile for the Temperature Senso
                  ListTile(
                    tileColor: Colors.white24,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: const Icon(Icons.thermostat, color: Colors.white),
                    title: const Text(
                      'Temperature Sensor',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TemperatureSensor(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),

            // Logo
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/logo_app.PNG',
                width: 271,
                height: 178,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            SettingsPage(onThemeChanged: onThemeChanged),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
