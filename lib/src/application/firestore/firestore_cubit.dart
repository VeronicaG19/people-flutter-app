import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/download_failure.dart';
import '../../domain/firestore_repository.dart';
import '../../domain/person.dart';
import '../../domain/resource.dart';
import '../../domain/result_or.dart';
import '../../domain/upload_failure.dart';
import '../../domain/description/description.dart';
import '../../domain/name/name.dart';
import '../../domain/rating/rating.dart';
import '../../domain/surname/surname.dart';
import '../../domain/url/url.dart';

part 'firestore_state.dart';

class FirestoreCubit extends Cubit<FirestoreState> {
  FirestoreCubit(this._firestoreRepository) : super(FirestoreState.initial());

  final FirestoreRepository _firestoreRepository;

  Future<void> uploadPeople() async {
    if (!state.uploadPeopleOrFailure.isNone) return;

    final loadingState = state.copyWith(
      uploadPeopleOrFailure: ResultOr.loading(),
    );

    emit(loadingState);

    final _people = <Person>[
      Person(
        imageUrl: Url(
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        ),
        name: Name('Ana'),
        surname: Surname('Rodríguez'),
        rating: Rating(4),
        description: Description('I will blow your mind with my superpower.'),
      ),
      Person(
        imageUrl: Url(
          'https://st.depositphotos.com/1008939/1880/i/950/depositphotos_18807295-stock-photo-portrait-of-handsome-man.jpg',
        ),
        name: Name('Alex'),
        surname: Surname('Ramírez'),
        rating: Rating(5),
        description:
            Description('I am a funny guy. I will make you laugh a lot.'),
      ),
      Person(
        imageUrl: Url(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfuSTDCkFtxG2yl9qDYnHEwV6vF6Y9hkbiuzLmOaVoO_jupwImy1-NmP_kd8LiPzaimI8&usqp=CAU',
        ),
        name: Name('John'),
        surname: Surname('Doe'),
        rating: Rating(3),
        description: Description(
          'I am a writter. I wrote The Blue Sea soap opera.',
        ),
      ),
    ];

    final _uploadResponse =
        await _firestoreRepository.uploadPeople(people: _people);

    final newState = state.copyWith(
      uploadPeopleOrFailure: _uploadResponse,
    );

    emit(newState);

    final cleanState = state.copyWith(
      uploadPeopleOrFailure: ResultOr.none(),
    );

    emit(cleanState);
  }

  Future<void> downloadPeople() async {
    if (state.downloadPeopleOrFailure.isLoading) return;

    final loadingState = state.copyWith(
      downloadPeopleOrFailure: Resource.loading(),
    );

    emit(loadingState);

    final _downloadResponse = await _firestoreRepository.downloadPeople();

    final newState = state.copyWith(
      downloadPeopleOrFailure: _downloadResponse,
    );

    emit(newState);
  }
}
