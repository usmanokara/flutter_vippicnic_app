import 'package:flutter/material.dart';
import 'package:vippicnic/screens/forgot_password_Screen.dart';
import 'package:vippicnic/screens/home_screens/home_bottom_sheet.dart';
import 'package:vippicnic/screens/home_screens/home_screen.dart';
import 'package:vippicnic/screens/home_screens/new_post_screen.dart';
import 'package:vippicnic/screens/home_screens/search_friend_screen.dart';
import 'package:vippicnic/screens/login_screen.dart';
import 'package:vippicnic/screens/new_password_screen.dart';
import 'package:vippicnic/screens/signup/create_account_password.dart';
import 'package:vippicnic/screens/signup/create_account_screen.dart';
import 'package:vippicnic/screens/signup/verify_code_screen.dart';
import 'package:vippicnic/screens/signup/verify_email_screen.dart';
import 'package:vippicnic/screens/splash_screen.dart';
import 'package:vippicnic/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              brightness: Brightness.light,
            ),
      ),
      routes: {
        WelcomeScreen.ID: (_) => WelcomeScreen(),
        LoginScreen.ID: (_) => LoginScreen(),
        ForgotPasswordScreen.ID: (_) => ForgotPasswordScreen(),
        NewPasswordScreen.ID: (_) => NewPasswordScreen(),
        VerifyCodeScreen.ID: (_) => VerifyCodeScreen(),
        VerifyEmailScreen.ID: (_) => VerifyEmailScreen(),
        CreateAccountScreen.ID: (_) => CreateAccountScreen(),
        CreateAccountPassword.ID: (_) => CreateAccountPassword(),
        HomeScreen.ID: (_) => HomeScreen(),
        HomeBottomNavigation.ID: (_) => HomeBottomNavigation(),
        NewPostScreen.ID: (_) => NewPostScreen(),
        SearchFriendScreen.ID: (_) => SearchFriendScreen()
      },
      home: SplashScreen(),
    );
  }
}
