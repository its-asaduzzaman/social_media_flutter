import 'package:flutter/material.dart';
import 'package:social_media_flutter/components/my_button.dart';
import 'package:social_media_flutter/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTop;

  LoginPage({super.key, required this.onTop});

  //text controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {}

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
              //logo
              Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 80,
              ),
              const SizedBox(height: 25),
              //app name
              const Text(
                "M I N I M A L",
                style: TextStyle(fontSize: 20),
              ),

              //email text field
              const SizedBox(height: 50),
              MyTextField(
                hintText: "email",
                obscureText: false,
                controller: emailController,
              ),

              //password text field
              const SizedBox(height: 10),
              MyTextField(
                hintText: "password",
                obscureText: true,
                controller: passwordController,
              ),

              //forgot password
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              //sign in button

              MyButton(
                text: "Login",
                onTap: login,
              ),
              const SizedBox(height: 25),

              //don't have an account ? register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: onTop,
                    child: const Text(
                      "Register here",
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
