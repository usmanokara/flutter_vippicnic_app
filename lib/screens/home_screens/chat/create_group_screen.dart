import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/center_text.dart';

import '../../login_screen.dart';

class CreateGroupScreen extends StatefulWidget {
  static String ID = "/create_group_screen";

  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
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
                      text: "New Group",
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        color: kPrimaryColor.withOpacity(0.05),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image,
                                color: Colors.grey,
                                size:
                                    (MediaQuery.of(context).size.width * 0.30),
                              ),
                              CenterText(
                                text: "Upload Pictures",
                                textColor: kPrimaryColor,
                                fontSize: 20,
                                isCenter: true,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          minLines: 5,
                          maxLines: 10,
                          decoration: InputDecoration(
                              hintText: "Description...",
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              labelStyle: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w500),
                              hintStyle: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          border:
                              Border.all(color: Color(0xFFC4C4C4), width: 2)),
                    ),
                    SizedBox(height: 20),
                    InputTyoe(
                      hint: "Type Username to add...",
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: kSecondryColor,
                      onPressed: () {},
                      child: Container(
                        width: double.infinity,
                        height: 55,
                        child: Stack(
                          children: [
                            Center(
                              child: CenterText(
                                text: "create group".toUpperCase(),
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
              ))
            ],
          ),
        ),
      ),
    );
  }
}
