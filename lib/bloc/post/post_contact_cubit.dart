import 'package:crud/data/modal/contact_vo.dart';
import 'package:crud/data/repository/contact_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_contact_state.dart';

class PostContactCubit extends Cubit<PostContactState> {
  final ContactRepository _contactRepository;

  PostContactCubit(this._contactRepository) : super(PostContactInitialState());

  void addContact(ContactVO contactVO) {
    emit(PostContactLoadingState());
    _contactRepository
        .addContact(contactVO)
        .then((value) => emit(PostContactSuccessState()))
        .catchError((e) => emit(const PostContactFailState('Error Occurred')));
  }
}
