import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gmail_integration/screen/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screen/home_screen.dart';

class AuthService {
  signInWithGoogle() async {
    //trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: ['email']).signIn();

        // googleUser?.id;



    //obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // googleAuth.accessToken;
    // googleAuth.idToken;



    //create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //once signed in return the usercredential
    return await FirebaseAuth.instance.signInWithCredential(credential);

    // FirebaseAuth.instance.currentUser?.displayName;
    // FirebaseAuth.instance.currentUser?.email;
    

  }

  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
