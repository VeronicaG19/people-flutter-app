import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/download_failure.dart';
import '../domain/person.dart';
import '../domain/resource.dart';
import '../domain/result_or.dart';
import '../domain/upload_failure.dart';
import '../domain/firestore_repository.dart';
import 'config/const.dart';
import 'person_dto.dart';

class FirestoreRepositoryImpl extends FirestoreRepository {
  FirestoreRepositoryImpl(this._firebaseFirestore);

  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<ResultOr<UploadFailure>> uploadPeople({
    required List<Person> people,
  }) async {
    try {
      await Future.forEach<Person>(
        people,
        (person) => _firebaseFirestore
            .collection(InfConstants.peopleCollection)
            .add(PersonDto.fromDomain(person).toJson()),
      );

      return ResultOr.success();
    } catch (_, __) {
      return ResultOr.failure(UploadFailure.unknownError());
    }
  }

  @override
  Future<Resource<DownloadFailure, List<Person>>> downloadPeople() async {
    try {
      final _snapshot = await _firebaseFirestore
          .collection(InfConstants.peopleCollection)
          .get();

      final _people = _snapshot.docs
          .map((doc) => PersonDto.fromJson(doc.data()).toDomain())
          .toList();

      return Resource.success(_people);
    } catch (_, __) {
      return Resource.failure(DownloadFailure.unknownError());
    }
  }
}
