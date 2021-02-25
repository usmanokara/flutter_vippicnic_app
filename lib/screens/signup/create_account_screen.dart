import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vippicnic/screens/signup/verify_email_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/utils/dialogs.dart';
import 'package:vippicnic/widgets/center_text.dart';

import '../login_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  static String ID = "/create_account_screen";

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  File file;

  final picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final pickedFile = await picker.getImage(source: imageSource);

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
                    fontSize: 25,
                    textStyle: GoogleFonts.openSans(),
                    isBold: true,
                    isCenter: true,
                    fontWeight: FontWeight.w900,
                  ),
                  SizedBox(height: 15),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(75),
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
                                    width: 120,
                                    height: 120,
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: Image.file(
                                      file,
                                      width: 120,
                                      height: 120,
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
                    onTextChange: (text) {},
                  ),
                  SizedBox(height: 10),
                  InputTyoe(
                    hint: "FirstName:",
                    onTextChange: (text) {},
                  ),
                  SizedBox(height: 15),
                  InputTyoe(
                    hint: "Last Name:",
                    onTextChange: (text) {},
                  ),
                  SizedBox(height: 15),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: kSecondryColor,
                    onPressed: () =>
                        Navigator.pushNamed(context, VerifyEmailScreen.ID),
                    child: Container(
                      width: double.infinity,
                      height: 55,
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
