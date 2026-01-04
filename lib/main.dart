import 'package:azzlo_app/screens/login_page.dart';
import 'package:azzlo_app/screens/sign_up_page.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center
          ,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                ),
              );
            }, style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo[600]
            ), child: Text(
                "Iniciar sesión",
                style: TextStyle(
                  color: Colors.white
                ),
            ),
            ),

            SizedBox(
              height: 20,
            ),

            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                ),
              );

            }, style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[600]
            ), child: Text(
              "Registrarse",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

