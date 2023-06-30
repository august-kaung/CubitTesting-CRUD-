part of 'post_contact_cubit.dart';

abstract class PostContactState extends Equatable {
  const PostContactState();
  @override
  List<Object> get props => [];
}

class PostContactInitialState extends PostContactState {
}
class PostContactLoadingState extends PostContactState{}
class PostContactSuccessState extends PostContactState{


}
class PostContactFailState extends PostContactState{
  final String errorMessage;
  const PostContactFailState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
