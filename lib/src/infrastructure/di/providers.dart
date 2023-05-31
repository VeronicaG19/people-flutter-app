import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../application/auth/auth_cubit.dart';
import '../../application/firestore/firestore_cubit.dart';
import '../../application/login/login_cubit.dart';
import '../../domain/auth_repository.dart';
import '../../domain/firestore_repository.dart';
import '../../domain/login_repository.dart';
import '../../domain/logout_repository.dart';
import '../auth_repository_impl.dart';
import '../firestore_repository_impl.dart';
import '../login_repository_impl.dart';
import '../logout_repository_impl.dart';

final getIt = GetIt.instance;

void getItSetup() {
  // 3RD PARTY LIBRARIES
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  // REPOSITORIES
  getIt.registerSingleton<LoginRepository>(
    LoginRepositoryImpl(getIt<FirebaseAuth>()),
  );
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(getIt<FirebaseAuth>()),
  );
  getIt.registerSingleton<LogoutRepository>(
    LogoutRepositoryImpl(getIt<FirebaseAuth>()),
  );
  getIt.registerSingleton<FirestoreRepository>(
    FirestoreRepositoryImpl(getIt<FirebaseFirestore>()),
  );

  // CUBITS
  getIt.registerFactory<LoginCubit>(() => LoginCubit(
        getIt<LoginRepository>(),
      ));
  getIt.registerSingleton<AuthCubit>(AuthCubit(
    getIt<AuthRepository>(),
  ));
  getIt.registerFactory<FirestoreCubit>(() => FirestoreCubit(
        getIt<FirestoreRepository>(),
      ));
}
