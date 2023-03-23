
abstract class AddZkeerState {}

class AddZkeerInitial extends AddZkeerState {}

class AddZkeerLoading extends AddZkeerState {}

class AddZkeerSuccess extends AddZkeerState {}

class AddZkeerFailure extends AddZkeerState {
  final String errMessage;

  AddZkeerFailure(this.errMessage);
}