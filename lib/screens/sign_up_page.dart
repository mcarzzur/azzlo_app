import 'package:azzlo_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUp();

}

class _SignUp extends State<SignUpPage> {
  final signUpForm = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
      });
    }
  }

  Future<void> _createUser() async {
    if(!signUpForm.currentState!.validate()) return;

    final data = await AuthService.signUp(
        fullName: fullNameController.text,
        username: userNameController.text,
        email: emailController.text,
        profilePicture: "asdasd",
        date: dateController.text,
        password: passwordController.text,
        description: descriptionController.text
    );

    if (data != null) {
      print("Usuario creado con éxito !");
      print(data);
    } else {
      print("El usuario no ha sido creado");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: signUpForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    hintText: "Nombre Completo"
                  ),
                ),
                TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(
                      hintText: "Nombre Usuario"
                  ),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Email"
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Confirmar email"
                  ),
                ),
                TextFormField(
                  controller: dateController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "Password"
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Confirmar Password"
                  ),
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      hintText: "Descripción"
                  ),
                ),
                ElevatedButton(onPressed: _createUser, child: Text("Crear usuario"))
              ],
            )
        ),
      ),
    );
  }
}