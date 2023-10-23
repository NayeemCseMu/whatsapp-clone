import 'package:flutter/material.dart';
import '../core/routes/routes_name.dart';
import '../../utils/k_images.dart';
import '../../utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then(
        (value) => Navigator.popAndPushNamed(context, RouteNames.welcome));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(),
              Image.asset(KImages.logo),
              Spacer(),
              Text(
                'from',
                style: TextStyle(
                  color: Color(0xFF768289),
                  fontSize: 13,
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Utils.verticalSpace(12),
              Text(
                'FACEBOOK',
                style: TextStyle(
                  color: Color(0xFF02B099),
                  fontSize: 12,
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.40,
                ),
              ),
              Utils.verticalSpace(size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
