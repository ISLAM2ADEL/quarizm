import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthFirebase {

  Future<void> registerUser(String name, String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (credential.user != null && !credential.user!.emailVerified) {
        await credential.user!.sendEmailVerification();
      }
      await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set({
        'name': name,
        'email': emailAddress,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('Password is too weak. Please choose a stronger password.ً');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('An account already exists for that email.');
      } else {
        throw Exception('Error occurred while registering user: ${e.message}');
      }
    } catch (e) {
      throw Exception('Error occurred while registering user: $e');
    }
  }
  Future<void> signInUser(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (credential.user == null) {
        throw Exception('Something went wrong. Please try again.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      } else {
        throw Exception('Error occurred: Email or password is incorrect');
      }
    } catch (e) {
      throw Exception('Email or password is incorrect');
    }
  }

  Future<void> forgetPassword(String emailAddress) async {
    try {
      final methods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);
      if (methods.isEmpty) {
        throw Exception('No user found for that email.');
      }
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
    } on FirebaseAuthException catch (e) {
      throw Exception('Error occurred: ${e.message}');
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw Exception('Error occurred: $e');
      }
  }
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
