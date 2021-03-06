import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vippicnic/models/user_model.dart';
import 'package:vippicnic/screens/signup/verify_email_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/utils/dialogs.dart';
import 'package:vippicnic/widgets/center_text.dart';

import '../login_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  static const String ID = "/create_account_screen";

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  File file;
  String username;
  String firstName;
  String lastName;

  Future getImage(ImageSource imageSource) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: imageSource);
    if (pickedFile == null) return;
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
                  SizedBox(height: 10),
                  CenterText(
                    text: "Account Details",
                    textColor: kPrimaryColor,
                    fontSize: 22,
                    textStyle: TextStyle(
                      fontFamily: 'open_bold',
                    ),
                    isCenter: true,
                  ),
                  SizedBox(height: 15),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2.5,
                                  blurRadius: 3.5,
                                  offset: Offset(
                                      0, 1.5), // changes position of shadow
                                ),
                              ]),
                          child: Center(
                            child: file == null
                                ? SvgPicture.asset(
                                    "assets/svg/user_avatar.svg",
                                    width: 100,
                                    height: 100,
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.file(
                                      file,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 3,
                        bottom: 10,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 5, bottom: 12),
                            child: GestureDetector(
                              onTap: () {
                                if (file != null) {
                                  setState(() {
                                    file = null;
                                  });
                                  return;
                                }
                                showModalBottomSheet(
                                    context: context,
                                    builder: (_) {
                                      return CameraGalleryBottomSheet(
                                          cameraClick: () {
                                        getImage(ImageSource.camera);
                                      }, galleryClick: () {
                                        getImage(ImageSource.gallery);
                                      });
                                    });
                              },
                              child: Icon(
                                file == null
                                    ? Icons.add_circle
                                    : Icons.remove_circle,
                                size: 45,
                                color: kSecondryColor,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  SizedBox(height: 20),
                  InputTyoe(
                    hint: "Username:",
                    onTextChange: (text) => username = text,
                  ),
                  SizedBox(height: 10),
                  InputTyoe(
                    hint: "FirstName:",
                    onTextChange: (text) => firstName = text,
                  ),
                  SizedBox(height: 15),
                  InputTyoe(
                    hint: "Last Name:",
                    onTextChange: (text) => lastName = text,
                  ),
                  SizedBox(height: 15),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: kSecondryColor,
                    onPressed: () {
                      if (username == null || username.isEmpty) {
                        AppDialog().showOSDialog(context, "Invalid",
                            "Username is required", "Ok", null);
                        return;
                      }
                      if (firstName == null || firstName.isEmpty) {
                        AppDialog().showOSDialog(context, "Invalid",
                            "First Name is required", "Ok", null);
                        return;
                      }
                      if (lastName == null || lastName.isEmpty) {
                        AppDialog().showOSDialog(context, "Invalid",
                            "Last Name is required", "Ok", null);
                        return;
                      }
                      // if (file == null) {
                      //   AppDialog().showOSDialog(context, "Invalid",
                      //       "Image is required", "Ok", null);
                      //   return;
                      // }
                      // if (password == null || password.isEmpty) {
                      // AppDialog().showOSDialog(
                      // context, Invalid, "Password is required", Ok, null);
                      // return;
                      // }
                      // if (password.length < 6) {
                      // AppDialog().showOSDialog(context, Invalid,
                      // "At least 6 character is required", Ok, null);
                      // return;
                      // }
                      String displayName = "$firstName $lastName";
                      Constants.currentUser = UserModel(
                          displayName: displayName,
                          username: username,
                          image: file);
                      Navigator.pushNamed(context, VerifyEmailScreen.ID);
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
    );
  }
}
