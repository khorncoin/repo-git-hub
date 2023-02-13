part of 'sample_bloc.dart';

@immutable
abstract class SampleState {}

class SampleInitial extends SampleState {}
class SampleLoadingState extends SampleState {}
class SampleFailState extends SampleState {}
class SampleSuccessState extends SampleState {
   final List<Result?>? data;
  SampleSuccessState(
      {required this.data});

}

