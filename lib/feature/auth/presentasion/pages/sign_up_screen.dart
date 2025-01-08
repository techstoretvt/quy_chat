import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quy_chat/core/constants/app_colors.dart';
import 'package:quy_chat/core/constants/app_dimensions.dart';
import 'package:quy_chat/core/utils/dialog_helper.dart';
import 'package:quy_chat/feature/auth/presentasion/bloc/auth_cubit.dart';
import 'package:quy_chat/feature/auth/presentasion/bloc/auth_state.dart';
import 'package:quy_chat/injection_container.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController usernameController =
      TextEditingController(text: "thoaitran7");
  final TextEditingController passwordController =
      TextEditingController(text: "Thoai123456");
  final TextEditingController confirmPasswordController =
      TextEditingController(text: "Thoai123456");

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: body(),
    );
  }

  void handleSignUp(BuildContext context) {
    String username = usernameController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      DialogHelper.showCustomDialog(
          title: "Khoan!",
          message: "Vui lòng điền đầy đủ thông tin",
          context: context);
      return;
    }

    if (password != confirmPassword) {
      DialogHelper.showCustomDialog(
          title: "Khoan!", message: "Mật khẩu không khớp", context: context);
      return;
    }

    // check strong password

    //

    context.read<AuthCubit>().signUp(username: username, password: password);
  }

  Widget body() {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
          if (state is AuthSuccessState) {
            // redirect login page
          }
        }, builder: (context, state) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    "Sign up to Celebration",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      height: 0.1,
                    ),
                  ),
                  Row(
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            // Navigator.pop(context);
                          },
                          child: const Text("Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              )))
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Username",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(
                          AppDimensions.textFieldBorderRadius),
                    ),
                    child: TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                          hintText: "Enter your username",
                          enabledBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.person),
                          prefixIconConstraints: BoxConstraints(
                            maxHeight: 30,
                            minWidth: 40,
                          )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(
                          AppDimensions.textFieldBorderRadius),
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter your password",
                          enabledBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.fingerprint),
                          prefixIconConstraints: BoxConstraints(
                            maxHeight: 30,
                            minWidth: 40,
                          )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Confirm password",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(
                          AppDimensions.textFieldBorderRadius),
                    ),
                    child: TextField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Confirm password",
                          enabledBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.fingerprint),
                          prefixIconConstraints: BoxConstraints(
                            maxHeight: 30,
                            minWidth: 40,
                          )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  buttonFormState(state, context),
                  const SizedBox(height: 10),
                  if (state is AuthErrorState)
                    Text(
                      state.message,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget buttonFormState(AuthState state, BuildContext context) {
    if (state is AuthloadingState) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.buttonActiveColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  color: AppColors.textButtonActiveColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 12, // Chiều rộng vòng loading
                height: 12, // Chiều cao vòng loading
                child: CircularProgressIndicator(
                  strokeWidth: 1.5, // Độ dày của vòng
                  color: Colors.white, // Màu sắc của vòng
                ),
              ),
            ],
          ),
        ),
      );
    }

    return InkWell(
      onTap: () {
        handleSignUp(context);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.buttonActiveColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: AppColors.textButtonActiveColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
