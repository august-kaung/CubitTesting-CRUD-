part of 'getcontact_cubit.dart';

abstract class GetContactState extends Equatable {
  const GetContactState();

  @override
  List<Object?> get props => [];
}

class GetContactInitial extends GetContactState {}

class GetContactLoading extends GetContactState {}

class GetContactSuccess extends GetContactState {
  final List<ContactVO> contactList;

  const GetContactSuccess(this.contactList);

  @override
  List<Object?> get props => [contactList];
}

class GetContactError extends GetContactState {
  final String errorMessage;

  const GetContactError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
