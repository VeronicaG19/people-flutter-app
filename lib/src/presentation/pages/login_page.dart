import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/di/providers.dart';
import '../../application/login/login_cubit.dart';
import '../widgets/toasts.dart';
import '../l10n/generated/l10n.dart';
import '../custom_router.dart';
import '../config/const.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _loginCubit = getIt<LoginCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).login),
      ),
      body: BlocProvider(
          create: (context) => _loginCubit,
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              state.registerOrFailure.maybeMap(
                isFailure: (f) => showError(
                  context,
                  message: f.map(
                    unknownError: (_) => S.of(context).unknownError,
                    emailAlreadyInUse: (_) => S.of(context).emailAlreadyInUse,
                    invalidEmail: (_) => S.of(context).invalidEmail,
                    operationNotAllowed: (_) =>
                        S.of(context).operationNotAllowed,
                    weakPassword: (_) => S.of(context).weakPassword,
                  ),
                ),
                isSuccess: () => showSuccess(
                  context,
                  message: S.of(context).userSignupSuccess,
                ),
                orElse: () {},
              );

              state.signinOrFailure.maybeMap(
                isFailure: (f) => showError(
                  context,
                  message: f.map(
                    unknownError: (_) => S.of(context).unknownError,
                    invalidEmail: (_) => S.of(context).invalidEmail,
                    userDisabled: (_) => S.of(context).userDisabled,
                    userNotFound: (_) => S.of(context).userNotFound,
                    wrongPassword: (_) => S.of(context).wrongPassword,
                  ),
                ),
                isSuccess: () {
                  CustomRouter.of(context).replace(const HomePage());
                  showSuccess(
                    context,
                    message: S.of(context).userSigninSuccess,
                  );
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(S.of(context).email),
                  TextFormField(
                    key: const Key(PresConstants.emailInputKey),
                    onChanged: (value) => _loginCubit.onEmailChanged(value),
                    autovalidateMode: state.showError
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    validator: (_) => state.email.map(
                      isLeft: (l) => l.map(
                        invalid: (_) => S.of(context).invalidEmail,
                      ),
                      isRight: (_) => null,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(S.of(context).password),
                  TextFormField(
                    key: const Key(PresConstants.passwordInputKey),
                    onChanged: (value) => _loginCubit.onPasswordChanged(value),
                    autovalidateMode: state.showError
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    validator: (_) => state.password.map(
                      isLeft: (l) => l.map(
                        tooShort: (p) => S.of(context).passwordTooShort(p.min),
                        tooLong: (p) => S.of(context).passwordTooLong(p.max),
                        invalid: (_) => S.of(context).invalidPassword,
                      ),
                      isRight: (_) => null,
                    ),
                  ),
                  const SizedBox(height: 32),
                  state.registerOrFailure.isLoading
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(7),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : ElevatedButton(
                          key: const Key(PresConstants.signupButtonKey),
                          onPressed: () => _loginCubit.register(),
                          child: Text(S.of(context).signup),
                        ),
                  const SizedBox(height: 16),
                  state.signinOrFailure.isLoading
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(7),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : ElevatedButton(
                          key: const Key(PresConstants.signinButtonKey),
                          onPressed: () => _loginCubit.signin(),
                          child: Text(S.of(context).signin),
                        ),
                ],
              );
            },
          )),
    );
  }
}
