
import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/login_screen.dart';

void main() {
  runApp(const BatConnectApp());
}

class BatConnectApp extends StatelessWidget {
  const BatConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bat Connect',
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}
