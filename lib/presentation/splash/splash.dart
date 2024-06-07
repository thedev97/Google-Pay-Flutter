import 'package:flutter/scheduler.dart';
import 'package:g_pay/core/g_pay_export.dart';
import 'package:g_pay/presentation/main_screen/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        finish(context);
        const MainScreen().launch(context);
      }
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.center,
          children: [
            GPayImageView(imagePath: GPayImageConstant.gPaySplash, height: 200)
                .center(),
            Positioned(
              bottom: 40,
              child: Text("Google",
                  style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 30,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700)),
            )
          ],
        ),
      ),
    );
  }
}
