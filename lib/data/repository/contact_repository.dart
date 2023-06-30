import 'package:crud/data/api/contact_api.dart';
import 'package:crud/data/modal/contact_vo.dart';

class ContactRepository {
  final ContactApi contactApi;

  ContactRepository(this.contactApi);

  Future<List<ContactVO>> getContact() => contactApi.getContact();

  Future<ContactVO> addContact(ContactVO contactVO) =>
      contactApi.addContact(contactVO);

  Future<ContactVO> updateContact(String id, ContactVO contactVO) =>
      contactApi.updateContact(id, contactVO);

  Future<ContactVO> deleteContact(String id) => contactApi.deleteContact(id);
}
