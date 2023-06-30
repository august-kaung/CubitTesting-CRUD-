import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crud/data/modal/contact_vo.dart';
import 'package:crud/data/repository/contact_repository.dart';
import 'package:equatable/equatable.dart';

part 'edit_state.dart';

class EditCubit extends Cubit<EditState> {
  final ContactRepository _contactRepository;

  EditCubit(this._contactRepository) : super(EditInitial());

  void editInfo(String id, ContactVO contactVO) {
    emit(EditLoadingState());
    _contactRepository.updateContact(id, contactVO).then((value) =>
        emit(EditSuccessState())).catchError((e)=>emit(const EditFailState('Update Failure')));
  }

}
