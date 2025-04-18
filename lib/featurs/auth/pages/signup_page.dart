import 'package:fikratech/featurs/auth/pages/signin_page.dart';
import 'package:fikratech/featurs/auth/widgets/button.dart';
import 'package:fikratech/featurs/auth/widgets/email_field.dart';
import 'package:fikratech/featurs/auth/widgets/password_field.dart';
import 'package:fikratech/featurs/auth/widgets/text_field.dart';
import 'package:fikratech/featurs/auth/widgets/third_party_button.dart';
import 'package:fikratech/featurs/profile/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:fikratech/core/common/widgets/wavy_appbar.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                    CustomTextField(
                      nameController: _nameController,
                      fieldname: 'Full Name',
                    ),
                    const SizedBox(height: 16),

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
                      buttonname: 'Sign Up',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Settings(),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 4),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SigninPage(),
                              ),
                            );
                          },
                          child: const Text('Log In'),
                        ),
                      ],
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
                          fieldname: 'Sign up with Google',
                          imagePath: 'assets/images/devicon_google.png',
                        ),
                        SizedBox(height: 12),
                        ThirdPartyButton(
                          fieldname: 'Sign up with Apple',
                          imagePath: 'assets/images/ri_apple-fill.png',
                        ),
                        SizedBox(height: 12),
                        ThirdPartyButton(
                          fieldname: 'Sign up with Facebook',
                          imagePath: 'assets/images/ic_outline-facebook.png',
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
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
