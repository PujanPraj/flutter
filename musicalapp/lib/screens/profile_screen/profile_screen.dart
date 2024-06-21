import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musicalapp/constants/colors.dart';
import 'package:musicalapp/constants/text_style.dart';
import 'package:get/get.dart';
import 'package:musicalapp/screens/auth_screen/login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text("Profile",style: ourStyle(),),
      ),
      body: Center(
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            if(snapshot.hasData){
              User? user = snapshot.data as User?;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome, ${user!.email}",style: ourStyle(),),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: (){
                        FirebaseAuth.instance.signOut().then((value) {
                          print("Logout Success");
                          Get.offAll(()=> LoginScreen());
                        }).onError((error, stackTrace) {
                          print("Error : ${error.toString()}");
                        });
                      },
                      child: Text("Logout")
                  ),
                ],
              );
            }
            return Text("User not logged in");
          },
      ),
      ),
    );
  }
}
