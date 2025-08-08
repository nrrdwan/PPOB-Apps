import 'package:flutter/material.dart';
import 'package:ppob_app/shared/theme/app_theme.dart';
import 'package:ppob_app/shared/constants/app_constants.dart';
import 'package:ppob_app/features/onboarding/presentation/pages/onboarding_screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.lightTheme,
      home: const OnboardingScreens(),
      debugShowCheckedModeBanner: false,
    );
  }
}
