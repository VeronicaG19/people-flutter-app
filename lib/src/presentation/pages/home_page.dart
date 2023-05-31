import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_cubit.dart';
import '../../application/firestore/firestore_cubit.dart';
import '../../domain/logout_repository.dart';
import '../../infrastructure/di/providers.dart';
import '../l10n/generated/l10n.dart';
import '../custom_router.dart';
import '../widgets/person_card_widget.dart';
import '../config/const.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _langCode = Localizations.localeOf(context).languageCode;

    final _firestoreCubit = getIt<FirestoreCubit>();

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.user == null) {
          CustomRouter.of(context).replace(
            const LoginPage(),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).hello),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(_langCode.toUpperCase()),
              ),
            ),
            Center(
              child: IconButton(
                key: const Key(PresConstants.signoutButtonKey),
                onPressed: () async => getIt<LogoutRepository>().signout(),
                icon: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => _firestoreCubit.downloadPeople(),
          child: ListView(
            children: [
              BlocProvider(
                create: (_) => _firestoreCubit..downloadPeople(),
                child: BlocBuilder<FirestoreCubit, FirestoreState>(
                  builder: (context, state) => Column(
                    children: [
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          S.of(context).popularPeople,
                          style:
                              Theme.of(context).textTheme.subtitle1?.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      state.downloadPeopleOrFailure.map(
                        isNone: () => const SizedBox.shrink(),
                        isLoading: () => const LinearProgressIndicator(),
                        isSuccess: (people) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: people
                                .map(
                                  (person) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: PersonCardWidget(
                                      person: person,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        isFailure: (_) => Text(S.of(context).unknownError),
                      ),
                      const SizedBox(height: 24),
                      state.uploadPeopleOrFailure.isLoading
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.all(7),
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () => _firestoreCubit.uploadPeople(),
                              child: Text(S.of(context).uploadData),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
