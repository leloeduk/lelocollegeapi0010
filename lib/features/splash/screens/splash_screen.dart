import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import '../../home/screens/app_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      // ignore: use_build_context_synchronously
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => AppScreen()));
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green.shade900,
              AppColors.secondaryGreen,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              "assets/logos/lelocollege.png",
              width: 150,
              height: 150,
            ),
            SizedBox(height: 50),
            Center(
              child: Text(
                'LELO COLLÈGE',
                style: TextStyle(
                  color: Colors.green.shade900,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(color: AppColors.secondaryGreen),
            SizedBox(height: 10),
            Center(
              child: Text(
                'une application d\'éducative pour le collège',
                style: TextStyle(
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
