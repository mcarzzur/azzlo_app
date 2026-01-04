import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _Login();

}

class _Login extends State<LoginPage> {
  final loginForm = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (!loginForm.currentState!.validate()) return;

    final data = await AuthService.login(
      username: userController.text,
      password: passwordController.text,
    );
    if (data != null) {
      print("Usuario logeado correctamente:");
      print(data["user"]);
      print("Token:");
      print(data["token"]);
    } else {
      print("Login fallido");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
            key: loginForm,
            child: Column(
              children: [
                TextFormField(
                  controller: userController,
                  decoration: const InputDecoration(hintText: "Nombre de usuario"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Este campo es obligatorio";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(hintText: "Contraseña"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Este campo es obligatorio";
                    }
                    return null;
                  },
                ),
                ElevatedButton(onPressed: login, child: Text("Enviar")
                ),
              ],
            ),
        ),
      ),
    );
  }
}