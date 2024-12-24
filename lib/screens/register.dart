import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'dart:convert';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      print("Button pressed"); // Debug print 1

                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      String confirmPassword = _confirmPasswordController.text;

                      print(
                          "Input values - Username: $username, Password length: ${password.length}"); // Debug print 2

                      if (username.isEmpty ||
                          password.isEmpty ||
                          confirmPassword.isEmpty) {
                        print("Empty fields detected"); // Debug print 3
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all fields!"),
                          ),
                        );
                        return;
                      }

                      try {
                        print("Attempting to send request..."); // Debug print 4
                        final scaffoldMessenger = ScaffoldMessenger.of(context);
                        final navigator = Navigator.of(context);

                        // Print request data
                        print(
                            "Request URL: http://10.0.2.2:8000/auth/register/"); // Debug print 5
                        print("Request body: ${jsonEncode({
                              'username': username,
                              'password': password,
                              'confirm_password': confirmPassword,
                            })}"); // Debug print 6

                        final response = await request.postJson(
                          "http://10.0.2.2:8000/auth/register/",
                          jsonEncode({
                            'username': username,
                            'password': password,
                            'confirm_password': confirmPassword,
                          }),
                        );

                        print("Raw response: $response"); // Debug print 7
                        print(response['status']);

                        if (!mounted) return;

                        if (response['status'] == 'success') {
                          print("Registration successful");
                          scaffoldMessenger.showSnackBar(
                            const SnackBar(
                              content: Text("Account created successfully!"),
                            ),
                          );

                          print("Attempting to navigate to login page...");
                          if (mounted) {
                            Navigator.of(context)
                                .pushReplacementNamed('/login');
                          }
                        } else {
                          print(
                              "Registration failed with message: ${response['message']}"); // Debug print 9
                          scaffoldMessenger.showSnackBar(
                            SnackBar(
                              content: Text(response['message'] ??
                                  "Failed to create account."),
                            ),
                          );
                        }
                      } catch (e) {
                        print("Error occurred: $e"); // Debug print 10
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Error connecting to server: $e"),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
