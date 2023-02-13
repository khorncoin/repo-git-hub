part of 'sample1_bloc.dart';

@immutable
abstract class Sample1State {}

class Sample1Initial extends Sample1State {}

class Sample1Loading extends Sample1State {}
class Sample1Failed extends Sample1State {}
class Sample1Success extends Sample1State {
  final List<Result> data;
  Sample1Success(
      {required this.data});
}

