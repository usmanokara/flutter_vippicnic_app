import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vippicnic/screens/signup/create_account_password.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/center_text.dart';

import '../login_screen.dart';

class VerifyCodeScreen extends StatefulWidget {
  static String ID = "/verify_code_screen";

  @override
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  TextEditingController code1 = TextEditingController();
  TextEditingController code2 = TextEditingController();
  TextEditingController code3 = TextEditingController();
  TextEditingController code4 = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CenterText(
                    text: "Verification Code",
                    textColor: kPrimaryColor,
                    fontSize: 25,
                    textStyle: GoogleFonts.openSans(),
                    isBold: true,
                    fontWeight: FontWeight.w900,
                    isCenter: true,
                  ),
                  SizedBox(height: 15),
                  CenterText(
                    text: "Please enter Code",
                    textColor: kPrimaryColor.withOpacity(0.9),
                    fontSize: 18,
                    textStyle: GoogleFonts.openSans(),
                    isCenter: true,
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: VerifyTextField(
                              controller: code1,
                              focusNode: focusNode1,
                              onChanged: (String value) {
                                if (value != null && value.length == 1) {
                                  focusNode2.requestFocus();
                                  code2.text = "";
                                }
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: VerifyTextField(
                              controller: code2,
                              focusNode: focusNode2,
                              onChanged: (value) {
                                if (value != null && value.length == 1) {
                                  focusNode3.requestFocus();
                                  code3.text = "";
                                }
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: VerifyTextField(
                              controller: code3,
                              focusNode: focusNode3,
                              onChanged: (value) {
                                if (value != null && value.length == 1) {
                                  focusNode4.requestFocus();
                                  code4.text = "";
                                }
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: VerifyTextField(
                              controller: code4,
                              focusNode: focusNode4,
                              onChanged: (value) {
                                if (value != null && value.length == 1) {}
                              }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: kSecondryColor,
                    onPressed: () =>
                        Navigator.pushNamed(context, CreateAccountPassword.ID),
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      child: Stack(
                        children: [
                          Center(
                            child: CenterText(
                              text: "verify".toUpperCase(),
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
                  SizedBox(height: 30),
                  CenterText(
                    text: "Resend Code",
                    textColor: kSecondryColor,
                    fontSize: 18,
                    textStyle: GoogleFonts.openSans(),
                    isCenter: true,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VerifyTextField extends StatefulWidget {
  VerifyTextField({this.controller, this.onChanged, this.focusNode});

  final TextEditingController controller;
  final Function onChanged;
  FocusNode focusNode;

  @override
  _VerifyTextFieldState createState() => _VerifyTextFieldState();
}

class _VerifyTextFieldState extends State<VerifyTextField> {
  Color focusColor = kPrimaryColor;
  String hint = '0';

  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      print("Has focus: ${widget.focusNode.hasFocus}");
      if (widget.focusNode.hasFocus == true) {
        setState(() {
          hint = '';
          focusColor = kPrimaryColor;
        });
      } else {
        setState(() {
          focusColor = Colors.grey;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: focusColor, width: 2.0),
          left: BorderSide(color: focusColor, width: 2.0),
          right: BorderSide(color: focusColor, width: 2.0),
          bottom: BorderSide(color: focusColor, width: 2.0),
        ),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: TextField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          maxLength: 1,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 30),
          decoration: kVerificationFieldDecoration.copyWith(hintText: hint),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}

const kVerificationFieldDecoration = InputDecoration(
  counterText: '',
  hintStyle: TextStyle(color: kPrimaryColor),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 0.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 0.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);
