import 'dart:async';

import '../../domain/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(AuthState.initial());

  final AuthRepository _authRepository;

  StreamSubscription? _streamSubscription;

  void onAuthStateChanged() {
    _streamSubscription?.cancel();

    _streamSubscription = _authRepository.onAuthStateChanged().listen((user) {
      final newState = state.copyWith(
        user: user,
      );

      emit(newState);
    });
  }
}
