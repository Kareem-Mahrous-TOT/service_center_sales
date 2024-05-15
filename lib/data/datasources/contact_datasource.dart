import '../../core/core.dart';
import '../core/typedefs.dart';

abstract class ContactDataSource {
  FutureEitherFailureOrMap getContacts();
  FutureEitherFailureOrMap changeStatus(
      {required int contactId, required String status});
}

class ContactDataSourceImpl implements ContactDataSource {
  final ApiConsumer _apiConsumer;
  ContactDataSourceImpl({
    required ApiConsumer apiConsumer,
  }) : _apiConsumer = apiConsumer;

  @override
  FutureEitherFailureOrMap getContacts() async {
    final response = await _apiConsumer.get(
      path: EndPoints.contact,
    );
    return response;
  }

  @override
  FutureEitherFailureOrMap changeStatus(
      {required int contactId, required String status}) async {
    final response = await _apiConsumer.put(
      path: "${EndPoints.contact}/contactId/$contactId/status/$status",
      //TODO: add body to changeStatus
      body: {},
    );
    return response;
  }
}
