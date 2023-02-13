part of 'example_bloc.dart';

@immutable
abstract class ExampleEvent {}


class GetDataEvent extends ExampleEvent{

  GetDataEvent();
}

class RemoveItem extends ExampleEvent{
  late List<Result> data;
  late int id;
  RemoveItem(this.data,this.id);
}
