import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quy_chat/core/constants/app_colors.dart';
import 'package:quy_chat/core/constants/app_dimensions.dart';
import 'package:quy_chat/feature/auth/presentasion/bloc/auth_cubit.dart';
import 'package:quy_chat/feature/auth/presentasion/bloc/auth_state.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: body(),
    );
  }

  void handleSignUp() {
    print(usernameController.text);
  }

  Widget body() {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text(
                  "Sign up to Celebration",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    height: 0.1,
                  ),
                ),
                Row(
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          // Navigator.pop(context);
                        },
                        child: Text("Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )))
                  ],
                ),
                Text(
                  "Username",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(
                        AppDimensions.textFieldBorderRadius),
                  ),
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        hintText: "Enter your username",
                        enabledBorder: InputBorder.none,
                        prefixIcon: Icon(Icons.person),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 30,
                          minWidth: 40,
                        )),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(
                        AppDimensions.textFieldBorderRadius),
                  ),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: "Enter your password",
                        enabledBorder: InputBorder.none,
                        prefixIcon: Icon(Icons.fingerprint),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 30,
                          minWidth: 40,
                        )),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Confirm password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(
                        AppDimensions.textFieldBorderRadius),
                  ),
                  child: TextField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                        hintText: "Confirm password",
                        enabledBorder: InputBorder.none,
                        prefixIcon: Icon(Icons.fingerprint),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 30,
                          minWidth: 40,
                        )),
                  ),
                ),
                SizedBox(height: 20),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthInitialState) {
                      return InkWell(
                        onTap: () {
                          context.read<AuthCubit>().increment("a");
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: AppColors.buttonActiveColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
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
                    if (state is AuthloadingState) {
                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: AppColors.buttonDisabledColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: AppColors.textButtonDisabledColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
