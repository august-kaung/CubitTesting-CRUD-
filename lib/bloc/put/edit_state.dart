part of 'edit_cubit.dart';

abstract class EditState extends Equatable {
  const EditState();
  @override

  List<Object?> get props => [];
}

class EditInitial extends EditState {}
class EditLoadingState extends EditState{}
class EditSuccessState extends EditState{}
class EditFailState extends EditState{
  final String errorMessage;
  const EditFailState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
