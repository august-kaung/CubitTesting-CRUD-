import 'package:crud/data/modal/contact_vo.dart';
import 'package:crud/data/repository/contact_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'getcontact_state.dart';

class GetContactCubit extends Cubit<GetContactState> {
  final ContactRepository _contactRepository;

  GetContactCubit(this._contactRepository) : super(GetContactInitial()) {
    getContact();
  }

  void getContact() {
    emit(GetContactInitial());
    _contactRepository
        .getContact()
        .then((value) => emit(GetContactSuccess(value)))
        .catchError((e) => emit(GetContactError(e)));
  }

  void deleteInfo(String id) {
    _contactRepository
        .deleteContact(id)
        .then((value) => getContact())
        .catchError((e) => emit(const GetContactError('Fail Update')));
  }
}
