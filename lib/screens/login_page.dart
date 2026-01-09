import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/styles/app_colors.dart';
import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _Login();

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
      appBar: AppBar(),
      body: Center(
        child: Form(
            key: loginForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SvgPicture.asset(
                  "assets/images/azzlo-logo.svg",
                  height: 150,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn),
                ),

                SizedBox(
                  width: 250,
                  child: TextFormField(
                  controller: userController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.surface,
                    hintText: "Nombre de usuario",

                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.primaryLight
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 2
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.error
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.primary
                        ),
                        borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Este campo es obligatorio";
                    }
                    return null;
                  },
                ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.surface,
                        hintText: "Contraseña",

                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.primaryLight
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.primary,
                              width: 2
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.error
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),

                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primary
                          ),
                          borderRadius: BorderRadius.circular(12)
                        ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Este campo es obligatorio";
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary
                    ),
                    child: Text(
                      "Enviar",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                      ),
                    ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}