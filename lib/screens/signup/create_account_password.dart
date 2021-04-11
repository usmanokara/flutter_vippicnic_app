import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/center_text.dart';

import '../../utils/dialogs.dart';
import '../login_screen.dart';
import 'verify_code_screen.dart';

class CreateAccountPassword extends StatefulWidget {
  static const String ID = "/create_account_password";

  @override
  _CreateAccountPasswordState createState() => _CreateAccountPasswordState();
}

class _CreateAccountPasswordState extends State<CreateAccountPassword> {
  String _password;
  String _confirmPassword;
  bool _isLoading = false;

  Future<void> _signUp() async {
    setState(() {
      _isLoading = true;
    });
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      UserCredential newUser = await auth.createUserWithEmailAndPassword(
          email: Constants.currentUser.email, password: _password);
      await newUser.user.sendEmailVerification();
      Constants.currentUser.uid = newUser.user.uid;
      await firestore
          .doc("users/${Constants.currentUser.uid}")
          .set(Constants.currentUser.toJson());
      setState(() {
        _isLoading = false;
      });
      Navigator.pushNamed(context, VerifyCodeScreen.ID);
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        "assets/svg/password.svg",
                        width: MediaQuery.of(context).size.width * 0.30,
                        height: MediaQuery.of(context).size.width * 0.30,
                      ),
                    ),
                    SizedBox(height: 10),
                    CenterText(
                      text: "Create Password:",
                      textColor: kPrimaryColor,
                      fontSize: 25,
                      textStyle: TextStyle(
                        fontFamily: 'open_regular',
                      ),
                      isBold: true,
                      fontWeight: FontWeight.w900,
                      isCenter: true,
                    ),
                    SizedBox(height: 15),
                    CenterText(
                      text: "Enter your new password",
                      textColor: kPrimaryColor.withOpacity(0.8),
                      fontSize: 18,
                      textStyle: TextStyle(
                        fontFamily: 'open_regular',
                      ),
                      isCenter: true,
                    ),
                    SizedBox(height: 20),
                    InputTyoe(
                      textAlign: TextAlign.center,
                      hint: "New Password",
                      onTextChange: (text) => _password = text,
                    ),
                    SizedBox(height: 10),
                    InputTyoe(
                      textAlign: TextAlign.center,
                      hint: "Confirm Password",
                      onTextChange: (text) => _confirmPassword = text,
                    ),
                    SizedBox(height: 15),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: kSecondryColor,
                      onPressed: () {
                        if (_password != _confirmPassword) {
                          AppDialog().showOSDialog(context, "Invalid",
                              "Password doesn't match", "Ok", null);
                          return;
                        }
                        if (_password == null || _password.isEmpty) {
                          AppDialog().showOSDialog(context, "Invalid",
                              "Password is required", "Ok", null);
                          return;
                        }
                        if (_password.length < 6) {
                          AppDialog().showOSDialog(context, "Invalid",
                              "At least 6 character is required", "Ok", null);
                          return;
                        }
                        _signUp();
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: Stack(
                          children: [
                            Center(
                              child: CenterText(
                                text: "finish".toUpperCase(),
                                textColor: Colors.white,
                                fontSize: 20,
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
