import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/example_model.dart';
import '../../../data/repositories/example_repository.dart';
import '../../../data/services/example_service.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {

  final ExampleRepository _repository = ExampleService();

  ExampleBloc() : super(ExampleInitial()) {
    on<GetDataEvent>((event, emit) async {
      emit(ExampleLoading());

      var response = await _repository.getExample();

      emit(response.fold(
              (l) => ExampleFailed(),
              (r) => ExampleSuccess(r.result)
      ));


    });


    on<RemoveItem>((event, emit) async {
      emit(ExampleLoading());

      List<Result> data =[];

      event.data.forEach((element) {



        if(element.id != event.id){
          data.add(element);
        }
      });

      emit(ExampleSuccess(data));



    });
  }
}
