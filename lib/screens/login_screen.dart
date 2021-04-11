import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:vippicnic/screens/forgot_password_Screen.dart';
import 'package:vippicnic/screens/home_screens/home_bottom_sheet.dart';
import 'package:vippicnic/screens/login_with_email_screen.dart';
import 'package:vippicnic/screens/signup/create_account_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/utils/dialogs.dart';
import 'package:vippicnic/widgets/center_text.dart';

import '../models/user_model.dart';

class LoginScreen extends StatefulWidget {
  static String ID = "/login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _keepMeLogedIn = true;
  bool _isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
      final User currentUser = _auth.currentUser;

      if (currentUser != null) {
        await _checkUserExists();
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Google Error: $e");
    }
  }

  Future signInWithFacebook() async {
    // Trigger the sign-in flow
    var accessToken = await FacebookAuth.instance.login();

    final FacebookAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(accessToken.accessToken.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }

  Future<void> _checkUserExists() async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.doc("users/${_auth.currentUser.uid}").get();
      if (snapshot.exists) {
        Constants.currentUser = UserModel.fromJson(snapshot.data());
        return;
      }
      Constants.currentUser = UserModel(
          displayName: _auth.currentUser.displayName,
          email: _auth.currentUser.email,
          photoUrl: _auth.currentUser.photoURL,
          uid: _auth.currentUser.uid);

      await _firestore
          .doc("users/${_auth.currentUser.uid}")
          .set(Constants.currentUser.toJson());
    } on FirebaseException catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/hd_back.png",
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SafeArea(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  //Set container alignment  then wrap the column with singleChildScrollView
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: Colors.white,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.google,
                                color: Colors.red,
                              ),
                              SizedBox(width: 20),
                              Text(
                                'Continue with Google',
                                style: TextStyle(
                                    fontFamily: 'open_regular', fontSize: 16),
                              ),
                            ],
                          ),
                          onPressed: () {
                            _signInWithGoogle();
                          },
                        ),
                        SizedBox(height: 15),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: Colors.white,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.facebookF,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 20),
                              Text(
                                'Continue with Facebook',
                                style: TextStyle(
                                    fontFamily: 'open_regular', fontSize: 16),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(height: 15),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: kSecondryColor,
                          onPressed: () => Navigator.pushNamed(
                              context, LoginWithEmailScreen.ID),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            child: Stack(
                              children: [
                                Center(
                                  child: CenterText(
                                    text: "Login with email",
                                    textColor: Colors.white,
                                    fontSize: 18,
                                    isBold: true,
                                  ),
                                ),
                                Positioned(
                                    right: 5,
                                    top: 0,
                                    bottom: 0,
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: Colors.white,
                                      size: 30,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "By tapping Log In, you agree with our\n",
                              style: TextStyle(
                                fontFamily: 'open_regular',
                                fontSize: 16.0,
                                color: kPrimaryColor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  text: "Terms of services",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontFamily: 'open_regular'),
                                ),
                                TextSpan(text: ' and '),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  text: 'Privacy policy',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontFamily: 'open_regular'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputTyoe extends StatelessWidget {
  InputTyoe(
      {this.hint,
      this.textInputType,
      this.onTextChange,
      this.textAlign,
      this.text,
      this.validator});

  String hint;
  Function(String text) onTextChange;
  TextInputType textInputType;
  TextAlign textAlign;
  String text;
  TextEditingController textEditingController = TextEditingController();
  final Function validator;

  @override
  Widget build(BuildContext context) {
    textInputType = textInputType ?? TextInputType.text;
    textAlign = textAlign ?? TextAlign.start;
    textEditingController.text = text;
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          controller: textEditingController,
          textAlign: textAlign,
          keyboardType: textInputType,
          onChanged: onTextChange,
          validator: this.validator,
          decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              labelStyle: TextStyle(
                  fontFamily: 'open_regular', fontWeight: FontWeight.w500),
              hintStyle: TextStyle(
                  fontFamily: 'open_regular', fontWeight: FontWeight.w500)),
        ),
      ),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          border: Border.all(color: Color(0xFFC4C4C4), width: 2)),
    );
  }
}
