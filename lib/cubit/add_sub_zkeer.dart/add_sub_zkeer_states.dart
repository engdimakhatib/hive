abstract class AddSubZkeerState {}
class AddSubZkeerInitial extends AddSubZkeerState {}

class AddSubZkeerLoading extends AddSubZkeerState {}

class AddSubZkeerSuccess extends AddSubZkeerState {}

class AddSubZkeerFailure extends AddSubZkeerState {
  final String errMessage;

  AddSubZkeerFailure(this.errMessage);
}