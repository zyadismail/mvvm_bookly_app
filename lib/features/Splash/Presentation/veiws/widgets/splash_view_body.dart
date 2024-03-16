import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_project/core/utils/app_router.dart';
import 'package:mvvm_project/features/Splash/Presentation/veiws/widgets/sliding_text_widget.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  //byhndl el rate bta3 t8yor el values
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset("assets/images/Logo.png"),
        const SizedBox(
          height: 4,
        ),
        SlidingText(slideAnimation: slideAnimation),
      ],
    );
  }

  void initAnimation() {
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    slideAnimation = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
        .animate(animationController);

    /// n8yr fy el haga el htglna
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }
}
