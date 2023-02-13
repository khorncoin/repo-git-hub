part of 'sample1_bloc.dart';

@immutable
abstract class Sample1Event {}

class GetDataEvent extends Sample1Event{
  GetDataEvent();
}

class RemoveDataEvent extends Sample1Event{
  List<Result> data;
  int id;
  RemoveDataEvent(this.data,this.id);
}
