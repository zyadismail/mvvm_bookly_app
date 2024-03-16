import 'package:flutter/material.dart';
import 'package:mvvm_project/features/Splash/Presentation/veiws/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}