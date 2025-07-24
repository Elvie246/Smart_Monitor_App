import 'package:flutter/material.dart';
import 'package:app/models/search_page.dart';

/// HomePage is the main screen of the app
/// It allows users to log in, create an account or continue without logging in.
class HomePage extends StatelessWidget {
  /// Callback function to change the theme
  final Function(bool) onThemeChanged;

  /// Constructor that takes `onThemeChanged` as a parameter
  const HomePage({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Background color
      backgroundColor: const Color(0xFF1A0341),

      /// body contains all widgets displayed on the screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// app Logo
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Image.asset(
                'assets/logo_app.PNG',
                width: 494,
                height: 324,
              ),
            ),

            /// button for username
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF1A0341),
                fixedSize: const Size(346, 65),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              onPressed: () {
                /// Action pour username
              },
              child: const Text('Identifiant'),
            ),
            const SizedBox(height: 20),

            /// Button for password
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF1A0341),
                fixedSize: const Size(346, 65),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                /// Action for password
              },
              child: const Text('Mot de passe'),
            ),
            const SizedBox(height: 20),

            /// other buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// login button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A0341),
                    foregroundColor: Colors.white,
                    fixedSize: const Size(153, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    /// Action for login
                  },
                  child: const Text('Se connecter'),
                ),
                const SizedBox(width: 20),

                /// Create account button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEC221F),
                    foregroundColor: Colors.white,
                    fixedSize: const Size(153, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    /// Action for account creation
                  },
                  child: const Text('Créer un identifiant'),
                ),
              ],
            ),
            const SizedBox(height: 40),

            /// Continue without logging in" button with an arrow icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// right arrow icon (arrow_forward)
                const Icon(Icons.arrow_forward, color: Colors.white, size: 24),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    /// Navigation to search page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                SearchPage(onThemeChanged: onThemeChanged),
                      ),
                    );
                  },
                  child: const Text(
                    'Continuer sans se connecter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
