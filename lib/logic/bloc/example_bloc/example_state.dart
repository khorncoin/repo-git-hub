part of 'example_bloc.dart';

@immutable
abstract class ExampleState {}

class ExampleInitial extends ExampleState {}
class ExampleLoading extends ExampleState {}
class ExampleFailed extends ExampleState {}
class ExampleSuccess extends ExampleState {
   late List<Result> data;
   ExampleSuccess(this.data);
}


