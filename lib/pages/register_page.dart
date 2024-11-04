import 'package:flutter/material.dart';
import 'package:social_media_flutter/components/my_button.dart';
import 'package:social_media_flutter/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTop;

  RegisterPage({super.key, required this.onTop});

  // Text controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void register() {
    // Registration logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Icon(
                Icons.person_add,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 80,
              ),
              const SizedBox(height: 25),
              // App name or Title
              const Text(
                "M I N I M A L - Register",
                style: TextStyle(fontSize: 20),
              ),

              // Full name text field
              const SizedBox(height: 50),
              MyTextField(
                hintText: "Full Name",
                obscureText: false,
                controller: fullNameController,
              ),

              // Email text field
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: emailController,
              ),

              // Password text field
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),

              // Confirm password text field
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Confirm Password",
                obscureText: true,
                controller: confirmPasswordController,
              ),

              const SizedBox(height: 25),

              // Register button
              MyButton(
                text: "Register",
                onTap: register,
              ),
              const SizedBox(height: 25),

              // Already have an account? Login here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: onTop,
                    child: const Text(
                      "Login here",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
