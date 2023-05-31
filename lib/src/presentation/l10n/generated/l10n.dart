// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hola`
  String get hello {
    return Intl.message(
      'Hola',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Inicio de sesión`
  String get login {
    return Intl.message(
      'Inicio de sesión',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Correo`
  String get email {
    return Intl.message(
      'Correo',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get password {
    return Intl.message(
      'Contraseña',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `INICIA SESIÓN O REGÍSTRATE`
  String get loginRegister {
    return Intl.message(
      'INICIA SESIÓN O REGÍSTRATE',
      name: 'loginRegister',
      desc: '',
      args: [],
    );
  }

  /// `Error desconocido`
  String get unknownError {
    return Intl.message(
      'Error desconocido',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `El correo ya está en uso`
  String get emailAlreadyInUse {
    return Intl.message(
      'El correo ya está en uso',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Correo inválido`
  String get invalidEmail {
    return Intl.message(
      'Correo inválido',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Operación no permitida`
  String get operationNotAllowed {
    return Intl.message(
      'Operación no permitida',
      name: 'operationNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña débil`
  String get weakPassword {
    return Intl.message(
      'Contraseña débil',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `La contraseña debe contener al menos {length} caracteres`
  String passwordTooShort(Object length) {
    return Intl.message(
      'La contraseña debe contener al menos $length caracteres',
      name: 'passwordTooShort',
      desc: '',
      args: [length],
    );
  }

  /// `La contraseña debe contener máximo {length} caracteres`
  String passwordTooLong(Object length) {
    return Intl.message(
      'La contraseña debe contener máximo $length caracteres',
      name: 'passwordTooLong',
      desc: '',
      args: [length],
    );
  }

  /// `Contraseña no permitida`
  String get invalidPassword {
    return Intl.message(
      'Contraseña no permitida',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `El usuario se ha registrado con éxito`
  String get userSignupSuccess {
    return Intl.message(
      'El usuario se ha registrado con éxito',
      name: 'userSignupSuccess',
      desc: '',
      args: [],
    );
  }

  /// `El usuario ha iniciado sesión con éxito`
  String get userSigninSuccess {
    return Intl.message(
      'El usuario ha iniciado sesión con éxito',
      name: 'userSigninSuccess',
      desc: '',
      args: [],
    );
  }

  /// `REGÍSTRATE`
  String get signup {
    return Intl.message(
      'REGÍSTRATE',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `INICIA SESIÓN`
  String get signin {
    return Intl.message(
      'INICIA SESIÓN',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `El usuario está desactivado`
  String get userDisabled {
    return Intl.message(
      'El usuario está desactivado',
      name: 'userDisabled',
      desc: '',
      args: [],
    );
  }

  /// `El usuario no se encuentra registrado`
  String get userNotFound {
    return Intl.message(
      'El usuario no se encuentra registrado',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `La contraseña es incorrecta`
  String get wrongPassword {
    return Intl.message(
      'La contraseña es incorrecta',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Subir datos`
  String get uploadData {
    return Intl.message(
      'Subir datos',
      name: 'uploadData',
      desc: '',
      args: [],
    );
  }

  /// `Personas populares`
  String get popularPeople {
    return Intl.message(
      'Personas populares',
      name: 'popularPeople',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
