import 'package:test_app/data/models/contacts/contacts_db.dart';

import 'services_api_provider.dart';
class UserRepository {
  final UserProvider _userProvider = UserProvider();
  Future<List<ContactsList>> getAllContactsList() => _userProvider.getContactsList();
}