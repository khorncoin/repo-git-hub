import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/sample_model/sameple_model.dart';
import '../../../data/repositories/sample_repository/sample_repository.dart';
import '../../../data/services/sameple_service/sample_service.dart';

part 'sample1_event.dart';
part 'sample1_state.dart';

class Sample1Bloc extends Bloc<Sample1Event, Sample1State> {
  final SampleRepository sampleAPI = SampleService();

  Sample1Bloc() : super(Sample1Initial()) {
    on<GetDataEvent>((event, emit) async {
      emit(Sample1Loading());

      var response = await sampleAPI.getSample();

      emit(response.fold(
          (l) => Sample1Failed(), (r) => Sample1Success(data: r.result)));
    });

    on<RemoveDataEvent>((event, emit) async {
      emit(Sample1Loading());

      List<Result> data = [];
      int id = event.id;

      event.data.forEach((element)  {
        if (element.id != id) {
          data.add(element);
        }
      });

      print("k11ldjsfkdjfl${data.length}");

      emit(Sample1Success(data: data));
    });
  }
}
