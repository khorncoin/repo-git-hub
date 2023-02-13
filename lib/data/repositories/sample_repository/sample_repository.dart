import 'package:dartz/dartz.dart';

import '../../models/network_error_model/network_error_model.dart';
import '../../models/sample_model/sameple_model.dart';

abstract class SampleRepository {
  Future<Either<NetworkErrorModel, Sample1Model>> getSample(
      {int page});
}