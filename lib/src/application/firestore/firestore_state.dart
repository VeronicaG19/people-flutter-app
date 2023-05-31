part of 'firestore_cubit.dart';

class FirestoreState {
  FirestoreState({
    required this.uploadPeopleOrFailure,
    required this.downloadPeopleOrFailure,
  });

  factory FirestoreState.initial() => FirestoreState(
        uploadPeopleOrFailure: ResultOr.none(),
        downloadPeopleOrFailure: Resource.none(),
      );

  final ResultOr<UploadFailure> uploadPeopleOrFailure;
  final Resource<DownloadFailure, List<Person>> downloadPeopleOrFailure;

  FirestoreState copyWith({
    ResultOr<UploadFailure>? uploadPeopleOrFailure,
    Resource<DownloadFailure, List<Person>>? downloadPeopleOrFailure,
  }) {
    return FirestoreState(
      uploadPeopleOrFailure:
          uploadPeopleOrFailure ?? this.uploadPeopleOrFailure,
      downloadPeopleOrFailure:
          downloadPeopleOrFailure ?? this.downloadPeopleOrFailure,
    );
  }

  @override
  String toString() =>
      'FirestoreState(uploadPeopleOrFailure: $uploadPeopleOrFailure, downloadPeopleOrFailure: $downloadPeopleOrFailure)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FirestoreState &&
        other.uploadPeopleOrFailure == uploadPeopleOrFailure &&
        other.downloadPeopleOrFailure == downloadPeopleOrFailure;
  }

  @override
  int get hashCode =>
      uploadPeopleOrFailure.hashCode ^ downloadPeopleOrFailure.hashCode;
}
