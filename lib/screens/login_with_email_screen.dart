import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:vippicnic/screens/signup/create_account_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/center_text.dart';

import '../models/user_model.dart';
import '../models/user_model.dart';
import '../utils/constants.dart';
import '../utils/constants.dart';
import '../utils/dialogs.dart';
import 'forgot_password_Screen.dart';
import 'home_screens/home_bottom_sheet.dart';
import 'login_screen.dart';

class LoginWithEmailScreen extends StatefulWidget {
  static String ID = "login_with_email_screen";

  @override
  _LoginWithEmailScreenState createState() => _LoginWithEmailScreenState();
}

class _LoginWithEmailScreenState extends State<LoginWithEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _keepMeLogedIn = true;

  String _email;
  String _password;
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      User currentUser = _auth.currentUser;
      DocumentSnapshot snapshot =
          await firestore.doc("users/${currentUser.uid}").get();
      Constants.currentUser = UserModel.fromJson(snapshot.data());
      if (currentUser.emailVerified) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushNamed(context, HomeBottomNavigation.ID);
        return;
      }
      await currentUser.sendEmailVerification();
      setState(() {
        _isLoading = false;
      });
    } on FirebaseException catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Login Error: $e");
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SafeArea(
                child: Container(
                  alignment: Alignment.center,
                  //Set container alignment  then wrap the column with singleChildScrollView
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          width: MediaQuery.of(context).size.width * 0.35,
                        ),
                        SizedBox(height: 15),
                        Form(
                          key: _formKey,
                          child: InputTyoe(
                            textAlign: TextAlign.center,
                            hint: "Email",
                            onTextChange: (text) => _email = text,
                            validator: kEmailValidator,
                          ),
                        ),
                        SizedBox(height: 10),
                        InputTyoe(
                          textAlign: TextAlign.center,
                          hint: "Password",
                          onTextChange: (text) => _password = text,
                          textInputType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: 20),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: kSecondryColor,
                          onPressed: () {
                            if (_email == null || _email.isEmpty) {
                              AppDialog().showOSDialog(context, "Invalid",
                                  "Email is required", "Ok", null);
                              return;
                            }
                            if (_password == null || _password.isEmpty) {
                              AppDialog().showOSDialog(context, "Invalid",
                                  "Password is required", "Ok", null);
                              return;
                            }
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              _login();
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            child: Stack(
                              children: [
                                Center(
                                  child: CenterText(
                                    text: "login".toUpperCase(),
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
                        SizedBox(height: 10),
                        Row(
                          children: [
                            OutlineButton(
                              onPressed: () {
                                setState(() {
                                  _keepMeLogedIn = !_keepMeLogedIn;
                                });
                              },
                              shape: CircleBorder(),
                              borderSide: BorderSide(
                                color: kPrimaryColor.withOpacity(0.5),
                                //Color of the border
                                style: BorderStyle.solid,
                                //Style of the border
                                width: 1, //width of the border
                              ),
                              padding: EdgeInsets.all(0),
                              child: _keepMeLogedIn
                                  ? Icon(
                                      Icons.check,
                                      color: kPrimaryColor,
                                      size: 25,
                                    )
                                  : Container(
                                      width: 25,
                                      height: 25,
                                      child: SizedBox(),
                                    ),
                            ),
                            CenterText(
                                text: "Keep me logged in ",
                                textColor: kPrimaryColor,
                                fontSize: 16),
                            Spacer(),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, ForgotPasswordScreen.ID),
                              child: CenterText(
                                  fontWeight: FontWeight.w700,
                                  text: "Forgot?",
                                  textColor: kSecondryColor,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        OutlineButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          borderSide: BorderSide(
                            color: kPrimaryColor, //Color of the border
                            style: BorderStyle.solid, //Style of the border
                            width: 1, //width of the border
                          ),
                          onPressed: () => Navigator.pushNamed(
                              context, CreateAccountScreen.ID),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            child: Stack(
                              children: [
                                Center(
                                  child: CenterText(
                                      text: "Create account".toUpperCase(),
                                      textColor: kPrimaryColor,
                                      fontSize: 19),
                                ),
                                Positioned(
                                    right: 5,
                                    top: 0,
                                    bottom: 0,
                                    child: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                      size: 30,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
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
                                      decoration: TextDecoration.underline),
                                ),
                                TextSpan(text: ' and '),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  text: 'Privacy policy',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20)
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
