import 'download_failure.dart';
import 'person.dart';
import 'resource.dart';
import 'result_or.dart';
import 'upload_failure.dart';

abstract class FirestoreRepository {
  Future<ResultOr<UploadFailure>> uploadPeople({required List<Person> people});

  Future<Resource<DownloadFailure, List<Person>>> downloadPeople();
}
