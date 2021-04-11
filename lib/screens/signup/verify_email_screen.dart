import 'package:flutter/material.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/utils/dialogs.dart';
import 'package:vippicnic/widgets/center_text.dart';
import '../../utils/constants.dart';
import '../login_screen.dart';
import 'create_account_password.dart';

class VerifyEmailScreen extends StatefulWidget {
  static const String ID = "/verify_email_screen";

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final formKey = GlobalKey<FormState>();
  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    text: "Verify Your E-mail",
                    textColor: kPrimaryColor,
                    fontSize: 25,
                    textStyle: TextStyle(fontFamily: 'open_regular'),
                    isBold: true,
                    fontWeight: FontWeight.w900,
                    isCenter: true,
                  ),
                  SizedBox(height: 15),
                  CenterText(
                    text:
                        "Please enter your E-mail Address\nto receive the verify Code",
                    textColor: kPrimaryColor.withOpacity(0.9),
                    fontSize: 18,
                    isCenter: true,
                  ),
                  SizedBox(height: 30),
                  Form(
                    key: formKey,
                    child: InputTyoe(
                      hint: "Email:",
                      validator: kEmailValidator,
                      onTextChange: (text) => _email = text,
                    ),
                  ),
                  SizedBox(height: 30),
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
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        Constants.currentUser.email = _email;
                        Navigator.pushNamed(context, CreateAccountPassword.ID);
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: Stack(
                        children: [
                          Center(
                            child: CenterText(
                              text: "continue".toUpperCase(),
                              textColor: Colors.white,
                              fontSize: 20,
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
    );
  }
}
