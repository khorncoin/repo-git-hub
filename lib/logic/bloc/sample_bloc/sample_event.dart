part of 'sample_bloc.dart';

@immutable
abstract class SampleEvent {}

class SampleFetchDataEvent extends SampleEvent {

  SampleFetchDataEvent();

}
class RemoveDataEvent extends SampleEvent {

  RemoveDataEvent();

}
