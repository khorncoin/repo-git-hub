import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:luna/data/models/sample_model/sameple_model.dart';
import 'package:luna/data/services/sameple_service/sample_service.dart';
import 'package:meta/meta.dart';

part 'sample_event.dart';
part 'sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  final sampleAPI = SampleService();
  SampleBloc() : super(SampleInitial()) {

    on<SampleFetchDataEvent>((event, emit) async {
      emit(SampleLoadingState());
      // TODO: implement event handler
      var response = await sampleAPI.getSample();

      emit(response.fold(
            (l) => SampleFailState(),
            (r) => SampleSuccessState(data: r.result)
      ));
    });
  }
}
