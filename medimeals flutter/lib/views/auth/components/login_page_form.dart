import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/themes/app_themes.dart';
import '../../../core/utils/validators.dart';
import 'login_button.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPageForm extends StatefulWidget {
  const LoginPageForm({
    Key? key,
  }) : super(key: key);

  @override
  _LoginPageFormState createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPasswordShown = false;

  void onPassShowClicked() {
    isPasswordShown = !isPasswordShown;
    setState(() {});
  }

  void onLogin() async {
    final bool isFormOkay = _formKey.currentState?.validate() ?? false;
    if (isFormOkay) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        // You can access the signed in user via userCredential.user
        Navigator.pushNamed(context, AppRoutes.entryPoint);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.defaultTheme.copyWith(
        inputDecorationTheme: AppTheme.secondaryInputDecorationTheme,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDefaults.padding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Email Field
              const Text(
                "Email",
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Make text bold
                  fontSize: 16, // Increase font size
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                validator: Validators.email,
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  fontSize: 16, // Increase font size
                ),
              ),
              const SizedBox(height: AppDefaults.padding),

              // Password Field
              const Text(
                "Password",
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Make text bold
                  fontSize: 16, // Increase font size
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordController,
                validator: Validators.password,
                onFieldSubmitted: (v) => onLogin(),
                textInputAction: TextInputAction.done,
                obscureText: !isPasswordShown,
                style: const TextStyle(
                  fontSize: 16, // Increase font size
                ),
                decoration: InputDecoration(
                  suffixIcon: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: onPassShowClicked,
                      icon: SvgPicture.asset(
                        AppIcons.eye,
                        width: 24,
                      ),
                    ),
                  ),
                ),
              ),

              // Forget Password labelLarge
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.forgotPassword);
                  },
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Make text bold
                      fontSize: 16, // Increase font size
                    ),
                  ),
                ),
              ),

              // Login labelLarge
              LoginButton(
                onPressed: onLogin,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold, // Make text bold
                  fontSize: 16, // Increase font size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}