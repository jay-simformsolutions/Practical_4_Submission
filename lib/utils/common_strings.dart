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
  static const errorString = 'Error';
  static const cancelString = 'Cancel';
  static const finishString = 'Finish';
  static const whoopsString = 'Whoops!';
  static const settingString = 'Settings';
  static const sendEmail = 'Send E-mail';
  static const alertDialogTitle = 'Check Your E-mail';

  static const welcomeString = 'The Best Apps';
  static const welcomeSecondLine = 'For Your';
  static const welcomeThirdLine = 'Plants';
  static const signupString = 'Sign Up';
  static const loginString = 'Login';
  static const registerString = 'Register';
  static const createAccountString = 'Create Your Account';
  static const fullNameString = 'Enter Your Full Name';
  static const emailString = 'Enter Your Email';
  static const passwordString = 'Enter Your Password';
  static const confirmPasswordString = 'Enter Same Password';
  static const agreePolicyString = 'By signing you agree to our';
  static const teamOfUseString = ' Team of use';
  static const andString = 'and';
  static const privacyNoticeString = ' privacy notice';
  static const doHaveAccountString = 'Do you have account? ';
  static const doNotHaveAccountString = 'Don\'t You Have an account? ';
  static const welcomeBackString = 'Welcome Back';
  static const loginToAccountString = 'Login Your Account';
  static const rememberMeString = 'Remember me';
  static const forgotPasswordString = 'Forgot Password';
  static String temp = '0';

  //Assets Common Strings

  static const splitwise = 'SplitWise';
  static const groupBottomTitle = 'Group';
  static const friendBottomTitle = 'Friends';
  static const activityBottomTitle = 'Activity';
  static const profileBottomTitle = 'Account';

  //Local_Auth Common String
  static const titleOfAuthenticate = 'Please Authenticate';
  static const unlockSplitwise = 'Please Unlock Splitwise to Continue';
  static const unlockPlease = 'Unlock';
  static const failedAuthenticate = 'Failed to authenticate';
  static const successAuthenticate = 'Autherized success';
  static const scanYourFinger = 'Scan your finger print to authenticate';

  //Group Page Common Strings
  static const groupNotification = 'Splitwise groups you create or are';
  static const groupWillShowHere = 'added to will show here';
  static const makenewGroup = 'Start a new group';
  static const showGroupInfo = 'Show Group Info';
  static const youAllAreSet = 'You are all settle up!';
  static const createNewGroup = 'Create New Group';
  static const groupInformation = 'Group Info';
  static const typeString = 'Type';
  static const groupName = 'Group Name';
  static const enterGroupNameAlertDialog =
      'You Haven\'t entered a name for your group yet!';
  static const lent = 'you lent';
  static const borrowed = 'you borrowed';

  // Group_Expense Page Common Strings
  static const allSettleUp = 'You all are settled up in this group';

  //group settle up Page
  static const groupSettleUp = 'Group Settle Up';

  //group balance page
  static const groupBalances = 'GroupBalance';

  //group total balance page
  static const groupTotalBalances = 'TotalGroupExpense';

  //Friends Page Common Strings
  static const welcomeGroup = 'Welcome to Splitwise, Jay!';
  static const friendNotification = 'As you use Splitwise, friends and group';
  static const matesWillShow = 'mates will show here.';
  static const addMoreFriends = 'Add more friends';
  static const showFriendInfo = 'Show Friends Info';
  static const textFieldToAddNewFriend = 'Enter name, email, or phone #';
  static const showWarning =
      'Adding friends from your contacts require permission. '
      'we DO NOT upload your address book. Please visit Setting and give '
      'permission for access your Contact Address Book';

  // Add New Friend Page Common String
  static const addNewContacts = 'Add a new contact to Splitwise';
  static const addNewContactFromList = 'Add New Contact from Your Contact List';
  static const atLeastOnePersonRequire = 'At least one person is require';
  static const noAnyContacts = "There is no contacts in your contact list";

  // Verify Contacts Common Strings
  static const verifyContacts = 'Verify Contact Info';
  static const letThemKnow = 'Send a text message to let them know';
  static const friendsAdded = 'Your friend has been added';
  static const sendTextMessage = 'Send text message';

  // Add New Contact Page Common String
  static const nothingSend =
      'Don\'t worry, nothing send just yet. you will have';
  static const anotherChance = 'another chance to review before sending';
  static const username = 'Name';
  static const phoneOrEmail = 'Phone Number or Email Address';

  //Activity Page Common Strings
  static const activityHeadline = 'Activity';
  static const startingLine = 'There is no activity in your account yet';
  static const tryAddExpense = 'Try adding an expense';

  //Account Page Common Strings
  static const accountHead = 'Account';

  //Profile Page Common Strings
  static const scanCode = 'Scan Code';
  static const splitWisePro = 'Splitwise Pro';
  static const emailSetting = 'Email Settings';
  static const deviceAndPush = 'Device and Push notification settings';
  static const passcode = 'Passcode';
  static const rateSplitwise = 'Rate Splitwise';
  static const contact = 'Contact Splitwisre Support';
  static const logout = 'Log out';
  static const preferences = 'Preferences';
  static const feedback = 'Feedback';
  static const email = 'akbarijay1@gmail.com';
  static const name = 'jay akbari';
  static const copyright = 'Copyright 2023 Slitwise, Inc';
  static const ps = 'P.S.';
  static const bunnies = 'Bunnies!';

  static const addExpense = 'Add expense';
  static const groupNameWithYou = 'With you and: ';
  static const textFormFieldOfAddNameEmail = 'Enter name, emails, or phone #s';
  static const labelOfDescription = 'Enter a description';
  static const labelOfAmount = 'Enter Amount for Bill Split';
  static const paidBy = 'Paid by';
  static const you = 'You';
  static const split = 'and Split';
  static const equally = 'equally';
  static const canNotSaveExpense = 'Cannot save expense';
  static const warningDescription = 'You must enter a description';
  static const warningAmount = 'You must enter an amount';

  static const pageNotFound = 'Page Not Found';

  //Load Json File
  static const loadGroupJson = 'assets/json/group_page.json';
  static const loadGroupExpenseJson = 'assets/json/group_expense.json';

  // Category List Common Strings

  static const commonOtherCategory = 'Other';
  static const selectCategoryTextField = 'Search or select a category';
  static const entertainment = 'Entertainment';
  static const foodAndDrink = 'Food and Drink';
  static const home = 'Home';
  static const life = 'Life';
  static const uncategorized = 'Uncategorized';
  static const utilities = 'Utilities';

  //Entertainment Category Common Strings
  static const entertainmentGames = 'Games';
  static const entertainmentMovies = 'Movies';
  static const entertainmentMusic = 'Music';
  static const entertainmentOther = 'Other';
  static const entertainmentSports = 'Sports';

  //FoodAndDrink Category Common Strings
  static const foodAnDrinkGroceries = 'Groceries';
  static const foodAnDrinkDiningOut = 'Dining out';
  static const foodAnDrinkLiquor = 'Liquor';

  //Home Category Common Strings
  static const homeRent = 'Rent';
  static const homeMortgage = 'Mortgage';
  static const homeHouseHold = 'Household supplies';
  static const homeFurniture = 'Furniture';
  static const homeMaintenance = 'Maintenance';
  static const homePets = 'Pets';
  static const homeServices = 'Services';
  static const homeElectronics = 'Electronics';

  //Life Category Common Strings
  static const lifeInsurance = 'Insurance';
  static const lifeCloth = 'Clothing';
  static const lifeCar = 'Car';
  static const lifeBusTrain = 'Bus/train';
  static const lifeGasFuel = 'Gas/fuel';
  static const lifePlan = 'Plan';
  static const lifeTaxi = 'Taxi';
  static const lifeBicycle = 'Bicycle';
  static const lifeHotel = 'Hotel';

  //Uncategorized Category Common Strings
  static const uncategorizedGeneral = 'General';

  //Utilities Category Common Strings
  static const utilitiesElectricity = 'Electricity';
  static const utilitiesHeatGas = 'Heat/gas';
  static const utilitiesWater = 'Water';
  static const utilitiesTvPhone = 'TV/Phone/Internet';
  static const utilitiesTrash = 'Trash';
  static const utilitiesClean = 'Cleaning';
}
