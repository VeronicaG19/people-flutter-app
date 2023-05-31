// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(length) =>
      "La contraseña debe contener máximo ${length} caracteres";

  static String m1(length) =>
      "La contraseña debe contener al menos ${length} caracteres";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "email": MessageLookupByLibrary.simpleMessage("Correo"),
        "emailAlreadyInUse":
            MessageLookupByLibrary.simpleMessage("El correo ya está en uso"),
        "hello": MessageLookupByLibrary.simpleMessage("Hola"),
        "invalidEmail": MessageLookupByLibrary.simpleMessage("Correo inválido"),
        "invalidPassword":
            MessageLookupByLibrary.simpleMessage("Contraseña no permitida"),
        "login": MessageLookupByLibrary.simpleMessage("Inicio de sesión"),
        "loginRegister":
            MessageLookupByLibrary.simpleMessage("INICIA SESIÓN O REGÍSTRATE"),
        "operationNotAllowed":
            MessageLookupByLibrary.simpleMessage("Operación no permitida"),
        "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
        "passwordTooLong": m0,
        "passwordTooShort": m1,
        "popularPeople":
            MessageLookupByLibrary.simpleMessage("Personas populares"),
        "signin": MessageLookupByLibrary.simpleMessage("INICIA SESIÓN"),
        "signup": MessageLookupByLibrary.simpleMessage("REGÍSTRATE"),
        "unknownError":
            MessageLookupByLibrary.simpleMessage("Error desconocido"),
        "uploadData": MessageLookupByLibrary.simpleMessage("Subir datos"),
        "userDisabled":
            MessageLookupByLibrary.simpleMessage("El usuario está desactivado"),
        "userNotFound": MessageLookupByLibrary.simpleMessage(
            "El usuario no se encuentra registrado"),
        "userSigninSuccess": MessageLookupByLibrary.simpleMessage(
            "El usuario ha iniciado sesión con éxito"),
        "userSignupSuccess": MessageLookupByLibrary.simpleMessage(
            "El usuario se ha registrado con éxito"),
        "weakPassword":
            MessageLookupByLibrary.simpleMessage("Contraseña débil"),
        "wrongPassword":
            MessageLookupByLibrary.simpleMessage("La contraseña es incorrecta")
      };
}
