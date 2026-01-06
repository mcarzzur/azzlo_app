import 'package:azzlo_app/core/styles/app_colors.dart';
import 'package:azzlo_app/screens/login_page.dart';
import 'package:azzlo_app/screens/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const AzzloApp());
}

class AzzloApp extends StatelessWidget {
  const AzzloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Azzlo App",
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center
          ,
          children: [
            SvgPicture.asset(
              "assets/images/azzlo-logo.svg",
              height: 150,
              colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 150,
              child: ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                  ),
                );
              }, style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary
              ), child: Text(
                  "Iniciar sesión",
                  style: TextStyle(
                    color: AppColors.textPrimary
                  ),
              ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 150,
              child: ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                ),
              );

            }, style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary
            ), child: Text(
              "Registrarse",
              style: TextStyle(
                  color: AppColors.textPrimary
              ),
            ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

