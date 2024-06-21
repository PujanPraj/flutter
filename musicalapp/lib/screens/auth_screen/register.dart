import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicalapp/components/input_field.dart';
import 'package:musicalapp/constants/colors.dart';
import 'package:musicalapp/constants/form_validator.dart';
import 'package:musicalapp/constants/text_style.dart';
import 'package:musicalapp/screens/auth_screen/login.dart';
import 'package:musicalapp/screens/home_screen/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();

  void clearUsernameError() {
    _formKey.currentState!.validate();
  }

  void clearEmailError() {
    _formKey.currentState!.validate();
  }

  void clearPasswordError() {
    _formKey.currentState!.validate();
  }

  void clearPhoneError() {
    _formKey.currentState!.validate();
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

                      //username
                      CTextField(
                        hint: "Username...",
                        preIcon: const Icon(
                          Icons.person,
                          color: textColor,
                        ),
                        validator: FormValidator.validateUsername,
                        controller: _usernameController,
                        onChanged: clearUsernameError,
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      //email
                      CTextField(
                        hint: "Email...",
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

                      //phone
                      CTextField(
                        hint: "Phone...",
                        keyboardType: TextInputType.phone,
                        preIcon: const Icon(
                          Icons.phone,
                          color: textColor,
                        ),
                        validator: FormValidator.validatePhone,
                        controller: _phoneController,
                        onChanged: clearPhoneError,
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      //password
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
                        height: 30,
                      ),

                      //register button
                      ElevatedButton(
                        onPressed: () {

                          if (_formKey.currentState!.validate()) {
                            FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text
                            ).then((value) {
                              Get.offAll(()=>LoginScreen());
                              print("Regiser success");
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
                              "Register",
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
                        height: 20,
                      ),

                      TextButton(
                          onPressed: () {
                            Get.offAll(() => LoginScreen());
                          },
                          child: Text(
                            "Already have account?",
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
