// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(length) =>
      "The password must contain a maximum of ${length} characters";

  static String m1(length) =>
      "The password must contain at least ${length} characters";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailAlreadyInUse":
            MessageLookupByLibrary.simpleMessage("Email already in use"),
        "hello": MessageLookupByLibrary.simpleMessage("Hello"),
        "invalidEmail": MessageLookupByLibrary.simpleMessage("Invalid email"),
        "invalidPassword":
            MessageLookupByLibrary.simpleMessage("Invalid password"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginRegister":
            MessageLookupByLibrary.simpleMessage("SIGN-IN OR SIGN-UP"),
        "operationNotAllowed":
            MessageLookupByLibrary.simpleMessage("Operation not allowed"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordTooLong": m0,
        "passwordTooShort": m1,
        "popularPeople": MessageLookupByLibrary.simpleMessage("Popular people"),
        "signin": MessageLookupByLibrary.simpleMessage("SIGN IN"),
        "signup": MessageLookupByLibrary.simpleMessage("SIGN UP"),
        "unknownError": MessageLookupByLibrary.simpleMessage("Unknown error"),
        "uploadData": MessageLookupByLibrary.simpleMessage("Upload data"),
        "userDisabled": MessageLookupByLibrary.simpleMessage("User disabled"),
        "userNotFound": MessageLookupByLibrary.simpleMessage("User not found"),
        "userSigninSuccess": MessageLookupByLibrary.simpleMessage(
            "User has been signed in successfully"),
        "userSignupSuccess": MessageLookupByLibrary.simpleMessage(
            "User has been signed up successfully"),
        "weakPassword": MessageLookupByLibrary.simpleMessage("Weak password"),
        "wrongPassword": MessageLookupByLibrary.simpleMessage("Wrong password")
      };
}
