import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/registration_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const InstaflutApp());
}

class InstaflutApp extends StatelessWidget {
  const InstaflutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instaflut M-Pesa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF6200EE),
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFBB86FC),
          secondary: Color(0xFF03DAC6),
          surface: Color(0xFF1E1E1E),
        ),
        textTheme: GoogleFonts.outfitTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/register',
      routes: {
        '/register': (context) => const RegistrationScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
