import 'dart:core';

class CommonStrings {
  static const emailRegEx =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const phoneRedEx = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  static const oneLowerCase = r'[a-z]';
  static const oneUppercase = r'[A-Z]';
  static const oneDigit = r'[0-9]';
  static const nonWordChar = r'[!@#$%^&*(),.?":{}|<>]';

  static const passwordIsNotBig = 'Password is too short';
  static const passwordUpperCase = 'At least one UpperCase is required';
  static const passwordLowerCase = 'At least one Lowercase is required';
  static const passwordDigits = 'At least one digit is required';
  static const passwordSymbol = 'At least one symbol is required';
  static const googleLoginPressed = 'Google login in progress';
  static const wrongEmailIdMessage = 'Please enter valid e-mail address';
  static const wrongNumberMessage = 'Enter valid phone number';
  static const wrongName = 'Enter valid name';
  static const toShortName = 'At least 5 character is required';
  static const confirmedPasswordNotMatched = 'Password is not Matched';
  static const confirmEmailString = 'Check Your Email and Reset your password';
  static const okString = 'Ok';
  static const cancelString = 'Cancel';
  static const sendEmail = 'Send E-mail';
  static const alertDialogTitle = 'Check Your E-mail';

  static const String welcomeString = 'The Best Apps';
  static const welcomeSecondLine = 'For Your';
  static const welcomeThirdLine = 'Plants';
  static const String signupString = 'Sign Up';
  static const String loginString = 'Login';
  static const String registerString = 'Register';
  static const String createAccountString = 'Create Your Account';
  static const String fullNameString = 'Enter Your Full Name';
  static const String emailString = 'Enter Your Email';
  static const String passwordString = 'Enter Your Password';
  static const String confirmPasswordString = 'Enter Same Password';
  static const String agreePolicyString = 'By signing you agree to our';
  static const String teamOfUseString = ' Team of use';
  static const String andString = 'and';
  static const String privacyNoticeString = ' privacy notice';
  static const String doHaveAccountString = 'Do you have account? ';
  static const String doNotHaveAccountString = 'Don\'t You Have an account? ';
  static const String welcomeBackString = 'Welcome Back';
  static const String loginToAccountString = 'Login Your Account';
  static const String rememberMeString = 'Remember me';
  static const String forgotPasswordString = 'Forgot Password';

  static const String landingPageImageString = 'Assets/landing_page.jpeg';
  static const String landingPageLoginImageString = 'Assets/landing_page.jpeg';
  static String temp = '0';
}
