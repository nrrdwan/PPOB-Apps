import 'package:flutter/material.dart';
import 'package:ppob_app/core/widgets/custom_button.dart';
import 'package:ppob_app/core/widgets/custom_text_field.dart';
import 'package:ppob_app/shared/constants/app_constants.dart';
import 'package:ppob_app/features/auth/presentation/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool isChecked = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama lengkap tidak boleh kosong';
    }
    if (value.length < 3) {
      return 'Nama lengkap minimal 3 karakter';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Format email tidak valid';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Kata sandi tidak boleh kosong';
    }
    if (value.length < 6) {
      return 'Kata sandi minimal 6 karakter';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Konfirmasi kata sandi tidak boleh kosong';
    }
    if (value != _passwordController.text) {
      return 'Konfirmasi kata sandi tidak sesuai';
    }
    return null;
  }

  void _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulasi register
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // TODO: Implement actual register logic
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Pendaftaran berhasil!'),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate to login page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.register)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                // Header
                Center(
                  child: Text(
                    'Daftar Akun',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Full Name Field
                CustomTextField(
                  label: AppStrings.fullName,
                  hint: 'Masukkan nama lengkap Anda',
                  controller: _fullNameController,
                  validator: _validateFullName,
                  fontSize: 16,
                  labelFontSize: 15,
                  labelFontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 24),

                // Email Field
                CustomTextField(
                  label: AppStrings.email,
                  hint: 'Masukkan email Anda',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                  fontSize: 16,
                  labelFontSize: 15.0,
                  labelFontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 24),

                // Password Field
                CustomTextField(
                  label: AppStrings.password,
                  hint: 'Masukkan kata sandi Anda',
                  controller: _passwordController,
                  isPassword: true,
                  validator: _validatePassword,
                  fontSize: 16,
                  labelFontSize: 15.0,
                  labelFontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 24),

                // Confirm Password Field
                CustomTextField(
                  label: AppStrings.confirmPassword,
                  hint: 'Konfirmasi kata sandi Anda',
                  controller: _confirmPasswordController,
                  isPassword: true,
                  validator: _validateConfirmPassword,
                  fontSize: 16,
                  labelFontSize: 15.0,
                  labelFontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 30),

                // Checkbox + Syarat & Ketentuan
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Checkbox
                    Checkbox(
                      value: isChecked,
                      activeColor: const Color(0xFF5938FB),
                      onChanged: (value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                    ),

                    // Teks dengan highlight di "Syarat & Ketentuan"
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'Dengan mendaftar kamu sudah menyetujui ',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                          children: [
                            TextSpan(
                              text: 'Syarat & Ketentuan',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF5938FB), // Warna ungu
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const TextSpan(
                              text: '.',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // Register Button
                CustomButton(
                  text: AppStrings.register,
                  fontWeight: FontWeight.w600,
                  onPressed: _handleRegister,
                  isLoading: _isLoading,
                ),
                const SizedBox(height: 24),

                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.alreadyHaveAccountQuestion,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(AppStrings.login),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
