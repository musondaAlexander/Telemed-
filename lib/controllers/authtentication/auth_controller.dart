// This controller will be used to Authenticate the User for signin, Login , Logout and other operations.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telemed/authentication/ui/Screens/Login/login_screen.dart';
import 'package:telemed/authentication/ui/Screens/Welcome/welcome_screen.dart';
import 'package:telemed/pages/home.dart';

class AuthController extends GetxController {
  // controllers for signup
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // controllers for loogin in
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //Need to instantiate the controller
  static AuthController instance = Get.find();
  DatabaseReference ref = FirebaseDatabase.instance.ref('Users');
  late Rx<User?> _user;
  // create an instance of firebase auth
  FirebaseAuth auth = FirebaseAuth.instance;

  // attach a Stream binder to user
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

// create the initialScreen Method To check if the user is logged in or not
  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const WelcomeScreen());
    } else {
      //handleUsers();
      Get.offAll(() => const Home());
      // Get.offAll(() => Home(email:user.email!));
    }
  }

  // Signin Method
  void signUp(
    String email,
    String password,
  ) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        ref
            .child(value.user!.uid.toString())
            .set({'email': value.user!.email.toString()});
        // Get.offAll(()=>const LogingScreen());
        Get.snackbar("Success", "Sign Up Successfully");
      }).onError((error, stackTrace) {
        if (error.toString().contains("email-already-in-use")) {
          Get.snackbar("Error", "Email Already In Use");
        } else if (error.toString().contains("weak-password")) {
          Get.snackbar("Error", "Password Should Be At Least 6 Characters");
        } else if (error.toString().contains("invalid-email")) {
          Get.snackbar("Error", "Invalid Email");
        } else if (error.toString().contains("network-request-failed")) {
          Get.snackbar("Error", "Check Your Internet Connection");
        } else {
          Get.snackbar("Error", error.toString());
        }
      });
    } catch (error) {
      Get.snackbar("Error", error.toString());
      debugPrint(error.toString());
    }
  }

  // ===========================================================================
  // Login Method
  // ===========================================================================

  void login(String email, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        Get.snackbar("Success", "Login Successfully:");
      }).onError((error, stackTrace) {
        Get.snackbar(
            "Error", "INVALID LOGIN CREDENTIALS\nCheck Email & Password");
      });
    } on FirebaseAuthException catch (e) {
      // print('Failed with error code: ${e.code}');
      // print(e.message);
      if (e.code == null) {
        Get.snackbar("Error", "Please Enter Email & Password");
      } else if (e.code == "user-not-found") {
        Get.snackbar("Error", "INVALID LOGIN CREDENTIALS");
      } else if (e.code == "INVALID_LOGIN_CREDENTIALS") {
        Get.snackbar("Error", "Wrong Password");
      } else if (e.code == "invalid-email") {
        Get.snackbar("Error", "Invalid Email");
      } else if (e.code == "network-request-failed") {
        Get.snackbar("Error", "Network Error");
      } else if (e.code == "too-many-requests") {
        Get.snackbar("Error", "Too Many Requests");
      } else if (e.code == "user-disabled") {
        Get.snackbar("Error", "User Disabled");
      } else if (e.code == "operation-not-allowed") {
        Get.snackbar("Error", "Operation Not Allowed");
      } else if (e.code == "invalid-credential") {
        Get.snackbar("Error", "Invalid Credential");
      } else if (e.code == "account-exists-with-different-credential") {
        Get.snackbar("Error", "Account Exists With Different Credential");
      } else if (e.code == "requires-recent-login") {
        Get.snackbar("Error", "Requires Recent Login");
      } else if (e.code == "email-already-in-use") {
        Get.snackbar("Error", "Email Already In Use");
      } else if (e.code == "weak-password") {
        Get.snackbar("Error", "Password Should Be At Least 6 Characters");
      } else if (e.code == "invalid-email") {
        Get.snackbar("Error", "Invalid Email");
      } else if (e.code == "user-not-found") {
        Get.snackbar("Error", "User Not Found");
      } else if (e.code == "wrong-password") {
        Get.snackbar("Error", "Wrong Password");
      } else if (e.code == "invalid-email") {
        Get.snackbar("Error", "Invalid Email");
      } else if (e.code == "network-request-failed") {
        Get.snackbar("Error", "Network Error");
      } else if (e.code == "too-many-requests") {
        Get.snackbar("Error", "Too Many Requests");
      }
    }
  }

//  Logout Method
  void logout() async {
    await auth.signOut();
  }

// ====================================================================
// ====================================================================
  // function to determine which page to show based on User Type
  void handleUsers() async {
    final user = FirebaseAuth.instance.currentUser;
    final ref2 = FirebaseDatabase.instance.ref();
    final snapshot =
        await ref2.child("Users/${user?.uid.toString()}/UserType").get();
    print("User Type: ${snapshot.value}");
    // let us now check the type of user we have retrerived from the database
    if (snapshot.value == "User") {
      Get.offAll(() => const Home());
    }
  }
}
