import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';


import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/address_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/form_screen.dart';   // ← ADD THIS
import 'cart_screen.dart';
import 'cart_manager.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartManager(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightTheme = FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: Color(0xFFFFD900),
        primaryContainer: Color(0xFFFFCF9E),
        secondary: Color(0xFFFFF9F0),
        secondaryContainer: Color(0xFFF2F6FC),
        tertiary: Color(0xFFFFB74D),
        error: Color(0xFFB00020),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 8,
      appBarStyle: FlexAppBarStyle.material,
      appBarOpacity: 0.95,
      transparentStatusBar: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: true,
        cardRadius: 16,
        inputDecoratorIsFilled: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        navigationBarIndicatorOpacity: 0.12,
      ),
    );

    final darkTheme = FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: Color(0xFFFFD900),
        primaryContainer: Color(0xFFFFCF9E),
        secondary: Color(0xFF2C2C2C),
        secondaryContainer: Color(0xFF1E1E1E),
        tertiary: Color(0xFFFFB74D),
        error: Color(0xFFCF6679),
      ),
      useMaterial3: true,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) => HomeScreen(),
        '/cart': (context) => CartScreen(),
        '/address': (context) => AddressScreen(),
        '/profile': (context) => ProfileScreen(),
        '/form': (context) => const FormScreen(),  // ← ADD THIS
      },
    );
  }
}
