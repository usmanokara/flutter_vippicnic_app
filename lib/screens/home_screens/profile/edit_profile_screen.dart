import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vippicnic/screens/home_screens/search_friend_screen.dart';
import 'package:vippicnic/screens/signup/verify_email_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/utils/dialogs.dart';
import 'package:vippicnic/widgets/center_text.dart';

import '../../login_screen.dart';

class EditProfileScreen extends StatefulWidget {
  static String ID = "edit_profile_screen";

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File file;
  final picker = ImagePicker();
  String _name = "";
  String _bio;
  String _dob;
  String _email;
  String _phone;
  String _address;
  String _password;

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back,
                          color: kPrimaryColor, size: 40)),
                  Expanded(
                    child: CenterText(
                      text: "Edit account",
                      textColor: kPrimaryColor,
                      fontSize: 25,
                      isCenter: true,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kSecondryColor),
                        child: Center(
                            child: Icon(Icons.search,
                                color: Colors.white, size: 30))),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
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
                                            0,
                                            1.5), // changes position of shadow
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
                        CenterText(
                          text: "Username:",
                          textColor: kPrimaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                        SizedBox(height: 20),
                        UpdateProfileItem(
                          title: "Name:",
                          value: _name,
                          onTap: () async {
                            _name = await showInoutDialog("Name:", _name) ??
                                _name;
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 10),
                        UpdateProfileItem(
                          title: "Bio:",
                          value: _bio,
                          onTap: () async {
                            _name = await showInoutDialog("Bio:", _bio) ?? _bio;
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 15),
                        UpdateProfileItem(
                          title: "Date of Birth:",
                          value: _dob,
                          onTap: () async {
                            _name = await showInoutDialog(
                                "Date of Birth:", _dob) ??
                                _dob;
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 15),
                        UpdateProfileItem(
                          title: "Email:",
                          value: _email,
                          onTap: () async {
                            _name =
                                await showInoutDialog("Email:", _email) ??
                                    _email;
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 15),
                        UpdateProfileItem(
                          title: "Phone:",
                          value: _phone,
                          onTap: () async {
                            _name =
                                await showInoutDialog("Phone:", _phone) ??
                                    _phone;
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 15),
                        UpdateProfileItem(
                          title: "Address",
                          value: _address,
                          onTap: () async {
                            _name = await showInoutDialog(
                                "Address:", _address) ??
                                _address;
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 15),
                        UpdateProfileItem(
                          title: "Password:",
                          value: _password,
                          onTap: () async {
                            _name = await showInoutDialog(
                                "Password:", _password) ??
                                _password;
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 15),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: kSecondryColor,
                          onPressed: () =>
                              Navigator.pushNamed(
                                  context, VerifyEmailScreen.ID),
                          child: Container(
                            width: double.infinity,
                            height: 55,
                            child: Stack(
                              children: [
                                Center(
                                  child: CenterText(
                                    text: "Update".toUpperCase(),
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
                        SizedBox(height: 15),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<String> showInoutDialog(String title, String value) {
    String text;
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (builder) {
          return new Container(
            color: Colors.transparent,
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 15),
                        Stack(
                          children: [
                            Center(
                              child: CenterText(
                                text: title,
                                textColor: kPrimaryColor,
                                fontSize: 22,
                              ),
                            ),
                            Positioned(
                                right: 0,
                                child: GestureDetector(
                                  onTap: () => Navigator.pop(context, null),
                                  child: Icon(
                                    Icons.cancel,
                                    color: kPrimaryColor.withOpacity(0.5),
                                    size: 30,
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(height: 15),
                        InputTyoe(
                          text: value,
                          onTextChange: (value) {
                            text = value;
                          },
                        ),
                        SizedBox(height: 15),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: kSecondryColor,
                          onPressed: () => Navigator.pop(context, text),
                          child: Container(
                            width: double.infinity,
                            height: 55,
                            child: Stack(
                              children: [
                                Center(
                                  child: CenterText(
                                    text: "save".toUpperCase(),
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
                        SizedBox(height: 15)
                      ],
                    ),
                  ),
                )),
          );
        });
  }
}

class UpdateProfileItem extends StatelessWidget {
  UpdateProfileItem({this.title, this.value, this.onTap});

  String title;
  String value;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    value = value ?? "";
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: kPrimaryColor.withOpacity(0.15), width: 2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
                child: CenterText(
                  text: "$title:$value",
                  textColor: kPrimaryColor,
                  fontSize: 18,
                )),
            GestureDetector(
              onTap: onTap,
              child: Icon(
                Icons.edit_outlined,
                color: kPrimaryColor.withOpacity(0.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
