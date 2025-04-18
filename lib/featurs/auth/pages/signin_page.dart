import 'package:fikratech/featurs/auth/pages/signup_page.dart';
import 'package:fikratech/featurs/auth/widgets/button.dart';
import 'package:fikratech/featurs/auth/widgets/email_field.dart';
import 'package:fikratech/featurs/auth/widgets/password_field.dart';
import 'package:fikratech/featurs/auth/widgets/third_party_button.dart';
import 'package:fikratech/featurs/profile/pages/view_profiel.dart';
import 'package:flutter/material.dart';
import 'package:fikratech/core/common/widgets/wavy_appbar.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const WavyAppBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 24.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const EmailField(),
                    const SizedBox(height: 16),

                    CustomPaasswordField(
                      passwordController: _passwordController,
                      obscurePassword: _obscurePassword,
                      visibilityChange: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    const SizedBox(height: 24),

                    CustomActionButton(
                      formKey: _formKey,
                      buttonname: 'Sign In',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Perform sign-in action
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ViewProfile(),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 4),

                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            thickness: 1,
                            endIndent: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const Text('Or', style: TextStyle(fontSize: 16)),
                        const Expanded(
                          child: Divider(
                            thickness: 1,
                            indent: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        ThirdPartyButton(
                          fieldname: 'Continue with Google',
                          imagePath: 'assets/images/devicon_google.png',
                        ),
                        SizedBox(height: 12),
                        ThirdPartyButton(
                          fieldname: 'Continue with Apple',
                          imagePath: 'assets/images/ri_apple-fill.png',
                        ),
                        SizedBox(height: 12),
                        ThirdPartyButton(
                          fieldname: 'Continue with Facebook',
                          imagePath: 'assets/images/ic_outline-facebook.png',
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupPage(),
                              ),
                            );
                          },
                          child: const Text('Sign Up'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
