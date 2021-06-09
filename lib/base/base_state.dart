import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends BaseState {}

class LoadingState extends BaseState {}

class ValidationErrorState extends BaseState {}

class UnderConstructionState extends BaseState {}

class SuccessState extends BaseState {
  final dynamic successResponse;

  SuccessState({this.successResponse});

  @override
  List<Object> get props => [successResponse];
}

class FailureState extends BaseState {
  final String errorMessage;

  FailureState({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
