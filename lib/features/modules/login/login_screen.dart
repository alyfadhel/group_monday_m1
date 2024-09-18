import 'package:flutter/material.dart';
import 'package:group_monday_m1/core/shared/widgets/my_button.dart';
import 'package:group_monday_m1/core/shared/widgets/my_text_button.dart';
import 'package:group_monday_m1/core/shared/widgets/my_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

var emailController = TextEditingController();
var passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();
bool isPassword = true;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.00,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Login to browse hot offer',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MyTextFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    label: 'Email',
                    isUpperCase: false,
                    prefix: Icons.email,
                    radius: 10.0,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email must be not empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MyTextFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    label: 'password',
                    prefix: Icons.lock,
                    radius: 10.0,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password must be not empty';
                      }
                      return null;
                    },
                    suffix: isPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    isPassword: isPassword,
                    onTap: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MyButton(
                    onPressed: () {},
                    text: 'login',
                    radius: 10.0,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MyButton(
                    onPressed: () {},
                    text: 'signIn',
                    width: 250.0,
                    background: Colors.green,
                    radius: 10.0,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(
                    height: 120.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?!',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MyTextButton(
                        onPressed: () {},
                        text: 'Register',
                        isUpperCase: false,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
