import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicalapp/components/input_field.dart';
import 'package:musicalapp/constants/colors.dart';
import 'package:musicalapp/constants/form_validator.dart';
import 'package:musicalapp/constants/images.dart';
import 'package:musicalapp/constants/text_style.dart';
import 'package:musicalapp/navigation_bar.dart';
import 'package:musicalapp/screens/auth_screen/register.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Function to clear error state of email field
  void clearEmailError() {
    _formKey.currentState?.validate();
  }

  void clearPasswordError() {
    _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/logo/textLogo.png"),
                      const SizedBox(
                        height: 30,
                      ),

                      //email
                      CTextField(
                        hint: "Email here...",
                        preIcon: const Icon(
                          Icons.email,
                          color: textColor,
                        ),
                        validator: FormValidator.validateEmail,
                        controller: _emailController,
                        onChanged: clearEmailError,
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      //passowrd
                      CTextField(
                        hint: "******",
                        preIcon: const Icon(
                          Icons.lock,
                          color: textColor,
                        ),
                        suffIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.visibility_off,
                            color: textColor,
                          ),
                        ),
                        validator: FormValidator.validatePassword,
                        controller: _passwordController,
                        onChanged: clearPasswordError,
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      //forgot password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "forget password?",
                            style: ourStyle(color: textColor),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      //login button
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text
                            ).then((value) {
                              Get.offAll(() => const NavigationScreen());
                              print("Login Sucess");
                            }).onError((error, stackTrace) {
                              print("Error : ${error.toString()}");
                            });

                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(bgLoginColor),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.all(
                                      15)), // Add padding to the button
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Set border radius
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login",
                              style: ourStyle(color: textColor),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Icon(
                              Icons.arrow_right_alt,
                              color: textColor,
                            )
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      //signup with google button
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              secondaryBgColor),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.all(
                                      15)), // Add padding to the button
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Set border radius
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(googleImg),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Sign-in with Google...",
                              style: ourStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      TextButton(
                          onPressed: () {
                            Get.offAll(RegisterScreen());
                          },
                          child: Text(
                            "Create new account?",
                            style: ourStyle(color: const Color(0xffBEA000)),
                          ))
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
