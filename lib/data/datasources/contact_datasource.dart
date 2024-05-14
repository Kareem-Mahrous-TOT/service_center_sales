import '../../core/core.dart';
import '../core/typedefs.dart';

abstract class ContactDataSource {
  FutureEitherFailureOrMap getContactDataSource();
}

class ContactDataSourceImpl implements ContactDataSource {
  final ApiConsumer _apiConsumer;
  ContactDataSourceImpl({
    required ApiConsumer apiConsumer,
  }) : _apiConsumer = apiConsumer;

  @override
  FutureEitherFailureOrMap getContactDataSource() async {
    final response = await _apiConsumer.get(
      path: EndPoints.contact,
    );
    return response;
  }
}
